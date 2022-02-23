//
//  FetchPostRepository+Mock.swift
//  New York Times AppTests
//
//  Created by Cane Allesta on 23/2/22.
//

import Foundation
@testable import New_York_Times_App

class FetchPostsRepositoryFailureMock: FetchPostsRepository {
    func fetchPosts(parameters: FetchPostsRespositoryParameters,
                    completion: @escaping (Result<PostsDecodable, Error>) -> Void) {
        
        completion(.failure(AppError.unExpectedError))
    }
}

class FetchPostsRepositoryMockEmptyResult: FetchPostsRepository {
    func fetchPosts(parameters: FetchPostsRespositoryParameters,
                    completion: @escaping (Result<PostsDecodable, Error>) -> Void) {
        do {
            let json = PostsMock.makePostsEmptyResultJsonMock()
            let decodable = try JSONDecoder().decode(PostsDecodable.self, from: json)
            completion(.success(decodable))
        } catch {
            completion(.failure(AppError.unExpectedError))
        }
    }
}
