//
//  FetchPost+Repository.swift
//  New York Times App
//
//  Created by Cane Allesta on 2/1/22.
//

import Foundation

extension DefaultFetchPostsRepository {
    enum Endpoints {
        static let baseUrl = "https://api.nytimes.com/svc/mostpopular/v2/"
        static let dotJson = ".json"
        // Put your API Key here
        static let apiKey = "?api-key=tS1sD1se3o4f5DFoBvFziaOT6HReRmqN"
    }
}

class DefaultFetchPostsRepository: FetchPostsRepository {
    
    // Dependencies
    private let apiService: ApiService?
    
    init(apiService: ApiService = DefaultApiService()) {
        self.apiService = apiService
    }
    
    func fetchPosts(parameters: FetchPostsRespositoryParameters) async throws -> PostsDecodable {
        let sharedType: String = parameters.sharedType.isEmpty ? "" :  "/\(parameters.sharedType)"
        let urlCreated: String = Endpoints.baseUrl + parameters.postType + "/" + parameters.period + sharedType + Endpoints.dotJson + Endpoints.apiKey
        
        let task = Task { () -> PostsDecodable in
            do {
                guard let data = try await apiService?.getDataFromGetRequest(with: urlCreated) else {
                    throw AppError.unExpectedError
                }
                let decodable = try JSONDecoder().decode(PostsDecodable.self, from: data)
                return decodable
            } catch {
                throw error
            }
        }
        
        return try await task.value
    }
}
