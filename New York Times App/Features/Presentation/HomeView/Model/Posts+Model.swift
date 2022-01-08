//
//  Posts+Model.swift
//  New York Times App
//
//  Created by Cane Allesta on 1/1/22.
//

import Foundation

struct PostsModel {
    var image: String?
    var title: String?
    var autor: String?
    var section: String?
    var publicationDate: String?
    var postUrl: String?
    
    init(entity: ResultsEntity) {
        if let media = entity.media {
            self.image = getImageUrl(from: media)
        }
        self.title = entity.title
        self.autor = entity.byline
        self.section = entity.section
        self.publicationDate = entity.publishedDate
        self.postUrl = entity.url
    }
}

extension PostsModel {
    // TODO: Improve this helper
    private func getImageUrl(from entity: [MediaEntity]) -> String {
        var imageUrl: String = ""
       
        entity.forEach { entity in
            if let mediaMetada = entity.mediaMetadata {
                imageUrl = mediaMetada[1].url ?? "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/1200px-No_image_available.svg.png"
            }
        }
        
        return imageUrl
    }
}
