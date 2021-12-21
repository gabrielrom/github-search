import Foundation
import UIKit

extension PullRequestsViewController {
  
  func addGoBackViewConstraints() {
    NSLayoutConstraint.activate([
      goBackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
      goBackView.centerYAnchor.constraint(equalTo: headerView.centerYAnchor, constant: -5),
      goBackView.heightAnchor.constraint(equalToConstant: 17),
      goBackView.widthAnchor.constraint(equalToConstant: 10)
    ])
  }
  
}
