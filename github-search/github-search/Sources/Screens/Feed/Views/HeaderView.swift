import Foundation
import UIKit

class HeaderView: UIView {
  lazy var icon: UIImageView! = {
    var imageView = UIImageView()
    imageView.image = UIImage(named: "Github-Icon")
    return imageView
  }()
  
  lazy var firstText: UILabel! = { return UILabel() }()
  lazy var secondText: UILabel! = { return UILabel() }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    loadView()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    loadView()
  }
  
  private func loadView() {
    self.backgroundColor = .none
    self.translatesAutoresizingMaskIntoConstraints = false
    icon.translatesAutoresizingMaskIntoConstraints = false
    
    setStyleFirstText()
    setStyleSecondText()
    
    addSubview(icon)
    addSubview(firstText)
    addSubview(secondText)
    
    addIconConstraints()
    addFirstTextConstraints()
    addSecondTextConstraints()
  }
  
  private func setStyleFirstText() {
    firstText.translatesAutoresizingMaskIntoConstraints = false
    
    firstText.attributedText = NSAttributedString(
      string: "Your",
      attributes: [
        .font: UIFont(name: "Roboto-Regular", size: 18)!,
        .foregroundColor: UIColor(named: "Secondary-Text-Color")!
      ]
    )
    
  }
  
  private func setStyleSecondText() {
    secondText.translatesAutoresizingMaskIntoConstraints = false
    
    secondText.attributedText = NSAttributedString(
      string: "Feed",
      attributes: [
        .font: UIFont(name: "Roboto-Bold", size: 18)!,
        .foregroundColor: UIColor(named: "Primary-Text-Color")!
      ]
    )
  }
}
