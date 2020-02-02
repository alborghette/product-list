//
//  ProductList.swift
//  ProductList
//
//  Created by Murilo Alves Alborghette on 02/02/20.
//  Copyright © 2020 Murilo Alves Alborghette. All rights reserved.
//

import Foundation

struct ProductList: Decodable {

    let products: [ProductListItem]
    let quantity: Int

    private enum CodingKeys: String, CodingKey {
        case products = "produtos"
        case quantity = "quantidade"
    }
}
