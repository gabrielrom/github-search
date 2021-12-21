import Foundation
import UIKit
import Lottie

class LoadingAnimationView: UIView {
  var animationView: AnimationView!
  
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
    
    animationView = .init(name: "github-loading")
    animationView?.loopMode = .loop
    
    addSubview(animationView)
    
    animationView?.play()
  }
  
}
