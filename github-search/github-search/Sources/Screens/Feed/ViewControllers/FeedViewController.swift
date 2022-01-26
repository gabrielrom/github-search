import Foundation
import UIKit
import VegaScrollFlowLayout
import RxSwift
import RxCocoa
import Kingfisher

class FeedViewController: UIViewController {
  lazy var headerView = { return HeaderView() }()
  lazy var reposCollectionView: CustomCollectionView = {
    var flowLayout = VegaScrollFlowLayout()
    
    flowLayout.minimumLineSpacing = 20
        
    var collectionView = CustomCollectionView(
      frame: .zero,
      collectionViewLayout: flowLayout
    )
    
    collectionView.register(
      CustomCellView.self,
      forCellWithReuseIdentifier: "RepoCell")
    
    collectionView.delegate = self
    
    return collectionView
  }()
  
  lazy var loadingAnimationView: LoadingAnimationView = { return LoadingAnimationView() }()
  
  var repositoriesViewModel = RepositoriesViewModel(
    repositoriesService: AlamofireService()
  )
  
  var disposeBag = DisposeBag()
  var paginationCount = 1
  
  override func loadView() {
    view = InitialView()
    
    view.addSubview(headerView)
    view.addSubview(reposCollectionView)
    view.addSubview(loadingAnimationView)
    
    HeaderViewSharedConstraints.centerHeaderOfView(
      headerView: headerView,
      superView: view
    )
    
    CollectionViewSharedConstraints.addCollectionViewConstraints(
      collectionView: reposCollectionView,
      viewTop: headerView,
      superView: view
    )
    
    LoadingAnimationSharedConstraints.addLoadingAnimationViewConstraints(
      loadingView: loadingAnimationView,
      superView: view)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    bindLoadingAnimation()
    bindCollectionData()
    setNotification()
  }
  
  func bindCollectionData() {
    repositoriesViewModel.repositories.asObservable().bind(
      to: reposCollectionView.rx.items(
        cellIdentifier: "RepoCell",
        cellType: CustomCellView.self)
    ) { row, model, cell in
      cell.imageOwner.kf.setImage(
        with: URL(string: model.owner.avatar_url),
        placeholder: UIImage(named: "Default-Image"),
        options: [
          .cacheMemoryOnly,
          .transition(.fade(1)),
          .scaleFactor(UIScreen.main.scale)
        ])
      
      cell.repoName.text = model.full_name
      cell.descriptionRepo.text = model.description ?? "No description"
      cell.countNumbersOfStars.text = String(model.stargazers_count)
      cell.countNumbersOfForks.text = String(model.forks_count)
      cell.countsNumbersOfWatchers.text = String(model.watchers_count)
    }.disposed(by: disposeBag)
    
    reposCollectionView.rx.modelSelected(Repository.self).bind { cell in
      var pullRequestPage = PullRequestsViewController()
      let repoCredentials = cell.full_name.split(separator: "/")
      
      pullRequestPage.ownerRepo = String(repoCredentials[0])
      pullRequestPage.repoName = String(repoCredentials[1])
      
      self.navigationController?.setNavigationBarHidden(true, animated: false)
      self.navigationController?.pushViewController(pullRequestPage, animated: true)
    }
    
    repositoriesViewModel.fetchItems()
  }
  
  func bindLoadingAnimation() {
    _ = repositoriesViewModel.isDataLoaded.asObservable().bind(onNext: { value in
      if value {
        self.loadingAnimationView.removeFromSuperview()
      }
    })
  }
  
  func setNotification() {
    let content = UNMutableNotificationContent()
  
    content.title = NSString.localizedUserNotificationString(forKey: "Wake Up!", arguments: nil)
    content.body = NSString.localizedUserNotificationString(forKey: "Rise and shine! It's morning time!", arguments: ["Hello again"])
//    content.categoryIdentifier = "TIMER_EXPIRED"
    
    var dateInfo = DateComponents()
    dateInfo.second = 1
    
    let trigger = UNCalendarNotificationTrigger(dateMatching: dateInfo, repeats: false)
    
    let request = UNNotificationRequest(
      identifier: "Morning Alarm",
      content: content,
      trigger: trigger
    )
    
    let center = UNUserNotificationCenter.current()
    center.add(request) { (error: Error?) in
      
      if let theError = error {
        print("Error in local notification: " + theError.localizedDescription)
      }
      
    }
    
    
  }
}

extension FeedViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    sizeForItemAt indexPath: IndexPath) -> CGSize {
      
      return CGSize(width: self.reposCollectionView.frame.width, height: 191)
  }
  
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    let scrollOffsetY = scrollView.contentOffset.y + 300
    let scrollContentSizeHeight = scrollView.contentSize.height - scrollView.frame.height
    
    if scrollOffsetY > scrollContentSizeHeight && !repositoriesViewModel.loadingMoreData {
      paginationCount += 1
      
      repositoriesViewModel.getMoreRepositories(page: paginationCount)
    }
  }
  
}

