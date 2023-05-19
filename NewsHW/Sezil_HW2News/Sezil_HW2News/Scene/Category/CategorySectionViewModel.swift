//
//  CategorySectionViewModel.swift
//  Sezil_HW2News
//
//  Created by Sezil Akdoğan on 13.05.2023.
//

import Foundation
import NewsAPI


protocol CategorySectionViewModelDelegate: AnyObject {
    func sectionsFetched()
}

final class CategorySectionViewModel {
    
    weak var delegate: CategorySectionViewModelDelegate?
    private var sections: [CategorySection] = []

    var numberOfSections: Int {
        return sections.count
    }

    func getSection(at index: Int) -> CategorySection {
        return sections[index]
    }

    func fetchPosts() {
        let categories = ["arts", "automobiles", "books", "business", "fashion", "food", "health", "home", "insider", "magazine", "movies", "national", "nyregion", "obituaries", "opinion", "politics", "realestate", "science", "sports", "sundayreview", "technology", "theater", "tmagazine", "travel", "upshot", "world"]

        for category in categories {
            let section = CategorySection(title: category, image: "")
            sections.append(section)
        }

        delegate?.sectionsFetched()
    }
}

