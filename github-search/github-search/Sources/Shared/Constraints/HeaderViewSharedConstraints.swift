import Foundation
import UIKit

final class HeaderViewSharedConstraints {
  
  static func centerHeaderOfView(headerView: HeaderView, superView: UIView) {
    NSLayoutConstraint.activate([
      headerView.topAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.topAnchor),
      headerView.centerXAnchor.constraint(equalTo: superView.centerXAnchor)
    ])
  }
  
}
