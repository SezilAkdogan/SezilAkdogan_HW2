//
//  News.swift
//  
//
//  Created by Sezil Akdoğan on 13.05.2023.
//

import Foundation

// MARK: - News
public struct News: Codable {
    public let status, copyright, section: String?
    public let lastUpdated: Date?
    public let numResults: Int?
    public let results: [NewsResult]?

    enum CodingKeys: String, CodingKey {
        case status, copyright, section
        case lastUpdated = "last_updated"
        case numResults = "num_results"
        case results
    }
}

// MARK: - Result
public struct NewsResult: Codable {
    public let section, subsection, title, abstract: String?
    public let url: String?
    public let uri, byline: String?
    let itemType: ItemType?
    public let updatedDate, createdDate, publishedDate: Date?
    public let materialTypeFacet, kicker: String?
    public let desFacet, orgFacet, perFacet, geoFacet: [String]?
    public let multimedia: [Multimedia]?
    public let shortURL: String?

    enum CodingKeys: String, CodingKey {
        case section, subsection, title, abstract, url, uri, byline
        case itemType = "item_type"
        case updatedDate = "updated_date"
        case createdDate = "created_date"
        case publishedDate = "published_date"
        case materialTypeFacet = "material_type_facet"
        case kicker
        case desFacet = "des_facet"
        case orgFacet = "org_facet"
        case perFacet = "per_facet"
        case geoFacet = "geo_facet"
        case multimedia
        case shortURL = "short_url"
    }
}

enum ItemType: String, Codable {
    case article = "Article"
    case interactive = "Interactive"
}

// MARK: - Multimedia
public struct Multimedia: Codable {
    public let url: String?
    public let format: Format?
    public let height, width: Int?
    public let type: TypeEnum?
    public let subtype: Subtype?
    public let caption, copyright: String?
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

