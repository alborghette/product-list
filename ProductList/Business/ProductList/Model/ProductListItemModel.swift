//
//  ProductListItemModel.swift
//  ProductList
//
//  Created by Murilo Alves Alborghette on 02/02/20.
//  Copyright © 2020 Murilo Alves Alborghette. All rights reserved.
//

import Foundation

struct ProductListItemModel: Codable {
    
    let identifier: Int
    let name: String
    let available: Bool
    let description: String
    let imageUrl: String
    let rating: Int
    let price: ProductListPriceModel

    private enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case name = "nome"
        case available = "disponivel"
        case description = "descricao"
        case imageUrl = "imagemUrl"
        case rating = "classificacao"
        case price = "preco"
    }
}
