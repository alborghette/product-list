//
//  APIUrl.swift
//  ProductList
//
//  Created by Murilo Alves Alborghette on 01/02/20.
//  Copyright © 2020 Murilo Alves Alborghette. All rights reserved.
//

import Foundation

struct APIUrl {
    
    static let apiVersion = "v2/"
    static var baseUrl = "http://www.mocky.io/" + apiVersion
    
    struct Resource {
        static var productList = "5d1b4f0f34000074000006dd"
        static var productDetail = "5d1b4fd23400004c000006e1"
        static var rating = "5d1b4f9134000078000006e0"
        static var moreProducts = "5d1b50063400000f000006e7"
        static var comboProducts = "5d1b505134000074000006ec"
        static let otherProducts = "5d1b507634000054000006ed"
    }
}
