//
//  NewsTableViewCell.swift
//  Sezil_HW2News
//
//  Created by Sezil Akdoğan on 17.05.2023.
//

import UIKit
import NewsAPI
import SDWebImage

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
    
    func configure(model: NewsResult) {
        titleLabel.text = model.title
        subTitleLabel.text = model.abstract
        authorLabel.text = model.byline

        preparePosterImage(with: model.multimedia)
    }
    
    private func preparePosterImage(with multimedia: [Multimedia]?) {
        guard let multimediaList = multimedia else {
            return
        }
        
        for multimedia in multimediaList {
            if multimedia.type == .image && multimedia.subtype == .photo {
                if let urlString = multimedia.url, let url = URL(string: urlString) {
                    imageIconView.sd_setImage(with: url, completed: nil)
                }
                break
            }
        }
    }
}
