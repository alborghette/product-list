//
//  ProductDetailModel.swift
//  ProductList
//
//  Created by Murilo Alves Alborghette on 02/02/20.
//  Copyright © 2020 Murilo Alves Alborghette. All rights reserved.
//

import Foundation

struct ProductDetailModel: Codable {

    let identifier: Int
    let name: String
    let description: String
    let model: ProductDetailModelModel

    private enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case name = "nome"
        case description = "descricao"
        case model = "modelo"
    }
}
