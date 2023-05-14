//
//  TopStoriesResponse.swift
//  
//
//  Created by Sezil Akdoğan on 13.05.2023.
//

import Foundation

public struct TopStoriesResponse: Decodable {
    public let results: [NewsResult]

    private enum RootCodingKeys: String, CodingKey {
        case results
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: RootCodingKeys.self)
        self.results = try container.decode([NewsResult].self, forKey: .results)
    }
}
