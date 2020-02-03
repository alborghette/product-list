//
//  ProductListBusiness.swift
//  ProductList
//
//  Created by Murilo Alves Alborghette on 01/02/20.
//  Copyright © 2020 Murilo Alves Alborghette. All rights reserved.
//

import Foundation

// MARK: - Responses

enum ProductListBusinessResponse {
    case success(ProductListModel)
    case failure(ProductListBusinessError)
}

enum ProductListBusinessError: Error {
    case other(Error)
    case badStatus(Int)
    case connectionFail
}

// MARK: - Protocol

protocol ProductListBusinessProtocol {
    typealias ProductListBusinessCompletion = (ProductListBusinessResponse) -> Void
    
    func getProductList(completion: @escaping ProductListBusinessCompletion)
}

// MARK: - Class

class ProductListBusiness: ProductListBusinessProtocol {
    
    // MARK: - Properties
    
    private let network: NetworkProtocol
    
    // MARK: - Life cycle
    
    init(network: NetworkProtocol = Network(withBaseUrl: APIUrl.baseUrl)) {
        self.network = network
    }
    
    // MARK: - Public methods
    
    func getProductList(completion: @escaping ProductListBusinessCompletion) {
        
        network.get(resource: APIUrl.Resource.productList) { response in
            
            switch response {
            case .success(let data):
                do {
                    let productList = try JSONDecoder().decode(ProductListModel.self, from: data)
                    completion(.success(productList))
                } catch {
                    completion(.failure(.other(NSError(withMessage: "Decode error", andCode: 0))))
                }
            case .failure(let error):
                
                var productListBusinessError: ProductListBusinessError
                
                switch error {
                case .badStatus(let statusCode):
                    productListBusinessError = .badStatus(statusCode)
                case .connectionFail:
                    productListBusinessError = .connectionFail
                case .other(let customError):
                    productListBusinessError = .other(customError)
                }
                
                completion(.failure(productListBusinessError))
            }
            
        }
        
    }
    
}
