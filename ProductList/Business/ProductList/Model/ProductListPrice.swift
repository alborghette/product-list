//
//  ProductListPrice.swift
//  ProductList
//
//  Created by Murilo Alves Alborghette on 02/02/20.
//  Copyright © 2020 Murilo Alves Alborghette. All rights reserved.
//

import Foundation

struct ProductListPrice: Decodable {
    
    let installment: String
    let previousPrice: Double
    let currentPrice: Double
    
    private enum CodingKeys: String, CodingKey {
        case installment = "planoPagamento"
        case previousPrice = "precoAnterior"
        case currentPrice = "precoAtual"
    }
    
}
