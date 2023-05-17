//
//  NewsTableViewCell.swift
//  Sezil_HW2News
//
//  Created by Sezil Akdoğan on 17.05.2023.
//

import UIKit

final class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var imageIconView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
