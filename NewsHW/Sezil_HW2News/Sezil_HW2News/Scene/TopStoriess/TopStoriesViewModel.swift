//
//  TopStoriesViewModel.swift
//  Sezil_HW2News
//
//  Created by Sezil Akdoğan on 13.05.2023.
//

import Foundation
import NewsAPI

protocol TopStoriesViewModelProtocol{
    var delegate: TopStoriesViewModelDelegate? { get set }
    func fetchData()
    
}
protocol TopStoriesViewModelDelegate: LoadingShowable {
    func didLoadData()
    func didLoadFailed()
    
}

final class TopStoriesViewModel {
    
    var selectedSection: String
    let service: TopStoriesServiceProtocol = TopStoriesService()
    weak var delegate: TopStoriesViewModelDelegate?
    var news: [NewsResult] = []
    
    init(selectedSection: String) {
        self.selectedSection = selectedSection
    }
    
    func numberOfRow(section:Int) -> Int{
        return news.count
    }

    func cellForRow(indexPath: IndexPath) -> NewsResult {
        return self.news[indexPath.row]
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
}

extension TopStoriesViewModel:TopStoriesViewModelProtocol {
    func fetchData() {
        fetchNews()
    }
    
    
}
