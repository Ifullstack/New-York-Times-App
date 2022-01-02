//
//  App+Error.swift
//  New York Times App
//
//  Created by Cane Allesta on 1/1/22.
//

import Foundation

enum AppError: Error {
    case serviceError(error: Error)
    case invalidUrl
    case missingData
}

extension AppError {
    var errorDescription: String? {
        switch self {
            case .serviceError(let error):
            return NSLocalizedString("\(error.localizedDescription)", comment: "Service error")
            case .invalidUrl:
                return NSLocalizedString("APP-ERROR", comment: "Invalid url error")
            case .missingData:
                return NSLocalizedString("APP-ERROR", comment: "Missing data error")
        }
    }
}
