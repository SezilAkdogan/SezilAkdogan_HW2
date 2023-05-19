//
//  CategorySelectionCollectionViewCell.swift
//  Sezil_HW2News
//
//  Created by Sezil Akdoğan on 13.05.2023.
//

import UIKit

class CategorySectionCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!

    func configure(with section: CategorySection) {
        titleLabel.text = section.title
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.black.cgColor
        layer.cornerRadius = 15
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
