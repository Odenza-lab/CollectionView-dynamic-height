//
//  AutoLayoutViewCell.swift
//  CollectionViewAutoLayout
//
//  Created by ODENZA on 18/9/2564 BE.
//

import UIKit

class AutoLayoutViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    let screenWidth = UIScreen.main.bounds.size.width
    
    lazy var width: NSLayoutConstraint = {
        let width = contentView.widthAnchor.constraint(equalToConstant: screenWidth)
        width.isActive = true
        return width
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        //fatalError("init(coder:) has not been implemented")
        contentView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    //For iOS 12 and lower
    override func systemLayoutSizeFitting(_ targetSize: CGSize) -> CGSize {
        width.constant = screenWidth - 32
        return contentView.systemLayoutSizeFitting(CGSize(width: targetSize.width, height: 1))
    }
    
    //For iOS 13 and above
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        width.constant = screenWidth - 32
        return contentView.systemLayoutSizeFitting(CGSize(width: targetSize.width, height: 1))
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(content: String) {
        self.titleLabel.text = content
    }

}
