//
//  RatingBusiness.swift
//  ProductList
//
//  Created by Murilo Alves Alborghette on 01/02/20.
//  Copyright © 2020 Murilo Alves Alborghette. All rights reserved.
//

import Foundation

// MARK: - Response

enum RatingBusinessResponse {
    case success(RatingModel)
    case failure(RatingBusinessError)
}

enum RatingBusinessError: Error {
    case other(Error)
    case badStatus(Int)
    case connectionFail
}

// MARK: - Protocol

protocol RatingBusinessProtocol {
    typealias RatingBusinessCompletion = (RatingBusinessResponse) -> Void
    
    func getRating(completion: @escaping RatingBusinessCompletion)
}

// MARK: - Class

class RatingBusiness: RatingBusinessProtocol {
    
    // MARK: - Properties
    
    private let network: NetworkProtocol
    
    // MARK: - Life cycle
    
    init(network: NetworkProtocol = Network(withBaseUrl: APIUrl.baseUrl)) {
        self.network = network
    }
    
    // MARK: - Public methods
    
    func getRating(completion: @escaping RatingBusinessCompletion) {
        
        network.get(resource: APIUrl.Resource.rating) { response in
            
            switch response {
            case .success(let data):
                do {
                    let rating = try JSONDecoder().decode(RatingModel.self, from: data)
                    completion(.success(rating))
                } catch {
                    completion(.failure(.other(NSError(withMessage: "Decode error", andCode: 0))))
                }
            case .failure(let error):
                
                var ratingBusinessError: RatingBusinessError
                
                switch error {
                case .badStatus(let statusCode):
                    ratingBusinessError = .badStatus(statusCode)
                case .connectionFail:
                    ratingBusinessError = .connectionFail
                case .other(let customError):
                    ratingBusinessError = .other(customError)
                }
                
                completion(.failure(ratingBusinessError))
            }
            
        }
        
    }
    
}
