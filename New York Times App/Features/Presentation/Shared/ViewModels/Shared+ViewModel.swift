//
//  Shared+ViewModel.swift
//  New York Times App
//
//  Created by Cane Allesta on 2/1/22.
//

import Foundation
import RxSwift

enum SharedViewStates {
    case loading(SpinnerStatus?),
         errorState(Error?),
         postsModelsChanged([PostsModel]?)
}

protocol SharedViewModelInput {
    func fetchPosts(parameters: FetchPostsUseCaseParameters)
    func setPostModelSelected(postModelSelected: PostsModel)
    
    var periodSelected: String { get set }
    var postTypeSelected: String { get set }
    var sharedTypeSelected: String { get set }
    var postModelSelected: PostsModel? { get }
}

protocol SharedViewModelOutput {
    var viewState: PublishSubject<SharedViewStates?> { get }
}

protocol SharedViewModel: SharedViewModelInput,
                          SharedViewModelOutput {}

class DefaultSharedViewModel: SharedViewModel {
    
    // Bindings
    var viewState: PublishSubject<SharedViewStates?> = PublishSubject<SharedViewStates?>()
    
    // UseCases
    private let fetchPostsUseCase: FetchPostsUseCase?
    
    // Exposed Properties
    var periodSelected: String = "1"
    var postTypeSelected: String = "viewed"
    var sharedTypeSelected: String = ""
    var postModelSelected: PostsModel?
    
    init(fetchPostsUseCase: FetchPostsUseCase = DefaultFetchPostsUseCase()) {
        self.fetchPostsUseCase = fetchPostsUseCase
    }
}

// MARK: - Public Methods
extension DefaultSharedViewModel {
    func fetchPosts(parameters: FetchPostsUseCaseParameters) {
        
        viewState.onNext(.loading(.start))
        
        let completion: (Result<PostsEntity, Error>) -> Void = { result in
            switch result {
                case .failure(let error):
                    self.viewState.onNext(.errorState(error))
                case .success(let entity):
                    guard let results = entity.results else {
                        self.viewState.onNext(.errorState(AppError.unExpectedError))
                        return
                    }
                    self.viewState.onNext(.postsModelsChanged(results.map { entity -> PostsModel in
                        return PostsModel(entity: entity)
                    }))
            }
            self.viewState.onNext(.loading(.stop))
        }
        
        fetchPostsUseCase?.execute(params: parameters, completion: completion)
    }
    
    func setPostModelSelected(postModelSelected: PostsModel) {
        self.postModelSelected = postModelSelected
    }
}
