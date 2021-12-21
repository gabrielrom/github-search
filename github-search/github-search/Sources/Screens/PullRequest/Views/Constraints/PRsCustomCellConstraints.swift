import Foundation
import UIKit

extension PRsCustomCell {
  func setPullRequestOwnerNameConstraints() {
    NSLayoutConstraint.activate([
      ownerName.leadingAnchor.constraint(equalTo: imageOwner.trailingAnchor, constant: 14),
      ownerName.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 24)
    ])
  }
  
  func setPullRequestNameConstraints() {
    NSLayoutConstraint.activate([
      pullRequestName.leadingAnchor.constraint(equalTo: imageOwner.trailingAnchor, constant: 14),
      pullRequestName.topAnchor.constraint(equalTo: ownerName.safeAreaLayoutGuide.bottomAnchor, constant: 2),
      pullRequestName.trailingAnchor.constraint(equalTo: pullRequestDate.leadingAnchor, constant: -4)
    ])
  }
  
  func setPullRequestDateConstraints() {
    NSLayoutConstraint.activate([
      pullRequestDate.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
      pullRequestDate.topAnchor.constraint(equalTo: imageOwner.topAnchor),
      pullRequestDate.widthAnchor.constraint(equalToConstant: 42)
    ])
  }
  
  func setStateLabelConstraints() {
    NSLayoutConstraint.activate([
      stateLabel.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -15),
      stateLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
      stateLabel.widthAnchor.constraint(equalToConstant: 67),
      stateLabel.heightAnchor.constraint(equalToConstant: 29)
    ])
  }
  
  func setMergedLabelConstraints() {
    NSLayoutConstraint.activate([
      mergedLabel.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -15),
      mergedLabel.leadingAnchor.constraint(equalTo: stateLabel.trailingAnchor, constant: 14),
      mergedLabel.centerYAnchor.constraint(equalTo: stateLabel.centerYAnchor),
      mergedLabel.widthAnchor.constraint(equalToConstant: 67),
      mergedLabel.heightAnchor.constraint(equalToConstant: 29)
    ])
  }
}
