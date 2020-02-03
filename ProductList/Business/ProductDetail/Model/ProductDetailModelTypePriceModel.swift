//
//  ProductDetailModelTypePriceModel.swift
//  ProductList
//
//  Created by Murilo Alves Alborghette on 03/02/20.
//  Copyright © 2020 Murilo Alves Alborghette. All rights reserved.
//

import Foundation

struct ProductDetailModelTypePriceModel: Codable {

    let installments: String
    let previousPrice: Double
    let currentPrice: Double
    let discount: Int

    private enum CodingKeys: String, CodingKey {
        case installments = "planoPagamento"
        case previousPrice = "precoAnterior"
        case currentPrice = "precoAtual"
        case discount = "porcentagemDesconto"
    }
}
