//
//  NewsViewModel.swift
//  Sezil_HW2News
//
//  Created by Sezil Akdoğan on 13.05.2023.
//

import Foundation
import NewsAPI

protocol ArticleFetchDelegate {
    func didLoadData()
    func didLoadFailed()
}

class ArticleViewModel {
    
    var selectedSection: String
    var delegate: ArticleFetchDelegate?
    var articles = [NewsResult]()
    
    init( selectedSection: String ) {
        self.selectedSection = selectedSection
    }
    
    func numberOfRow(section:Int) -> Int{
        return articles.count
    }

    func cellForRow(indexPath: IndexPath) -> NewsResult {
        return self.articles[indexPath.row]
    }

    
    func fetchTopStories() -> Void {
        
        //URL should be kept in Contants and key should not be plain text but should be securely stored.
        var request : URLRequest = URLRequest(url: URL(string: "https://api.nytimes.com/svc/topstories/v2/\(selectedSection).json?api-key=aRx02pzh0lUqfp4q3FYPOCININGnOKKG")!)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .iso8601
                    let topStories = try decoder.decode(News.self, from: data)
                    self.articles = topStories.results ?? [] //add guard let controll
                    
                    //Success handling
                    self.delegate?.didLoadData()
                    print("Parsing successful")
                } catch {
                    print(error)
                    //Failure Handling
                    self.delegate?.didLoadFailed()
                }
            }
        }.resume()
    }
}

