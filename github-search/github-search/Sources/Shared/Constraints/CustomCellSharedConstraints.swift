import Foundation
import UIKit

final class CustomCellSharedConstraints {
    
  static func setImageOwnerConstraints(imageView: UIImageView, superView: UIView) {
    NSLayoutConstraint.activate([
      imageView.leadingAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.leadingAnchor, constant: 20),
      imageView.topAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.topAnchor, constant: 20),
      imageView.heightAnchor.constraint(equalToConstant: 41),
      imageView.widthAnchor.constraint(equalToConstant: 41)
    ])
  }
  
  static func setDescriptionConstraints(descriptionView: UILabel, spacingView: UIView, superView: UIView) {
    NSLayoutConstraint.activate([
      descriptionView.leadingAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.leadingAnchor, constant: 22),
      descriptionView.topAnchor.constraint(equalTo: spacingView.bottomAnchor, constant: 10),
      descriptionView.trailingAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.trailingAnchor, constant: -20)
    ])
  }
  
  static func setSpacingViewConstraints(spacingView: UIView, imageView: UIImageView, superView: UIView) {
    NSLayoutConstraint.activate([
      spacingView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
      spacingView.leadingAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.leadingAnchor, constant: 20),
      spacingView.heightAnchor.constraint(equalToConstant: 1),
      spacingView.trailingAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.trailingAnchor, constant: -20)
    ])
  }
  
}

