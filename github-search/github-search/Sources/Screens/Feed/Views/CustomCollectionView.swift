import Foundation
import UIKit

class CustomCollectionView: UICollectionView {
  var cellIdentifier: String? = "RepoCell"
  var countRow: Int?
  
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
    self.dataSource = self
    self.delegate = self
    self.backgroundColor = .none
    
    self.register(CustomCellView.self, forCellWithReuseIdentifier: cellIdentifier!)
  }
  
}

extension CustomCollectionView: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return countRow ?? 0
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(
      withReuseIdentifier: cellIdentifier!,
      for: indexPath
    ) as! CustomCellView
    
    return cell
  }
}

extension CustomCollectionView: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    sizeForItemAt indexPath: IndexPath) -> CGSize {
      
    return CGSize(width: self.frame.width, height: 191)
  }
  
}
