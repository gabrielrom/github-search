import Foundation
import UIKit

class GoBackView: UIControl {
  lazy var iconArrow: UIImageView = {
    return UIImageView(image: UIImage(named: "Icon-arrow"))
  }()
  
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
    
    addSubview(iconArrow)
  }
  
}
