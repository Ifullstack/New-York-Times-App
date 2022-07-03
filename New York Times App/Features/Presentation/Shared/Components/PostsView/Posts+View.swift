//
//  Posts+View.swift
//  New York Times App
//
//  Created by Cane Allesta on 1/1/22.
//

import SwiftUI

struct PostsView: View {
    let delegate: PostsViewProtocol?
    @State var postsModel: [PostsModel]
    
    var body: some View {
        ScrollView( .vertical, showsIndicators: false ) {
            ForEach(self.postsModel, id:\.self ) { post in
                withAnimation {
                    VStack {
                        PostCardView(post: post,
                                     delegate: delegate)
                    }
                }
            }.padding(.vertical)
        }
    }
}


