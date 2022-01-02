//
//  Posts+Decodable.swift
//  New York Times App
//
//  Created by Cane Allesta on 2/1/22.
//

import Foundation

// MARK: - PostsDecodable
struct PostsDecodable: Codable {
    let status, copyright: String?
    let numResults: Int?
    let results: [ResultsDecodable]?

    enum CodingKeys: String, CodingKey {
        case status, copyright
        case numResults
        case results
    }
}

// MARK: - Result
struct ResultsDecodable: Codable {
    let uri: String?
    let url: String?
    let id, assetID: Int?
    let source: Source?
    let publishedDate, updated, section, subsection: String?
    let nytdsection, adxKeywords: String?
    let column: JSONNull?
    let byline: String?
    let type: ResultType?
    let title, abstract: String?
    let desFacet, orgFacet, perFacet, geoFacet: [String]?
    let media: [MediaDecodable]?
    let etaID: Int?

    enum CodingKeys: String, CodingKey {
        case uri, url, id
        case assetID
        case source
        case publishedDate = "published_date"
        case updated, section, subsection, nytdsection
        case adxKeywords
        case column, byline, type, title, abstract
        case desFacet
        case orgFacet
        case perFacet
        case geoFacet
        case media
        case etaID
    }
}

// MARK: - Media
struct MediaDecodable: Codable {
    let type: MediaType?
    let subtype: Subtype?
    let caption, copyright: String?
    let approvedForSyndication: Int?
    let mediaMetadata: [MediaMetadatumDecodable]?

    enum CodingKeys: String, CodingKey {
        case type, subtype, caption, copyright
        case approvedForSyndication
        case mediaMetadata = "media-metadata"
    }
}

// MARK: - MediaMetadatum
struct MediaMetadatumDecodable: Codable {
    let url: String?
    let format: Format?
    let height, width: Int?
    
    enum CodingKeys: String, CodingKey {
        case url
        case format
        case height, width
    }
}

enum Format: String, Codable {
    case mediumThreeByTwo210 = "mediumThreeByTwo210"
    case mediumThreeByTwo440 = "mediumThreeByTwo440"
    case standardThumbnail = "Standard Thumbnail"
}

enum Subtype: String, Codable {
    case photo = "photo"
}

enum MediaType: String, Codable {
    case image = "image"
}

enum Source: String, Codable {
    case newYorkTimes = "New York Times"
}

enum ResultType: String, Codable {
    case article = "Article"
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public func hash(into hasher: inout Hasher) {
        // No-op
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

