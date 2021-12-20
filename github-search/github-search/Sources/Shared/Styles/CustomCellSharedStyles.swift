import Foundation
import UIKit

final class CustomCellSharedStyles {
  static func setStylesImageOwner(imageOwner: UIImageView) {
    imageOwner.translatesAutoresizingMaskIntoConstraints = false
    
    imageOwner.frame = CGRect(
      x: 0,
      y: 0,
      width: 41,
      height: 41
    )
    
    imageOwner.contentMode = .scaleToFill
    imageOwner.image = UIImage(named: "Default-Image")
    imageOwner.layer.masksToBounds = false
    imageOwner.layer.cornerRadius = imageOwner.frame.height / 2
    imageOwner.clipsToBounds = true
  }
  
  static func setStylesDescriptionRepo(description: UILabel) {
    description.translatesAutoresizingMaskIntoConstraints = false
    
    description.numberOfLines = 3
    description.attributedText = NSAttributedString(
      string: "Lorem Ipsum é simplesmente uma simulação de texto da indústria tipográfica e de impressos, e vem sendo utilizado desde o século XVI, quando um",
      attributes: [
        .font: UIFont(name: "Roboto-Bold", size: 12)!,
        .foregroundColor: UIColor(named: "Secondary-Text-Color")!
    ])
  }
  
  static func setStylesSpacingView(spacingView: UIView) {
    spacingView.translatesAutoresizingMaskIntoConstraints = false
    
    spacingView.backgroundColor = UIColor(
      named: "Spacing-Color"
    )
  }
}
