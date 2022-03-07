//
//  Shared+ViewModel.swift
//  New York Times App
//
//  Created by Cane Allesta on 2/1/22.
//

import Foundation
import Combine

protocol SharedViewModelInput {
    // Methods
    func fetchPosts(parameters: FetchPostsUseCaseParameters)
    func setPostModelSelected(postModelSelected: PostsModel)
    
    // Properties
    var periodSelected: String { get set }
    var postTypeSelected: String { get set }
    var sharedTypeSelected: String { get set }
    var postModelSelected: PostsModel? { get }
    
    // Bindings
    var postsModelPublisher: Published<[PostsModel]?>.Publisher { get }
    var spinnerStatusPublisher: Published<SpinnerStatus?>.Publisher { get }
    var errorPublisher: Published<Error?>.Publisher { get }
}

protocol SharedViewModel: SharedViewModelInput {}

class DefaultSharedViewModel: SharedViewModel {
    
    // Bindings
    @Published var postsModel: [PostsModel]?
    @Published var spinnerStatus: SpinnerStatus?
    @Published var error: Error?
    
    // Publishers
    var postsModelPublisher: Published<[PostsModel]?>.Publisher { $postsModel }
    var spinnerStatusPublisher: Published<SpinnerStatus?>.Publisher { $spinnerStatus }
    var errorPublisher: Published<Error?>.Publisher { $error }
    
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
        spinnerStatus = .start
        
        Task {
            do {
                guard let entity = try await fetchPostsUseCase?.execute(params: parameters),
                      let results = entity.results else {
                    self.error = AppError.unExpectedError
                    return
                }
                self.postsModel = results.map { entity -> PostsModel in
                    return PostsModel(entity: entity)
                }
                self.spinnerStatus = .stop
            } catch {
                self.error = error
                self.spinnerStatus = .stop
            }
        }
    }
    
    func setPostModelSelected(postModelSelected: PostsModel) {
        self.postModelSelected = postModelSelected
    }
}
