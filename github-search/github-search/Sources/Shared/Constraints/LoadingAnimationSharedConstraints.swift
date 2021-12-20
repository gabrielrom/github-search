import Foundation
import UIKit

final class LoadingAnimationSharedConstraints {
  
  static func addLoadingAnimationViewConstraints(loadingView: LoadingAnimationView, superView: UIView) {
    NSLayoutConstraint.activate([
      loadingView.heightAnchor.constraint(equalToConstant: 87),
      loadingView.widthAnchor.constraint(equalToConstant: 87),
      loadingView.centerXAnchor.constraint(equalTo: superView.centerXAnchor, constant: -15),
      loadingView.centerYAnchor.constraint(equalTo: superView.centerYAnchor)
    ])
  }
  
}
