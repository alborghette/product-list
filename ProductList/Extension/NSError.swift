//
//  NSError.swift
//  ProductList
//
//  Created by Murilo Alves Alborghette on 02/02/20.
//  Copyright © 2020 Murilo Alves Alborghette. All rights reserved.
//

import Foundation

extension NSError {
    
    convenience init(withMessage message: String, andCode code: Int) {
        self.init(domain: message, code: code, userInfo: nil)
    }
    
}
