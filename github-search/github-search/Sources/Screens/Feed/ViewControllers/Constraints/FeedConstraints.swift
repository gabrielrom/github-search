import UIKit

extension FeedViewController {
  func addHeaderViewConstraints() {
    NSLayoutConstraint.activate([
      headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      headerView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
    ])
  }
  
  func addRepoCollectionViewConstraints() {
    NSLayoutConstraint.activate([
      reposCollectionView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 10),
      reposCollectionView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 10),
      reposCollectionView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -10),
      reposCollectionView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor)
    ])
  }
}
