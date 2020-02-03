//
//  RatingCommentModel.swift
//  ProductList
//
//  Created by Murilo Alves Alborghette on 03/02/20.
//  Copyright © 2020 Murilo Alves Alborghette. All rights reserved.
//

import Foundation

struct RatingCommentModel: Codable {
    
    let client: String
    let date: String
    let title: String
    let comment: String
    let rating: Int
    
    private enum CodingKeys: String, CodingKey {
        case client = "cliente"
        case date = "data"
        case title = "titulo"
        case comment = "comentario"
        case rating = "nota"
    }
    
}
