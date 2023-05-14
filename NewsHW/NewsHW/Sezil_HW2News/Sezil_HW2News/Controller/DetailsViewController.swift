//
//  DetailsViewController.swift
//  Sezil_HW2News
//
//  Created by Sezil Akdoğan on 13.05.2023.
//

import UIKit
import NewsAPI
import SafariServices

class DetailsViewController: UIViewController, SFSafariViewControllerDelegate {
    
    
    @IBOutlet weak var imageIconView: UIImageView!
    @IBOutlet weak var storyTitle: UILabel!
    @IBOutlet weak var storyAbstract: UILabel!
    @IBOutlet weak var author: UILabel!
    
    @IBAction func safariServeces(_ sender: Any) {
        let safariViewController = SFSafariViewController(url: URL.init(string: article?.url ?? "")!)
        safariViewController.delegate = self
        self.present(safariViewController, animated: true, completion: nil)
    }
    
    //MARK:- Safari delegate
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }

    var article: NewsResult?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let article = self.article {
            storyTitle.text = article.title
            storyAbstract.text = article.abstract
            author.text = article.byline
            
           /*
            for multimedia in article.multimedia {
                if multimedia.type == .image &&
                    multimedia.subtype == .photo &&
                    multimedia.format == .superJumbo {
                    imageIconView.setCustomImage(multimedia.url) //Better approach?
                    break
                }
            }
            */
            
            guard let multimediaArray = article.multimedia else {
                // Handle the case where the multimedia array is nil
                let urlString: String? = nil
                if let url = URL(string: urlString ?? "") {
                    print(url)
                } else {
                    print("url is nil")
                }
                return
            }

            for multimedia in multimediaArray {
                if multimedia.type == .image &&
                    multimedia.subtype == .photo &&
                    multimedia.format == .superJumbo {
                    guard let url = multimedia.url else {
                        // Handle the case where the url is nil
                        let urlString: String? = nil
                        if let url = URL(string: urlString ?? "") {
                            print(url)
                        } else {
                            print("url is nil")
                        }
                        return
                    }
                    imageIconView.setCustomImage(url)
                    break
                }
            }
            





//            if article.url.count == 0 {
//                //Hide read more button.
//            }else {
//                self.navigationController?.popViewController(animated: true)
//            }
        }
        
        //MARK:- Read more action
        
        
    }
    
    
    
}
