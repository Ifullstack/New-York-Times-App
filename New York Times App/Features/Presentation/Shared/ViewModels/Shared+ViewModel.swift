//
//  Shared+ViewModel.swift
//  New York Times App
//
//  Created by Cane Allesta on 2/1/22.
//

import Foundation

protocol SharedViewModelInput {
    func fetchPosts(parameters: FetchPostsUseCaseParameters)
}

protocol SharedViewModelOutput {
    var postsModel: Box<[PostsModel]?> { get }
    var spinnerStatus: Box<SpinnerStatus?> { get }
    var error: Box<Error?> { get }
}

protocol SharedViewModel: SharedViewModelInput,
                          SharedViewModelOutput {}

class DefaultSharedViewModel: SharedViewModel {
    
    // Bindings
    var postsModel: Box<[PostsModel]?> = Box(nil)
    var spinnerStatus: Box<SpinnerStatus?> = Box(nil)
    var error: Box<Error?> = Box(nil)
    
    // UseCases
    private let fetchPostsUseCase: FetchPostsUseCase?
    
    init(fetchPostsUseCase: FetchPostsUseCase = DefaultFetchPostsUseCase()) {
        self.fetchPostsUseCase = fetchPostsUseCase
    }
}

// MARK: - Public Methods
extension DefaultSharedViewModel {
    func fetchPosts(parameters: FetchPostsUseCaseParameters) {
        spinnerStatus.value = .start
        let completion: (Result<PostsEntity, Error>) -> Void = { result in
            switch result {
            case .failure(let error):
                self.error.value = error
            case .success(let entity):
                var models: [PostsModel] = []
                entity.results?.forEach({ resultsEntity in
                    models.append(PostsModel(entity: resultsEntity))
                })
                
                self.postsModel.value = models
            }
            self.spinnerStatus.value = .stop
        }
        
        fetchPostsUseCase?.execute(params: parameters, completion: completion)
    }
}
