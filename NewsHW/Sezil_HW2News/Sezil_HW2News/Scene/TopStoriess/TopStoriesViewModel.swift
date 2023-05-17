//
//  TopStoriesViewModel.swift
//  Sezil_HW2News
//
//  Created by Sezil Akdoğan on 13.05.2023.
//

import Foundation
import NewsAPI

protocol ArticleFetchDelegate: LoadingShowable {
    func didLoadData()
    func didLoadFailed()
}

final class TopStoriesViewModel {
    
    var selectedSection: String
    var delegate: ArticleFetchDelegate?
    var articles = [NewsResult]()
    
    init(selectedSection: String) {
        self.selectedSection = selectedSection
    }
    
    func numberOfRow(section:Int) -> Int{
        return articles.count
    }

    func cellForRow(indexPath: IndexPath) -> NewsResult {
        return self.articles[indexPath.row]
    }
    
    func fetch() {
        self.delegate?.showLoading()
        TopStoriesService().fetchTopStories(category: selectedSection) { result in
            self.delegate?.hideLoading()
            switch result {
            case .success(let success):
                self.articles = success.filter { newResult in
                    guard let title = newResult.title, !title.isEmpty else { return false }
                    guard let abstract = newResult.abstract, !abstract.isEmpty else { return false }
                    guard let byline = newResult.byline, !byline.isEmpty else { return false }
                    guard let multimedia = newResult.multimedia, !multimedia.isEmpty else { return false }
                    return true
                }
                self.delegate?.didLoadData()
            case .failure:
                self.delegate?.didLoadFailed()
            }
        }
    }
}
