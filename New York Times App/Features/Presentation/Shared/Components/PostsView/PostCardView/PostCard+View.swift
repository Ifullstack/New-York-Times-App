//
//  PostView+Cell.swift
//  New York Times App
//
//  Created by Cane Allesta on 1/1/22.
//

import SwiftUI

protocol PostsViewProtocol {
    func postTapped(postModelSelected: PostsModel)
}

struct PostCardView: View {
    
    let post: PostsModel
    let delegate: PostsViewProtocol?
    
    var body: some View {
        SUILabelView(model: SUILabelViewModel(text: post.publicationDate ?? "",
                                              position: .right,
                                              font: .system(size: 15.0, weight: .regular),
                                              isWithOpacity: true))
        ImageView(imageUrl: post.image ?? "")
            .frame(width: 360, height: 160)
            .cornerRadius(10.0)
            .onTapGesture(count: 1) {
                self.delegate?.postTapped(postModelSelected: post)
        }
        SUILabelView(model: SUILabelViewModel(text: post.autor ?? "",
                                              position: .left,
                                              font: .system(size: 13.0, weight: .regular),
                                              isWithOpacity: true))
        SUILabelView(model: SUILabelViewModel(text: post.title ?? "",
                                              position: .left,
                                              font: .system(size: 22.0, weight: .heavy),
                                              isWithOpacity: false))
        SUILabelView(model: SUILabelViewModel(text: post.section ?? "",
                                              position: .left,
                                              font: .system(size: 13.0, weight: .regular),
                                              isWithOpacity: true))
    }
}
