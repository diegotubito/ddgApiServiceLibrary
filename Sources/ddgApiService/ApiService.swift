
import UIKit

public final class NetworkApiClientConfig: NSObject {
    public var host: String?
    public var body: Data?
    public var path: String = ""
    public var method: String?
    public var headers: [String:String] = [:]
    public var queryItems: [String: Any]?
    
    public func addCustomHeader(key: String, value: String) {
        headers[key] = value
    }
    
    public func addQueryItem(key: String, value: String) {
        if queryItems == nil {
            queryItems = [:]
        }
        
        queryItems?[key] = value
    }
}

open class NetworkApiClient {
    var session: URLSession
    var dataTask: URLSessionDataTask?
    var downloadTask: URLSessionDownloadTask?
    var uploadTask: URLSessionUploadTask?
    
    public var config: NetworkApiClientConfig
    
    public init() {
        session = URLSession(configuration: .default)
        config = NetworkApiClientConfig()
    }

    // Generic Wrapper
    public func apiCall<T: Decodable>(completion: @escaping (Result<T, APIError>) -> Void) {
        
        fetch { result in
            switch result {
            case .failure(let error):
                completion(.failure(error))
                break
            case .success(let data):
                do {
                    let genericData = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(genericData))
                } catch {
                    completion(.failure(.serialize))
                }
                break
            }
        }
    }
    
    // Data Wrapper
    public func apiCallData(completion: @escaping (Result<Data, APIError>) -> Void) {
        fetch { result in completion(result) }
    }
    
    private func fetch(completion: @escaping (Result<Data, APIError>) -> Void) {
        guard let url = getUrl(withPath: config.path) else { fatalError("URL - incorrect format or missing string url") }
        guard let method = config.method else { fatalError("Method missing") }
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        
        for header in config.headers {
            request.addValue(header.value, forHTTPHeaderField: header.key)
        }
        
        if let body = config.body {
            request.httpBody = body
        }
        
        dataTask = session.dataTask(with: request, completionHandler: { data, res, err in
            
            if let error = err {
                completion(.failure(APIError.customError(message: error.localizedDescription, code: 500)))
                return
            }
            
            guard let data = data,
                  let response = res as? HTTPURLResponse else {
                completion(.failure(APIError.serverError))
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                let status = response.statusCode
                guard (200...299).contains(status) else {
                    let message : String = (json?["message"] as? String) ?? "error code \(status)"
                    completion(.failure(.customError(message: message, code: status)))
                    
                    return
                }
                completion(.success(data))
            } catch {
                completion(.failure(APIError.request))
                
                return
            }
        })
        
        dataTask?.resume()
    }
    
    private func getUrl(withPath path: String) -> URL? {
        guard let host = config.host else {
            fatalError("need to specify host name like http://127.0.0.1:2999")
        }
        let path = path
        let stringUrl = "\(host)/\(path)"
      
        
        var urlComponents = URLComponents(string: stringUrl)
        
        if let queryItems = config.queryItems {
            urlComponents?.queryItems = queryItems.map { URLQueryItem(name: $0.key, value: $0.value as? String) }
        }
        
        return urlComponents?.url
    }
    
    public func addRequestBody<TRequest> (_ body: TRequest?) where TRequest: Encodable {
        config.body = try? JSONEncoder().encode(body)
    }
    
}
