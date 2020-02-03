//
//  ProductListBusinessTests.swift
//  ProductListTests
//
//  Created by Murilo Alves Alborghette on 31/01/20.
//  Copyright © 2020 Murilo Alves Alborghette. All rights reserved.
//

import XCTest
@testable import ProductList

class ProductListBusinessTests: XCTestCase {

    func testSuccessGet() {
        
        let path = Bundle(for: type(of: self)).path(forResource: "ProductList", ofType: "json") ?? ""
        let contents = try? String(contentsOfFile: path)
        let data = contents?.data(using: .utf8) ?? Data()
        
        let response = NetworkResponse.success(data)
        let networkMock = NetworkMock(mockReturn: response)
        
        let expectationProductDetailBusiness = expectation(description: "expectation for testSuccessGet")
        
        let productListBusiness = ProductListBusiness(network: networkMock)
        productListBusiness.getProductList { response in
            switch response {
            case .success(let productList):
                XCTAssertEqual(123, productList.products.first?.identifier)
                XCTAssertEqual("Produto Teste", productList.products.first?.name)
            case .failure:
                XCTFail("testSuccessGet - should return .success")
            }
            
            expectationProductDetailBusiness.fulfill()
        }
        
        waitForExpectations(timeout: 5) { (error) in
            if let error = error {
                XCTFail("testSuccessGet - waitForExpectations: \(error.localizedDescription)")
            }
        }
    }

}
