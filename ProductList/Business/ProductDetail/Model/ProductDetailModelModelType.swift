//
//  ProductDetailModelModelType.swift
//  ProductList
//
//  Created by Murilo Alves Alborghette on 03/02/20.
//  Copyright © 2020 Murilo Alves Alborghette. All rights reserved.
//

import Foundation

struct ProductDetailModelTypeModel: Codable {

    let sku: Int
    let name: String
    let price: ProductDetailModelTypePriceModel
    let images: ProductDetailModelTypeImagesModel

    private enum CodingKeys: String, CodingKey {
        case sku = "sku"
        case name = "nome"
        case price = "preco"
        case images = "imagens"
    }
}
