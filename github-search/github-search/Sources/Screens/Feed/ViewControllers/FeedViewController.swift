import Foundation
import UIKit

class FeedViewController: UIViewController {
  lazy var headerView = { return HeaderView() }()
  
  override func loadView() {
    view = InitialView()
    view.addSubview(headerView)
    
    addHeaderViewConstraints()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
}
