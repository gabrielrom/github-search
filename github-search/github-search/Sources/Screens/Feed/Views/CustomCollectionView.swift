import Foundation
import UIKit

class CustomCollectionView: UICollectionView {
  var cellIdentifier: String? = "RepoCell"
  
  override init(
    frame: CGRect,
    collectionViewLayout layout: UICollectionViewLayout
  ) {
    super.init(frame: frame, collectionViewLayout: layout)
    loadView()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    loadView()
  }
  
  private func loadView() {
    self.translatesAutoresizingMaskIntoConstraints = false
    self.backgroundColor = .none
  }
}
