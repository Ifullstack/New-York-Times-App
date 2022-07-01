//
//  Posts+View.swift
//  New York Times App
//
//  Created by Cane Allesta on 1/1/22.
//

import SwiftUI

struct PostsView: View {
    var delegate: PostsViewProtocol?
    @State var postsModel: [PostsModel]
    
    var body: some View {
        ScrollView( .vertical, showsIndicators: false ) {
            ForEach( self.postsModel, id:\.self ) { post in
                withAnimation {
                    VStack {
                        ImageView(imageUrl: post.image ?? "")
                            .frame(width: 350, height: 150)
                            .cornerRadius(18.0)
                            .onTapGesture(count: 1) {
                                self.delegate?.postTapped(postModelSelected: post)
                            }
                        HStack {
                            Text("\( post.title ?? "")")
                                .font(.system(size: 22.0, weight: .heavy))
                                .foregroundColor(Color.primaryTextColor)
                                .padding(.horizontal)
                            Spacer()
                        }
                    }.padding(.vertical)
                }
            }
        }
    }
}


