//
//  ProductDetailBusiness.swift
//  ProductList
//
//  Created by Murilo Alves Alborghette on 02/02/20.
//  Copyright © 2020 Murilo Alves Alborghette. All rights reserved.
//

import Foundation

// MARK: - Response

enum ProductDetailBusinessResponse {
    case success(ProductDetailModel)
    case failure(ProductDetailBusinessError)
}

enum ProductDetailBusinessError: Error {
    case other(Error)
    case badStatus(Int)
    case connectionFail
}

// MARK: - Protocol

protocol ProductDetailBusinessProtocol {
    typealias ProductDetailBusinessCompletion = (ProductDetailBusinessResponse) -> Void
    
    func getProductDetail(completion: @escaping ProductDetailBusinessCompletion)
}

// MARK: - Class

class ProductDetailBusiness: ProductDetailBusinessProtocol {
    
    // MARK: - Properties
    
    private let network: NetworkProtocol
    
    // MARK: - Life cycle
    
    init(network: NetworkProtocol = Network(withBaseUrl: APIUrl.baseUrl)) {
        self.network = network
    }
    
    // MARK: - Public methods
    
    func getProductDetail(completion: @escaping ProductDetailBusinessCompletion) {
        
        network.get(resource: APIUrl.Resource.productDetail) { response in
            
            switch response {
            case .success(let data):
                do {
                    let productDetail = try JSONDecoder().decode(ProductDetailModel.self, from: data)
                    completion(.success(productDetail))
                } catch {
                    completion(.failure(.other(NSError(withMessage: "Decode error", andCode: 0))))
                }
            case .failure(let error):
                
                var productDetailBusinessError: ProductDetailBusinessError
                
                switch error {
                case .badStatus(let statusCode):
                    productDetailBusinessError = .badStatus(statusCode)
                case .connectionFail:
                    productDetailBusinessError = .connectionFail
                case .other(let customError):
                    productDetailBusinessError = .other(customError)
                }
                
                completion(.failure(productDetailBusinessError))
            }
            
        }
        
    }
    
}
