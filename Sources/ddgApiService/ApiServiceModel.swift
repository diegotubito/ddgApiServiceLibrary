//
//  File.swift
//  
//
//  Created by David Diego Gomez on 24/03/2022.
//

import Foundation

public enum APIError: Equatable, Error, CustomStringConvertible {
    case invalidToken
    case serverError
    case notFound
    case notHandleError
    case serialize
    case request
    case customError(message: String, code: Int)
    
    public func message() -> String {
        switch self {
        case .invalidToken:
            return "401_INVALID_TOKEN"
        case .serverError:
            return "500_SERVER_ERROR"
        case .notFound:
            return "404_NOT_FOUND"
        case .notHandleError:
            return "NOT_HANDLE_ERROR"
        case .request:
            return "REQUEST_ERROR"
        case .serialize:
            return "SERIALIZE_ERROR"
        case .customError(message: let message, code: _):
            return message
        }
    }
    
    public func code() -> Int {
        switch self {
        case .invalidToken:
            return 401
        case .serverError:
            return 500
        case .notFound:
            return 404
        case .notHandleError:
            return -1
        case .serialize:
            return 400
        case .customError(message: _, code: let code):
            return code
        case .request:
            return 400
        }
    }
    
    public var description: String {
        return "🧨⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽\nmessage: \(message())\ncode: \(code())\n⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺"
    }
}

