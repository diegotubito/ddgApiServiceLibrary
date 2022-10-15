//
//  File.swift
//  
//
//  Created by David Gomez on 15/10/2022.
//

import Foundation

@available(iOS 13.0.0, *)
open class ApiRequest {
    let token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7InVpZCI6IktjUzUyS0laSzNZODVsYnhNcG53b095bDhPNjIiLCJkaXNwbGF5TmFtZSI6IlRlc3QgVXNlciIsInBob3RvVVJMIjpudWxsLCJlbWFpbCI6ImRpZWdvZGF2aWRAaWNsb3VkLmNvbSIsImVtYWlsVmVyaWZpZWQiOnRydWUsInBob25lTnVtYmVyIjpudWxsLCJpc0Fub255bW91cyI6ZmFsc2UsInRlbmFudElkIjpudWxsLCJwcm92aWRlckRhdGEiOlt7InVpZCI6ImRpZWdvZGF2aWRAaWNsb3VkLmNvbSIsImRpc3BsYXlOYW1lIjoiVGVzdCBVc2VyIiwicGhvdG9VUkwiOm51bGwsImVtYWlsIjoiZGllZ29kYXZpZEBpY2xvdWQuY29tIiwicGhvbmVOdW1iZXIiOm51bGwsInByb3ZpZGVySWQiOiJwYXNzd29yZCJ9XSwiYXBpS2V5IjoiQUl6YVN5QmVndVZ4NFZKYTBjbkJaUmlIYkNkZi01NDhXWHlOZVBZIiwiYXBwTmFtZSI6ImZpcmViYXNlX2NvbmZpZ3VyYXRpb24iLCJhdXRoRG9tYWluIjpudWxsLCJzdHNUb2tlbk1hbmFnZXIiOnsiYXBpS2V5IjoiQUl6YVN5QmVndVZ4NFZKYTBjbkJaUmlIYkNkZi01NDhXWHlOZVBZIiwicmVmcmVzaFRva2VuIjoiQU9FT3VsYVpmMHBPcE9FTDNrenlGMTlUcV9weTFPeGI5anBkUlk3SW5lQWQ5R3RZLWtkcF9nZjhzOWY2eWRnaWtaU0IwTHMxdjRJV3RMdnBLTVM3WlBYbFZCUDd6THFucTdoWG13LW5MN2M1VG56LU4ya3NDNkM5ZVI5ZnR1cWRHSkJrMTBsY1FxVG5iQXJ2V2JVZG41OUxFUXp4Yl9KcHI3b1U0ZVVfYzlodTFJZE1nUUFpc09FZ0FYM2xDN2x2M2I3SE5rd3NoTFF6dXB3WkJkQlJDOFQtdWxEQ2ZHYlhZMFVGRmJfVVIta1BDZ3FkRmxYNk9EWSIsImFjY2Vzc1Rva2VuIjoiZXlKaGJHY2lPaUpTVXpJMU5pSXNJbXRwWkNJNklqVmtNelF3WkdSaVl6TmpOV0poWTJNMFkyVmxNV1ppT1dReE5tVTVPRE0zWldNMk1UWXpaV0lpTENKMGVYQWlPaUpLVjFRaWZRLmV5SnVZVzFsSWpvaVZHVnpkQ0JWYzJWeUlpd2lhWE56SWpvaWFIUjBjSE02THk5elpXTjFjbVYwYjJ0bGJpNW5iMjluYkdVdVkyOXRMMkp2WkhrdGMyaGhjR2x1WnkwMU5tSmlaaUlzSW1GMVpDSTZJbUp2WkhrdGMyaGhjR2x1WnkwMU5tSmlaaUlzSW1GMWRHaGZkR2x0WlNJNk1UWTJOVGcyTnpNeE9Dd2lkWE5sY2w5cFpDSTZJa3RqVXpVeVMwbGFTek5aT0RWc1luaE5jRzUzYjA5NWJEaFBOaklpTENKemRXSWlPaUpMWTFNMU1rdEpXa3N6V1RnMWJHSjRUWEJ1ZDI5UGVXdzRUell5SWl3aWFXRjBJam94TmpZMU9EWTNNekU0TENKbGVIQWlPakUyTmpVNE56QTVNVGdzSW1WdFlXbHNJam9pWkdsbFoyOWtZWFpwWkVCcFkyeHZkV1F1WTI5dElpd2laVzFoYVd4ZmRtVnlhV1pwWldRaU9uUnlkV1VzSW1acGNtVmlZWE5sSWpwN0ltbGtaVzUwYVhScFpYTWlPbnNpWlcxaGFXd2lPbHNpWkdsbFoyOWtZWFpwWkVCcFkyeHZkV1F1WTI5dElsMTlMQ0p6YVdkdVgybHVYM0J5YjNacFpHVnlJam9pY0dGemMzZHZjbVFpZlgwLmsxMmFkbzlZT3BCbmQ5SE52T1dNbGFCNWdtMVdySU5hQWRWc1VNclc4Q1lURzBLMXlwRGJWSVJ3djFGQVhoMnRwTlNTTUF1U1FRX2puWGh3Nmh3VlRFTGVUdWFkaDJEMDlmbG5zaFdpWUk2NXNuX19aLW5WOTRlTDI1dmlUb0dKN3JJeFdhdEZOeEtoSmx2NExuNThEY29zSVgxTkRpYnM2UFQ0QnF5QXJXR0tXRkhWWFU1ZHVqVVdKaEFCbVFIM0tZenN4VTFpOXJESzJiRE5fVUFVdU00WmlFMEV1cHBhQzZBLVh1bkpRbDQ4UDUyM2haS25vcFlyWDU4eG14UENsbG9pRGQ1TGNaUFVYcUpSVTNGbzIwanh3QU1MQ3otVEgwZENyQmkxS2tJa21WUy01ckZFUzduVnRnY2J4X3cxaVNwdTVCcldBUElPRkgwaWViMi05USIsImV4cGlyYXRpb25UaW1lIjoxNjY1ODcwOTE4MDAwfSwicmVkaXJlY3RFdmVudElkIjpudWxsLCJsYXN0TG9naW5BdCI6IjE2NjU4NjczMTgzMDQiLCJjcmVhdGVkQXQiOiIxNjA1OTk0ODQyODA2IiwibXVsdGlGYWN0b3IiOnsiZW5yb2xsZWRGYWN0b3JzIjpbXX19LCJpYXQiOjE2NjU4NjczMTgsImV4cCI6MTY2NTk1MzcxOH0.DHigOwAdbPCW7d1CjrgDHYcEE5QhGRwQDbl_uKYyb10"
    
    public var config = NetworkApiClientConfig()
    
    func fetchData(_id: String) async throws -> Data {
        let stringURL = "https://bodyshaping-heroku.herokuapp.com/v1/thumbnail?_id=\(_id)"
        let url = URL(string: stringURL)
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        request.addValue(token, forHTTPHeaderField: "x-access-token")
        let session = URLSession.shared
        
        do {
            let (data, response) = try await session.data(for: request)
            guard let response = response as? HTTPURLResponse else {
                throw ApiRequestError.httpUrlResponseCast
            }
            
            if (200...299).contains(response.statusCode) {
                return data
            } else {
                let errorModel = try JSONDecoder().decode(ErrorModelBackEnd.self, from: data)
                throw ApiRequestError.backendError(message: errorModel.error?.message ?? "no error description from backend")
            }
        } catch {
            throw error
        }
    }
    
    func fetch<T: Decodable>(_id: String) async throws -> T {
        let stringURL = "https://bodyshaping-heroku.herokuapp.com/v1/thumbnail?_id=\(_id)"
        let url = URL(string: stringURL)
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        request.addValue(token, forHTTPHeaderField: "x-access-token")
        let session = URLSession.shared
        
        do {
            let (data, response) = try await session.data(for: request)
            guard let response = response as? HTTPURLResponse else {
                throw ApiRequestError.httpUrlResponseCast
            }
            
            if (200...299).contains(response.statusCode) {
                let register = try JSONDecoder().decode(T.self, from: data)
                return register
            } else {
                let errorModel = try JSONDecoder().decode(ErrorModelBackEnd.self, from: data)
                throw ApiRequestError.backendError(message: errorModel.error?.message ?? "no error description from backend")
            }
        } catch {
            throw error
        }
    }
}

enum ApiRequestError: Equatable, Error, CustomStringConvertible {
    case httpUrlResponseCast
    case unhandleError
    case backendError(message: String)
    
    var message: String {
        switch self {
        case .backendError(message: let message): return message
        case .httpUrlResponseCast:
            return "Could not cast HTTPUrlResponse"
        case .unhandleError:
            return "Unhandled error from backend"
        }
    }
    
    public var description: String {
        return "🧨⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽\nmessage: \(self.message)\n⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺"
    }
}

class ThumbnailModel {
    struct Thumbnail : Decodable {
        var _id : String
        var thumbnailImage : String
        var isEnabled : Bool
    }
}

// MARK: Response Model
struct ResponseModel <T: Decodable> : Decodable{
    var success : Bool?
    var data : T?
    var count : Int?
}


struct ErrorModelBackEnd: Decodable {
    var success : Bool?
    var error : ErrorData?
    var count : Int?
    
    struct ErrorData: Decodable {
        var name: String
        var message: String
    }
}


