//
//  ProductDetailModelModel.swift
//  ProductList
//
//  Created by Murilo Alves Alborghette on 03/02/20.
//  Copyright © 2020 Murilo Alves Alborghette. All rights reserved.
//

import Foundation

struct ProductDetailModelModel: Codable {

    let type: ProductDetailModelTypeModel

    private enum CodingKeys: String, CodingKey {
        case type = "padrao"
    }
}
