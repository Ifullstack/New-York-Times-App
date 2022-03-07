//
//  FetchPostRepository+Mock.swift
//  New York Times AppTests
//
//  Created by Cane Allesta on 23/2/22.
//

import Foundation
@testable import New_York_Times_App

class FetchPostsRepositoryFailureMock: FetchPostsRepository {
    func fetchPosts(parameters: FetchPostsRespositoryParameters) async throws -> PostsDecodable {
        throw AppError.unExpectedError
    }
}

class FetchPostsRepositoryMockEmptyResult: FetchPostsRepository {
    func fetchPosts(parameters: FetchPostsRespositoryParameters) async throws -> PostsDecodable {
        do {
            let json = PostsMock.makePostsEmptyResultJsonMock()
            let decodable = try JSONDecoder().decode(PostsDecodable.self, from: json)
            return decodable
        } catch {
            throw error
        }
    }
}
