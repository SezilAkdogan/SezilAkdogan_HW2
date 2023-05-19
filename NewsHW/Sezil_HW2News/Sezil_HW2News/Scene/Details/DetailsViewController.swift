//
//  DetailsViewController.swift
//  Sezil_HW2News
//
//  Created by Sezil Akdoğan on 13.05.2023.
//

import UIKit
import SafariServices

class DetailsViewController: UIViewController, SFSafariViewControllerDelegate {
    
    @IBOutlet weak var imageIconView: UIImageView!
    @IBOutlet weak var storyTitle: UILabel!
    @IBOutlet weak var storyAbstract: UILabel!
    @IBOutlet weak var author: UILabel!
    
    var detailVM: DetailsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let viewModel = detailVM {
            storyTitle.text = viewModel.title
            storyAbstract.text = viewModel.abstract
            author.text = viewModel.author
            
            if let imageUrl = viewModel.imageUrl {
                imageIconView.setCustomImage(imageUrl.absoluteString)
            }
        }
    }
    
    @IBAction func seeMoreClicked(_ sender: Any) {
        guard let articleUrl = detailVM?.articleUrl else {
            return
        }
        
        let safariViewController = SFSafariViewController(url: articleUrl)
        safariViewController.delegate = self
        present(safariViewController, animated: true, completion: nil)
    }
    
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}
