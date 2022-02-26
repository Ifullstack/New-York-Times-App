//
//  Shared+ViewModel.swift
//  New York Times App
//
//  Created by Cane Allesta on 2/1/22.
//

import Foundation

protocol SharedViewModelInput {
    func fetchPosts(parameters: FetchPostsUseCaseParameters)
    func setPostModelSelected(postModelSelected: PostsModel)
    
    var periodSelected: String { get set }
    var postTypeSelected: String { get set }
    var sharedTypeSelected: String { get set }
    var postModelSelected: PostsModel? { get }
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
        spinnerStatus.value = .start
        
        Task {
            do {
                guard let entity = try await fetchPostsUseCase?.execute(params: parameters),
                      let results = entity.results else {
                    self.error.value = AppError.unExpectedError
                    return
                }
                self.postsModel.value = results.map { entity -> PostsModel in
                    return PostsModel(entity: entity)
                }
                self.spinnerStatus.value = .stop
            } catch {
                self.error.value = error
                self.spinnerStatus.value = .stop
            }
        }
    }
    
    func setPostModelSelected(postModelSelected: PostsModel) {
        self.postModelSelected = postModelSelected
    }
}
