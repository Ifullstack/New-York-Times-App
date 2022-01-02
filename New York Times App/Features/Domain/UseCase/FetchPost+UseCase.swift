//
//  FetchPost+UseCase.swift
//  New York Times App
//
//  Created by Cane Allesta on 2/1/22.
//

import Foundation

protocol FetchPostsUseCase {
    func execute(params: FetchPostsUseCaseParameters,
                 completion: @escaping(Result<PostsEntity, Error>) -> Void)
}

class DefaultFetchPostsUseCase: FetchPostsUseCase {
    
    // Dependencies
    let fetchPostRepository: FetchPostsRepository?
    
    init(fetchPostRepository: FetchPostsRepository = DefaultFetchPostsRepository()) {
        self.fetchPostRepository = fetchPostRepository
    }
    
    func execute(params: FetchPostsUseCaseParameters,
                 completion: @escaping (Result<PostsEntity, Error>) -> Void) {
        
        let parameters: FetchPostsRespositoryParameters = FetchPostsRespositoryParameters(postType: params.postType,
                                                                                          period: params.period,
                                                                                          sharedType: params.sharedType)
    
        let completion: (Result<PostsDecodable, Error>) -> Void = { result in
            switch result {
            case .failure(let error):
                completion(.failure(error))
            case .success(let decodable):
                guard let _ = decodable.results else {
                    completion(.failure(AppError.unExpectedError))
                    return
                }
                completion(.success(PostsEntity(decodable: decodable)))
            }
        }
        
        fetchPostRepository?.fetchPosts(parameters: parameters, completion: completion)
    }
}
