//
//  File.swift
//  
//
//  Created by David Diego Gomez on 24/03/2022.
//

import Foundation

open class ApiCallMock {
    public init() {
        
    }
    var error: APIError? = APIError.customError(message: "The password is invalid or the user does not have a password.", code: 503)
    
    public func apiCallMocked<T: Decodable>(bundle: Bundle, completionBlock: @escaping (Result<T, APIError>) -> Void) {
        let file = ProcessInfo.processInfo.environment["FILENAME"] ?? ""
        let testFail = ProcessInfo.processInfo.arguments.contains("-testFail")
        
        guard let data = readLocalFile(bundle: bundle, forName: file) else {
            completionBlock(.failure(APIError.notFound))
            return
        }
        
        if testFail {
            let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any]
            let message : String = (json?["message"] as? String) ?? "no message"
            let code : String = (json?["code"] as? String) ?? "no code"
            
            let error = APIError.customError(message: message, code: Int(code) ?? 0)
            completionBlock(.failure(error))
            return
        }
        
        guard let register = try? JSONDecoder().decode(T.self, from: data) else {
            completionBlock(.failure(APIError.serialize))
            return
        }
        
        completionBlock(.success(register))
    }
    
    public func apiCallMockedData(bundle: Bundle, completionBlock: @escaping (Result<Data, APIError>) -> Void) {
        let file = ProcessInfo.processInfo.environment["FILENAME"] ?? ""
        let testFail = ProcessInfo.processInfo.arguments.contains("-testFail")
        
        guard let data = readLocalFile(bundle: bundle, forName: file) else {
            completionBlock(.failure(APIError.notFound))
            return
        }
        
        if testFail {
            let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any]
            let message : String = (json?["message"] as? String) ?? "no message"
            let code : String = (json?["code"] as? String) ?? "no code"
            
            let error = APIError.customError(message: message, code: Int(code) ?? 0)
            completionBlock(.failure(error))
            return
        }
        
        completionBlock(.success(data))
    }
    
    private func readLocalFile(bundle: Bundle, forName name: String) -> Data? {
        guard let bundlePath = bundle.path(forResource: name, ofType: "json") else {
            fatalError("file \(name).json doesn't exist")
        }
        
        return try? String(contentsOfFile: bundlePath).data(using: .utf8)
    }
}

