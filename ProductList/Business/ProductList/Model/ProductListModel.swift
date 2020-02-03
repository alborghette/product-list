//
//  ProductListModel.swift
//  ProductList
//
//  Created by Murilo Alves Alborghette on 02/02/20.
//  Copyright © 2020 Murilo Alves Alborghette. All rights reserved.
//

import Foundation

struct ProductListModel: Codable {

    let products: [ProductListItemModel]
    let quantity: Int

    private enum CodingKeys: String, CodingKey {
        case products = "produtos"
        case quantity = "quantidade"
    }
}
