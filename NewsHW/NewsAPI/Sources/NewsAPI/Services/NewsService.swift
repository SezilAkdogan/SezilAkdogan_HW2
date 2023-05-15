//
//  NewsServices.swift
//  
//
//  Created by Sezil Akdoğan on 13.05.2023.
//

import Foundation
import Alamofire

public protocol TopStoriesServiceProtocol: AnyObject {
    func fetchTopStories(completion: @escaping (Result<[NewsResult], Error>) -> Void)
}

public class TopStoriesService: TopStoriesServiceProtocol {

    public init() {}

    public func fetchTopStories(completion: @escaping (Result<[NewsResult], Error>) -> Void) {

        let urlString = "https://api.nytimes.com/svc/topstories/v2/home.json?api-key=aRx02pzh0lUqfp4q3FYPOCININGnOKKG"
        AF.request(urlString).responseData { response in
            switch response.result {
            case .success(let data):
                let decoder = Decoders.dateDecoder
                do {
                    let response = try decoder.decode(TopStoriesResponse.self, from: data)
                    completion(.success(response.results))
                } catch {
                    print("** JSON DECODE ERROR ***")
                }
            case .failure(let error):
                
                
                print(" GEÇİCİ BİR HATA OLUŞTU: (error.localizedDescription) **")
            }
        }

    }

}
