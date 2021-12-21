import Foundation
import UIKit

final class CollectionViewSharedConstraints {
  
  static func addCollectionViewConstraints(collectionView: CustomCollectionView, viewTop: UIView, superView: UIView) {
    NSLayoutConstraint.activate([
      collectionView.topAnchor.constraint(equalTo: viewTop.bottomAnchor, constant: 10),
      collectionView.leadingAnchor.constraint(equalTo: superView.layoutMarginsGuide.leadingAnchor, constant: 10),
      collectionView.trailingAnchor.constraint(equalTo: superView.layoutMarginsGuide.trailingAnchor, constant: -10),
      collectionView.bottomAnchor.constraint(equalTo: superView.layoutMarginsGuide.bottomAnchor)
    ])
  }
  
}
