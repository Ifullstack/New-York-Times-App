//
//  ApiService+Mock.swift
//  New York Times AppTests
//
//  Created by Cane Allesta on 15/1/22.
//

import Foundation
@testable import New_York_Times_App


class MockFailureApiService: ApiService {
    
    func getDataFromGetRequest(with url: String,
                               and completion: @escaping (Result<Data, Error>) -> Void) {
        
        completion(.failure(AppError.missingData as Error))
    }
}