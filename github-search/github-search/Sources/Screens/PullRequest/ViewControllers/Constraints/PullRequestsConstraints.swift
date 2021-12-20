import Foundation
import UIKit

extension PullRequestsViewController {
  
  func addGoBackViewConstraints() {
    NSLayoutConstraint.activate([
      goBackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
      goBackView.centerYAnchor.constraint(equalTo: headerView.centerYAnchor, constant: -11),
    ])
  }
  
}
