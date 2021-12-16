import Foundation
import UIKit

class CustomCellView: UICollectionViewCell {
  lazy var imageOwner: UIImageView = { return UIImageView() }()
  lazy var repoName: UILabel = { return UILabel() }()
  lazy var descriptionRepo: UILabel = { return UILabel() }()
  lazy var iconStars: UIImageView = { return UIImageView() }()
  lazy var iconForks: UIImageView = { return UIImageView() }()
  lazy var iconWatchers: UIImageView = { return UIImageView() }()
  
  lazy var countNumbersOfStars: UILabel = { return UILabel() }()
  lazy var countNumbersOfForks: UILabel = { return UILabel() }()
  lazy var countsNumbersOfWatchers: UILabel = { return UILabel() }()
  
  lazy var spacingView: UIView = { return UIView() }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    loadView()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    loadView()
  }
  
  private func loadView() {
    self.backgroundColor = UIColor(named: "Background-Card")
    self.layer.cornerRadius = 5
    
    setStylesImageOwner()
    setStylesRepoName()
    setStylesDescriptionRepo()
    setStylesIconStars()
    setStylesNumberOfStars()
    setStylesIconForks()
    setStylesNumberOfForks()
    setStylesIconWatchers()
    setStylesNumberOfWatchers()
    setStylesSpacingView()
    
    addSubview(imageOwner)
    addSubview(repoName)
    addSubview(descriptionRepo)
    addSubview(iconStars)
    addSubview(iconForks)
    addSubview(iconWatchers)
    addSubview(countNumbersOfStars)
    addSubview(countNumbersOfForks)
    addSubview(countsNumbersOfWatchers)
    addSubview(spacingView)
    
    setImageOwnerConstraints()
    setRepoNameConstraints()
    setDescriptionRepoConstraints()
    setIconStarsConstraints()
    setCountNumbersOfStarsConstraints()
    setIconForksConstraints()
    setCountNumbersOfForksConstraints()
    setIconWatchersConstraints()
    setCountNumbersOfWatchersConstraints()
    setSpacingViewConstraints()
  }
  
}

extension CustomCellView {
  
  private func setStylesImageOwner() {
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
  
  private func setStylesRepoName() {
    repoName.translatesAutoresizingMaskIntoConstraints = false
    
    repoName.numberOfLines = 0
    repoName.attributedText = NSAttributedString(
      string: "gabrielrom/ourbank",
      attributes: [
        .font: UIFont(name: "Roboto-Bold", size: 14)!,
        .foregroundColor: UIColor(named: "Primary-Text-Color")!
    ])
  }
  
  private func setStylesDescriptionRepo() {
    descriptionRepo.translatesAutoresizingMaskIntoConstraints = false
    
    descriptionRepo.numberOfLines = 3
    descriptionRepo.attributedText = NSAttributedString(
      string: "Lorem Ipsum é simplesmente uma simulação de texto da indústria tipográfica e de impressos, e vem sendo utilizado desde o século XVI, quando um",
      attributes: [
        .font: UIFont(name: "Roboto-Bold", size: 12)!,
        .foregroundColor: UIColor(named: "Secondary-Text-Color")!
    ])
  }
  
  private func setStylesIconStars() {
    iconStars.translatesAutoresizingMaskIntoConstraints = false
    
    iconStars.image = UIImage(named: "Star-Icon")
    
    iconStars.contentMode = .scaleToFill
    iconStars.backgroundColor = .none
  
  }
  
  private func setStylesIconForks() {
    iconForks.translatesAutoresizingMaskIntoConstraints = false
    
    iconForks.image = UIImage(named: "Fork-Icon")
    
    iconForks.contentMode = .scaleToFill
    iconForks.backgroundColor = .none
  }
  
  private func setStylesIconWatchers() {
    iconWatchers.translatesAutoresizingMaskIntoConstraints = false
    
    iconWatchers.image = UIImage(named: "Watch-Icon")
    
    iconWatchers.contentMode = .scaleToFill
    iconWatchers.backgroundColor = .none
  }
  
  private func setStylesNumberOfStars() {
    countNumbersOfStars.translatesAutoresizingMaskIntoConstraints = false
    
    countNumbersOfStars.attributedText = NSAttributedString(
      string: "2.1k",
      attributes: [
        .font: UIFont(name: "Roboto-Bold", size: 12)!,
        .foregroundColor: UIColor(named: "Secondary-Text-Color")!
    ])
  }
  
  private func setStylesNumberOfForks() {
    countNumbersOfForks.translatesAutoresizingMaskIntoConstraints = false
    
    countNumbersOfForks.attributedText = NSAttributedString(
      string: "100",
      attributes: [
        .font: UIFont(name: "Roboto-Bold", size: 12)!,
        .foregroundColor: UIColor(named: "Secondary-Text-Color")!
    ])
  }
  
  private func setStylesNumberOfWatchers() {
    countsNumbersOfWatchers.translatesAutoresizingMaskIntoConstraints = false
    
    countsNumbersOfWatchers.attributedText = NSAttributedString(
      string: "5",
      attributes: [
        .font: UIFont(name: "Roboto-Bold", size: 12)!,
        .foregroundColor: UIColor(named: "Secondary-Text-Color")!
    ])
  }
  
  private func setStylesSpacingView() {
    spacingView.translatesAutoresizingMaskIntoConstraints = false
    
    spacingView.backgroundColor = UIColor(
      named: "Spacing-Color"
    )
  }
  
}
