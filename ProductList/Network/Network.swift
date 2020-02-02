//
//  Network.swift
//  ProductList
//
//  Created by Murilo Alves Alborghette on 01/02/20.
//  Copyright © 2020 Murilo Alves Alborghette. All rights reserved.
//

import Foundation
import Reachability

enum NetworkResponse {
    case success(Data)
    case failure(NetworkError)
}

enum NetworkError: Error {
    case other(Error)
    case badStatus(Int)
    case connectionFail
}

protocol NetworkProtocol {
    typealias NetworkCompletion = (NetworkResponse) -> Void
    
    func get(resource: String, completion: @escaping NetworkCompletion)
}

class Network: NetworkProtocol {
    
    private var baseUrl: String
    
    private let session = URLSession(configuration: .default)
    
    init(withBaseUrl baseUrl: String) {
        self.baseUrl = baseUrl
    }
    
    func get(resource: String, completion: @escaping NetworkCompletion) {
        
        let stringUrl = baseUrl + resource
        guard let url = URL(string: stringUrl) else {
            completion(.failure(.other(NSError(withMessage: "Malformed URL", andCode: 0))))
            return
        }
        
        let request = URLRequest(url: url)
        self.doTask(with: request, completion: completion)
    }
    
    private func doTask(with request: URLRequest, completion: @escaping NetworkCompletion) {
        var request = request
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if let reachability = Reachability(), reachability.connection == .none {
            DispatchQueue.main.async {
                completion(.failure(.connectionFail))
            }
        } else {
            
            let task = session.dataTask(with: request) { (data, response, error) in
                
                DispatchQueue.main.async {
                    
                    if let error = error {
                        completion(.failure(.other(error)))
                    } else {
                        guard let httpResponse = response as? HTTPURLResponse else {
                            completion(.failure(.other(NSError(withMessage: "Could not get HTTP response", andCode: 0))))
                            return
                        }
                        
                        if (200 ..< 300 ~= httpResponse.statusCode) {
                            if let data = data {
                                completion(.success(data))
                            } else {
                                completion(.failure(.other(NSError(withMessage: "Could not get HTTP Response Data, because the return is nil", andCode: 0))))
                            }
                        } else {
                            completion(.failure(.badStatus(httpResponse.statusCode)))
                        }
                    }
                }
            }
            
            task.resume()
        }
    }
}
