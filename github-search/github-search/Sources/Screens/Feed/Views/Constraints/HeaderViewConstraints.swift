import UIKit

extension HeaderView {
  
  func addIconConstraints() {
    NSLayoutConstraint.activate([
      icon.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor, constant: 10),
      icon.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor, constant: 10),
      icon.bottomAnchor.constraint(equalTo: self.layoutMarginsGuide.bottomAnchor, constant: -14)
    ])
  }
  
  func addFirstTextConstraints() {
    NSLayoutConstraint.activate([
      firstText.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 9),
      firstText.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor, constant: 10),
      firstText.bottomAnchor.constraint(equalTo: self.layoutMarginsGuide.bottomAnchor, constant: -10)
    ])
  }
  
  func addSecondTextConstraints() {
    NSLayoutConstraint.activate([
      secondText.leadingAnchor.constraint(equalTo: firstText.trailingAnchor, constant: 4),
      secondText.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor, constant: 10),
      secondText.bottomAnchor.constraint(equalTo: self.layoutMarginsGuide.bottomAnchor, constant: -10),
      secondText.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor, constant: -10)
    ])
  }
  
}
