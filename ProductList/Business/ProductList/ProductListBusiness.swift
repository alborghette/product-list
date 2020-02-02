//
//  ProductListBusiness.swift
//  ProductList
//
//  Created by Murilo Alves Alborghette on 01/02/20.
//  Copyright © 2020 Murilo Alves Alborghette. All rights reserved.
//

import Foundation

enum ProductListBusinessResponse {
    case success(ProductList)
    case failure(ProductListBusinessError)
}

enum ProductListBusinessError: Error {
    case other(Error)
    case badStatus(Int)
    case connectionFail
}

protocol ProductListBusinessProtocol {
    typealias ProductListBusinessCompletion = (ProductListBusinessResponse) -> Void
    
    func getProductList(completion: @escaping ProductListBusinessCompletion)
}

class ProductListBusiness: ProductListBusinessProtocol {
    
    let network: NetworkProtocol
    
    init() {
        network = Network(withBaseUrl: APIUrl.baseUrl)
    }
    
    func getProductList(completion: @escaping ProductListBusinessCompletion) {
        
        network.get(resource: APIUrl.Resource.productList) { response in
            
            switch response {
            case .success(let data):
                do {
                    let productList = try JSONDecoder().decode(ProductList.self, from: data)
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
