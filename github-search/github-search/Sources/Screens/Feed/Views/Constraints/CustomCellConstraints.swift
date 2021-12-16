import Foundation
import UIKit

extension CustomCellView {
  
  func setImageOwnerConstraints() {
    NSLayoutConstraint.activate([
      imageOwner.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
      imageOwner.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
    ])
  }
  
  func setRepoNameConstraints() {
    NSLayoutConstraint.activate([
      repoName.centerYAnchor.constraint(equalTo: imageOwner.centerYAnchor),
      repoName.leadingAnchor.constraint(equalTo: imageOwner.trailingAnchor, constant: 14)
    ])
  }

  func setDescriptionRepoConstraints() {
    NSLayoutConstraint.activate([
      descriptionRepo.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 22),
      descriptionRepo.topAnchor.constraint(equalTo: spacingView.bottomAnchor, constant: 10),
      descriptionRepo.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20)
    ])
  }

  func setIconStarsConstraints() {
    NSLayoutConstraint.activate([
      iconStars.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
      iconStars.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -35),
    ])
  }

  func setCountNumbersOfStarsConstraints() {
    NSLayoutConstraint.activate([
      countNumbersOfStars.leadingAnchor.constraint(equalTo: iconStars.trailingAnchor, constant: 6),
      countNumbersOfStars.centerYAnchor.constraint(equalTo: iconStars.centerYAnchor)
    ])
  }

  func setIconForksConstraints() {
    NSLayoutConstraint.activate([
      iconForks.leadingAnchor.constraint(equalTo: countNumbersOfStars.trailingAnchor, constant: 36),
      iconForks.centerYAnchor.constraint(equalTo: iconStars.centerYAnchor, constant: 1)
    ])
  }

  func setCountNumbersOfForksConstraints() {
    NSLayoutConstraint.activate([
      countNumbersOfForks.leadingAnchor.constraint(equalTo: iconForks.trailingAnchor, constant: 6),
      countNumbersOfForks.centerYAnchor.constraint(equalTo: iconForks.centerYAnchor)
    ])
  }

  func setIconWatchersConstraints() {
    NSLayoutConstraint.activate([
      iconWatchers.leadingAnchor.constraint(equalTo: countNumbersOfForks.trailingAnchor, constant: 36),
      iconWatchers.centerYAnchor.constraint(equalTo: iconStars.centerYAnchor, constant: 2)
    ])
  }

  func setCountNumbersOfWatchersConstraints() {
    NSLayoutConstraint.activate([
      countsNumbersOfWatchers.leadingAnchor.constraint(equalTo: iconWatchers.trailingAnchor, constant: 6),
      countsNumbersOfWatchers.centerYAnchor.constraint(equalTo: iconWatchers.centerYAnchor)
    ])
  }
  
  func setSpacingViewConstraints() {
    NSLayoutConstraint.activate([
      spacingView.topAnchor.constraint(equalTo: imageOwner.bottomAnchor, constant: 20),
      spacingView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
      spacingView.heightAnchor.constraint(equalToConstant: 1),
      spacingView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20)
    ])
  }
}
