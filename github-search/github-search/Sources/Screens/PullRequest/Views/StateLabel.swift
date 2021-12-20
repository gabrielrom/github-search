import Foundation
import UIKit

class StateLabel: UIView {
  lazy var stateTitle: UILabel = { return UILabel() }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    loadView()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    loadView()
  }
  
  private func loadView() {
    self.translatesAutoresizingMaskIntoConstraints = false
    self.backgroundColor = UIColor(named: "State-Closed-BackgroundColor")!
    self.layer.cornerRadius = 14
    
    addSubview(stateTitle)
    
    setStateTitleStyles()
    setStateTitleConstraints()
  }
  
  private func setStateTitleStyles() {
    stateTitle.translatesAutoresizingMaskIntoConstraints = false
    
    stateTitle.attributedText = NSAttributedString(
      string: "CLOSED",
      attributes: [
        .font: UIFont(name: "Roboto-Bold", size: 9)!,
        .foregroundColor: UIColor(named: "State-Closed-Color")!
      ]
    )
  }
  
  private func setStateTitleConstraints() {
    NSLayoutConstraint.activate([
      stateTitle.centerYAnchor.constraint(equalTo: self.centerYAnchor),
      stateTitle.centerXAnchor.constraint(equalTo: self.centerXAnchor)
    ])
  }
  
}
