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
    
    addHeaderViewConstraints()
    addRepoCollectionViewConstraints()
    addLoadingAnimationViewConstraints()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    bindLoadingAnimation()
    bindCollectionData()
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
    
    repositoriesViewModel.fetchItems()
  }
  
  func bindLoadingAnimation() {
    _ = repositoriesViewModel.isDataLoaded.asObservable().bind(onNext: { value in
      if value {
        self.loadingAnimationView.removeFromSuperview()
      }
    })
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

