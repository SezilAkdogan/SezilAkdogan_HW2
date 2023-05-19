//
//  DetailsViewModel.swift
//  Sezil_HW2News
//
//  Created by Sezil Akdoğan on 17.05.2023.
//

import Foundation
import NewsAPI

final class DetailsViewModel {
    let article: NewsResult
    
    var title: String? {
        return article.title
    }
    
    var abstract: String? {
        return article.abstract
    }
    
    var author: String? {
        return article.byline
    }
    
    var imageUrl: URL? {
        guard let multimediaArray = article.multimedia else {
            return nil
        }
        
        for multimedia in multimediaArray {
            if multimedia.type == .image &&
                multimedia.subtype == .photo &&
                multimedia.format == .superJumbo {
                if let urlString = multimedia.url, let url = URL(string: urlString) {
                    return url
                }
            }
        }
        
        return nil
    }
    
    var articleUrl: URL? {
        if let urlString = article.url, let url = URL(string: urlString) {
            return url
        }
        return nil
    }
    
    init(article: NewsResult) {
        self.article = article
    }
}
