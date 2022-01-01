//
//  App+Error.swift
//  New York Times App
//
//  Created by Cane Allesta on 1/1/22.
//

import Foundation

enum AppError: Error {
    case serviceError(msg: [String:Any])
}

extension AppError {
    var errorDescription: String? {
        switch self {
            case .serviceError(let msg):
            return NSLocalizedString("\(msg)", comment: "Service error")
        }
    }
}
