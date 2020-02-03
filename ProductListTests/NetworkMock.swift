//
//  NetworkMock.swift
//  ProductListTests
//
//  Created by Murilo Alves Alborghette on 03/02/20.
//  Copyright © 2020 Murilo Alves Alborghette. All rights reserved.
//

import Foundation
@testable import ProductList

class NetworkMock: NetworkProtocol {
    
    let mockReturn: NetworkResponse
    init(mockReturn: NetworkResponse) {
        self.mockReturn = mockReturn
    }
    
    func get(resource: String, completion: @escaping NetworkCompletion) {
        completion(mockReturn)
    }
    
}
