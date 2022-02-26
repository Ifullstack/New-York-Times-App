//
//  FetchPost+UseCase.swift
//  New York Times App
//
//  Created by Cane Allesta on 2/1/22.
//

import Foundation

protocol FetchPostsUseCase {
    func execute(params: FetchPostsUseCaseParameters) async throws -> PostsEntity
}

class DefaultFetchPostsUseCase: FetchPostsUseCase {
    
    // Dependencies
    let fetchPostRepository: FetchPostsRepository?
    
    init(fetchPostRepository: FetchPostsRepository = DefaultFetchPostsRepository()) {
        self.fetchPostRepository = fetchPostRepository
    }
    
    func execute(params: FetchPostsUseCaseParameters) async throws -> PostsEntity {
        let parameters: FetchPostsRespositoryParameters = FetchPostsRespositoryParameters(postType: params.postType,
                                                                                          period: params.period,
                                                                                          sharedType: params.sharedType)
        let task = Task { () -> PostsEntity in
            do {
                guard let decodable = try await fetchPostRepository?.fetchPosts(parameters: parameters),
                      let _ = decodable.results else {
                         throw AppError.unExpectedError
                      }
                return PostsEntity(decodable: decodable)
            } catch {
                throw error
            }
        }
        
        return try await task.value
    }
}
