//
//  RatingModel.swift
//  ProductList
//
//  Created by Murilo Alves Alborghette on 03/02/20.
//  Copyright © 2020 Murilo Alves Alborghette. All rights reserved.
//

import Foundation

struct RatingModel: Codable {
    
    let quantity: Int
    let classification: Double
    let comments: RatingCommentModel
    
    private enum CodingKeys: String, CodingKey {
        case quantity = "quantidade"
        case classification = "classificacao"
        case comments = "opinioes"
    }
    
}
