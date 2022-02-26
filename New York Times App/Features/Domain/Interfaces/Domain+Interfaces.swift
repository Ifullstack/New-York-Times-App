//
//  Domain+Interfaces.swift
//  New York Times App
//
//  Created by Cane Allesta on 2/1/22.
//

import Foundation

//protocol FetchPostsRepository {
//    func fetchPosts(parameters: FetchPostsRespositoryParameters, completion: @escaping(Result<PostsDecodable, Error>) -> Void)
//}

protocol FetchPostsRepository {
    func fetchPosts(parameters: FetchPostsRespositoryParameters) async throws -> PostsDecodable
}
