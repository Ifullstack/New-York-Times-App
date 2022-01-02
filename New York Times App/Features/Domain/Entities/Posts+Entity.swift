//
//  Posts+Entity.swift
//  New York Times App
//
//  Created by Cane Allesta on 2/1/22.
//

import Foundation

// MARK: - PostsEntity
struct PostsEntity {
    let status, copyright: String?
    let numResults: Int?
    var results: [ResultsEntity]? = nil
    
    init(decodable: PostsDecodable) {
        status = decodable.status
        copyright = decodable.copyright
        numResults = decodable.numResults
        if let results = decodable.results {
            self.results = results.map({ decodable -> ResultsEntity in
                return ResultsEntity(decodable: decodable)
            })
        }
    }
}

// MARK: - Result
struct ResultsEntity {
    let uri: String?
    let url: String?
    let id, assetID: Int?
    let source: Source?
    let publishedDate, updated, section, subsection: String?
    let nytdsection, adxKeywords: String?
    let column: NSNull? = nil
    let byline: String?
    let type: ResultType?
    let title, abstract: String?
    let desFacet, orgFacet, perFacet, geoFacet: [String]?
    var media: [MediaEntity]? = nil
    let etaID: Int?
    
    init(decodable: ResultsDecodable) {
        uri = decodable.uri
        url = decodable.url
        id = decodable.id
        assetID = decodable.assetID
        source = decodable.source
        publishedDate = decodable.publishedDate
        updated = decodable.updated
        section = decodable.section
        subsection = decodable.subsection
        nytdsection = decodable.nytdsection
        adxKeywords = decodable.adxKeywords
        byline = decodable.byline
        type = decodable.type
        title = decodable.title
        abstract = decodable.abstract
        desFacet = decodable.desFacet
        orgFacet = decodable.orgFacet
        perFacet = decodable.perFacet
        geoFacet = decodable.geoFacet
        etaID = decodable.etaID
        if let media = decodable.media {
            self.media = media.map({ decodable -> MediaEntity in
                return MediaEntity(decodable: decodable)
            })
        }
    }
}

// MARK: - Media
struct MediaEntity {
    let type: MediaType?
    let subtype: Subtype?
    let caption, copyright: String?
    let approvedForSyndication: Int?
    var mediaMetadata: [MediaMetadatumEntity]? = nil
    
    init(decodable: MediaDecodable) {
        type = decodable.type
        subtype = decodable.subtype
        caption = decodable.caption
        copyright = decodable.copyright
        approvedForSyndication = decodable.approvedForSyndication
        if let mediaMetadata = decodable.mediaMetadata {
            self.mediaMetadata = mediaMetadata.map({ decodable -> MediaMetadatumEntity in
                 return MediaMetadatumEntity(decodable: decodable)
            })
        }
    }
}

// MARK: - MediaMetadatum
struct MediaMetadatumEntity {
    let url: String?
    let format: Format?
    let height, width: Int?
    
    init(decodable: MediaMetadatumDecodable) {
        url = decodable.url
        format = decodable.format
        height = decodable.height
        width = decodable.width
    }
}


