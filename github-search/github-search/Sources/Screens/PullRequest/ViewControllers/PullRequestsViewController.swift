import Foundation
import UIKit
import VegaScrollFlowLayout
import RxSwift
import RxCocoa
import Kingfisher

class PullRequestsViewController: UIViewController {
  var ownerRepo: String = ""
  var repoName: String = ""
  
  lazy var headerView: HeaderView = {
    var header = HeaderView()
    
    header.icon.image = nil
    header.firstText.text = "Pull"
    header.secondText.text = "Requests"
    
    return header
  }()
  
  lazy var goBackView: GoBackView = { return GoBackView() }()
  lazy var collectionView: CustomCollectionView = {
    var flowLayout = VegaScrollFlowLayout()
    
    flowLayout.minimumLineSpacing = 20
        
    var collectionView = CustomCollectionView(
      frame: .zero,
      collectionViewLayout: flowLayout
    )
    
    collectionView.register(PRsCustomCell.self, forCellWithReuseIdentifier: "PRsCell")
    
    collectionView.delegate = self
    
    return collectionView
  }()
  
  lazy var loadingAnimationView: LoadingAnimationView = { return LoadingAnimationView() }()
  
  var pullRequestsViewModel = PullRequestViewModel(
    pullRequestService: AlamofireService()
  )
  
  var disposeBag = DisposeBag()
  var paginationCount = 1
  
  override func loadView() {
    view = InitialView()
    
    view.addSubview(headerView)
    view.addSubview(goBackView)
    view.addSubview(collectionView)
    view.addSubview(loadingAnimationView)
    
    HeaderViewSharedConstraints.centerHeaderOfView(
      headerView: headerView,
      superView: view
    )
    
    CollectionViewSharedConstraints.addCollectionViewConstraints(
      collectionView: collectionView,
      viewTop: headerView,
      superView: view
    )
    
    addGoBackViewConstraints()
    LoadingAnimationSharedConstraints.addLoadingAnimationViewConstraints(
      loadingView: loadingAnimationView,
      superView: view)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    goBackView.addTarget(
      self,
      action: #selector(goToHome),
      for: .touchUpInside
    )
    
    bindCollectionData()
    bindLoadingAnimation()
  }
  
  func bindCollectionData() {
    pullRequestsViewModel.pullRequests.asObservable().bind(
      to: collectionView.rx.items(cellIdentifier: "PRsCell", cellType: PRsCustomCell.self)
    ) { row, model, cell in
      cell.imageOwner.kf.setImage(
        with: URL(string: model.user.avatar_url),
        placeholder: UIImage(named: "Default-Image"),
        options: [
          .cacheMemoryOnly,
          .transition(.fade(1)),
          .scaleFactor(UIScreen.main.scale)
        ])
      
      cell.ownerName.text = model.user.login
      cell.pullRequestName.text = model.title
      cell.descriptionPullRequest.text = model.body.isEmpty ? "No Body" : model.body
      cell.pullRequestDate.text = self.pullRequestsViewModel.formatStringPullRequestDate(date: model.created_at)
      
      if model.state == "open" {
        cell.stateLabel.stateTitle.text = "OPEN"
        cell.stateLabel.stateTitle.textColor = UIColor(named: "State-Open-Color")
        cell.stateLabel.backgroundColor = UIColor(named: "State-Open-BackgroundColor")
      }
      
      else if model.state == "closed" {
        cell.stateLabel.stateTitle.text = "CLOSED"
        cell.stateLabel.stateTitle.textColor = UIColor(named: "State-Closed-Color")
        cell.stateLabel.backgroundColor = UIColor(named: "State-Closed-BackgroundColor")
      }
      
      if model.merged_at == nil {
        cell.mergedLabel.isHidden = true
      } else {
        cell.mergedLabel.isHidden = false
      }
      
    }.disposed(by: disposeBag)
    
    _ = collectionView.rx.modelSelected(PullRequests.self).bind { cell in
      if let link = URL(string: cell.html_url) {
        UIApplication.shared.open(link)
      }
    }
    
    pullRequestsViewModel.fetchItems(
      ownerRepo: ownerRepo,
      repoName: repoName
    )
  }
  
  func bindLoadingAnimation() {
    _ = pullRequestsViewModel.isDataLoaded.asObservable().bind(onNext: { value in
      if value {
        self.loadingAnimationView.removeFromSuperview()
      }
    })
  }
}

extension PullRequestsViewController {
  @objc func goToHome() {
    self.navigationController?.popToRootViewController(animated: true)
  }
}

extension PullRequestsViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    sizeForItemAt indexPath: IndexPath) -> CGSize {
      
      return CGSize(width: self.collectionView.frame.width, height: 191)
  }
  
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    let scrollOffsetY = scrollView.contentOffset.y + 300
    let scrollContentSizeHeight = scrollView.contentSize.height - scrollView.frame.height
    
    if scrollOffsetY > scrollContentSizeHeight && !pullRequestsViewModel.loadingMoreData {
      paginationCount += 1
      
      pullRequestsViewModel.getMorePullRequests(
        ownerRepo: ownerRepo,
        repoName: repoName,
        page: paginationCount)
    }
  }
  
}


