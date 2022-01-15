//
//  Api+Service.swift
//  New York Times App
//
//  Created by Cane Allesta on 15/1/22.
//

import Foundation

protocol ApiService {
    func getDataFromGetRequest(with url: String,
                               and completion: @escaping (Result<Data, Error>) -> Void)
}

class DefaultApiService: ApiService {
    func getDataFromGetRequest(with url: String,
                               and completion: @escaping (Result<Data, Error>) -> Void) {
        
        guard let url = URL(string: url) else {
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
            completion(.success(data))
        }.resume()
    }
}
