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
    

    func fetchPosts(parameters: FetchPostsRespositoryParameters,
                    completion: @escaping (Result<PostsDecodable, Error>) -> Void) {
        
        let sharedType: String = parameters.sharedType.isEmpty ? "" :  "/\(parameters.sharedType)"
        let urlCreated: String = Endpoints.baseUrl + parameters.postType + "/" + parameters.period + sharedType + Endpoints.dotJson + Endpoints.apiKey
        
        guard let url = URL(string: urlCreated) else {
            completion(.failure(AppError.invalidUrl))
            return
        }
        
 
        URLSession.shared.dataTask(with: url) { data, _, error in
            
            if let error = error {
                completion(.failure(AppError.serviceError(error: error)))
                return
            }
            
            guard let data = data else {
                completion(.failure(AppError.missingData))
                return
            }
            
            do {
                let decodable = try JSONDecoder().decode(PostsDecodable.self, from: data)
                completion(.success(decodable))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
