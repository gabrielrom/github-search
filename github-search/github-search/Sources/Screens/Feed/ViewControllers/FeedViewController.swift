import Foundation
import UIKit
import VegaScrollFlowLayout

class FeedViewController: UIViewController {
  lazy var headerView = { return HeaderView() }()
  lazy var reposCollectionView: CustomCollectionView = {
    var flowLayout = VegaScrollFlowLayout()
    
    flowLayout.minimumLineSpacing = 20
        
    var collectionView = CustomCollectionView(
      frame: .zero,
      collectionViewLayout: flowLayout
    )

    collectionView.countRow = 20
    collectionView.cellIdentifier = "RepoCell"
    
    return collectionView
  }()
  
  override func loadView() {
    view = InitialView()
    view.addSubview(headerView)
    view.addSubview(reposCollectionView)
    
    addHeaderViewConstraints()
    addRepoCollectionViewConstraints()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
}
