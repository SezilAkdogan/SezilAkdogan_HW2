//
//  CategorySectionViewModel.swift
//  Sezil_HW2News
//
//  Created by Sezil Akdoğan on 13.05.2023.
//

import Foundation
import NewsAPI

final class CategorySectionViewModel {
    
    var sections: [CategorySection] = []
         
    func fetchPosts() {
        
        let categories = ["arts", "automobiles", "books", "business", "fashion", "food", "health", "home", "insider", "magazine", "movies", "national", "nyregion", "obituaries", "opinion", "politics", "realestate", "science", "sports", "sundayreview", "technology", "theater", "tmagazine", "travel", "upshot", "world"]

        for category in categories {
            let section = CategorySection(title: category, image: "")
            sections.append(section)
        }
     

    }
    
}
