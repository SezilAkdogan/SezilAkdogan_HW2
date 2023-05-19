//
//  TopStoriesViewModel.swift
//  Sezil_HW2News
//
//  Created by Sezil Akdoğan on 13.05.2023.
//

import Foundation
import NewsAPI

protocol TopStoriesViewModelDelegate: LoadingShowable {
    func didLoadData()
    func didLoadFailed()
    func showLoading()
    func hideLoading()
}

final class TopStoriesViewModel {
    var selectedSection: String
    weak var delegate: TopStoriesViewModelDelegate?
    private let service: TopStoriesServiceProtocol = TopStoriesService()
    var news: [NewsResult] = []
    
    init(selectedSection: String) {
        self.selectedSection = selectedSection
    }
    
    func fetchNews() {
        self.delegate?.showLoading()
        TopStoriesService().fetchTopStories(category: selectedSection) { result in
            self.delegate?.hideLoading()
            switch result {
            case .success(let success):
                self.news = success.filter { newResult in
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
    
    func numberOfRow() -> Int {
        return news.count
    }
    
    func cellForRow(at indexPath: IndexPath) -> NewsResult {
        return news[indexPath.row]
    }
}
