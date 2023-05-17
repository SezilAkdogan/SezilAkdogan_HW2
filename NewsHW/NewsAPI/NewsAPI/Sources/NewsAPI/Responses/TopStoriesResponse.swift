//
//  TopStoriesResponse.swift
//  
//
//  Created by Sezil Akdoğan on 13.05.2023.
//

import Foundation
//
//public struct TopStoriesResponse: Decodable {
//    public let results: [NewsResult]
//
//    private enum RootCodingKeys: String, CodingKey {
//        case results
//    }
//
//    public init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: RootCodingKeys.self)
//        self.results = try container.decode([NewsResult].self, forKey: .results)
//    }
//}


// MARK: - SearchResponse
public struct SearchResponse: Codable {
   public let results: [NewsResult]
}

// MARK: - News
public struct News: Codable {
    public let results: [NewsResult]?
}

// MARK: - Result
public struct NewsResult: Codable {
    public let section, subsection, title, abstract: String?
    public let url: String?
    public let uri, byline: String?
    public let multimedia: [Multimedia]?
}

// MARK: - Multimedia
public struct Multimedia: Codable {
    public let url: String?
    public let format: Format?
    public let height, width: Int?
    public let type: TypeEnum
    public let subtype: Subtype
}

public enum Format: String, Codable {
    case largeThumbnail = "Large Thumbnail"
    case superJumbo = "Super Jumbo"
    case threeByTwoSmallAt2X = "threeByTwoSmallAt2X"
}

public enum Subtype: String, Codable {
    case photo = "photo"
}

public enum TypeEnum: String, Codable {
    case image = "image"
}
