import Foundation
import UIKit

class PRsCustomCell: UICollectionViewCell {
  lazy var imageOwner: UIImageView = { return UIImageView() }()
  lazy var ownerName: UILabel = { return UILabel() }()
  lazy var pullRequestName: UILabel = { return UILabel() }()
  lazy var descriptionPullRequest: UILabel = { return UILabel() }()
  lazy var pullRequestDate: UILabel = { return UILabel() }()
  
  lazy var spacingView: UIView = { return UIView() }()
  
  lazy var stateLabel: StateLabel = { return StateLabel() }()
  lazy var mergedLabel: StateLabel = { return StateLabel() }()
  
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
    
    CustomCellSharedStyles.setStylesImageOwner(imageOwner: imageOwner)
    CustomCellSharedStyles.setStylesDescriptionRepo(description: descriptionPullRequest)
    CustomCellSharedStyles.setStylesSpacingView(spacingView: spacingView)
    setPullRequestOwnerNameStyles()
    setPullRequestNameStyles()
    setPullRequestDateStyles()
    setMergedLabelStyles()
    
    addSubview(imageOwner)
    addSubview(ownerName)
    addSubview(pullRequestName)
    addSubview(pullRequestDate)
    addSubview(descriptionPullRequest)
    addSubview(spacingView)
    addSubview(stateLabel)
    addSubview(mergedLabel)
    
    CustomCellSharedConstraints.setImageOwnerConstraints(
      imageView: imageOwner,
      superView: self)
    
    CustomCellSharedConstraints.setDescriptionConstraints(
      descriptionView: descriptionPullRequest,
      spacingView: spacingView,
      superView: self)
    
    CustomCellSharedConstraints.setSpacingViewConstraints(
      spacingView: spacingView,
      imageView: imageOwner,
      superView: self)
    
    setPullRequestOwnerNameConstraints()
    setPullRequestNameConstraints()
    setPullRequestDateConstraints()
    setStateLabelConstraints()
    setMergedLabelConstraints()
  }
  
}

extension PRsCustomCell {
  private func setPullRequestOwnerNameStyles() {
    ownerName.translatesAutoresizingMaskIntoConstraints = false
    
    ownerName.attributedText = NSAttributedString(
      string: "gabrielrom",
      attributes: [
        .font: UIFont(name: "Roboto-Regular", size: 11)!,
        .foregroundColor: UIColor(named: "Secondary-Text-Color")!
      ]
    )
  }
  
  private func setPullRequestNameStyles() {
    pullRequestName.translatesAutoresizingMaskIntoConstraints = false
      
    pullRequestName.attributedText = NSAttributedString(
      string: "[Feat] Criar uma conta",
      attributes: [
        .font: UIFont(name: "Roboto-Bold", size: 14)!,
        .foregroundColor: UIColor(named: "Primary-Text-Color")!
      ]
    )
  }
  
  private func setPullRequestDateStyles() {
    pullRequestDate.translatesAutoresizingMaskIntoConstraints = false
    
    pullRequestDate.attributedText = NSAttributedString(
      string: "12/2021",
      attributes: [
        .font: UIFont(name: "Roboto-Regular", size: 11)!,
        .foregroundColor: UIColor(named: "Tertiary-Text-Color")!
      ]
    )
  }
  
  private func setMergedLabelStyles() {
    mergedLabel.translatesAutoresizingMaskIntoConstraints = false
    
    mergedLabel.stateTitle.text = "MERGED"
    mergedLabel.stateTitle.textColor = UIColor(named: "State-Merged-Color")
    mergedLabel.backgroundColor = UIColor(named: "State-Merged-BackgroundColor")
  }
}
