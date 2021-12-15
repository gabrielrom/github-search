import UIKit
extension FeedViewController {
  func addHeaderViewConstraints() {
    NSLayoutConstraint.activate([
      headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      headerView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
    ])
  }
}
