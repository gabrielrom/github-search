import Foundation
import UIKit

class InitialView: UIView {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    loadView()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    loadView()
  }
  
  private func loadView() {
    self.bounds = UIScreen.main.bounds
    self.backgroundColor = UIColor(named: "Background-Color")
  }
  
}
