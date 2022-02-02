//
//  ApiError.swift
//  Challenge-M2Y
//
//  Created by Victor Brito on 01/02/22.
//

/// Error handling to recover from any API request problems
enum ApiError: Error {
    case parserError
    case dataError
}
