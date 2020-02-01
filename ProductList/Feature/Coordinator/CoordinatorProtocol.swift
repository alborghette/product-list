//
//  CoordinatorProtocol.swift
//  ProductList
//
//  Created by Murilo Alves Alborghette on 01/02/20.
//  Copyright © 2020 Murilo Alves Alborghette. All rights reserved.
//

import UIKit

protocol CoordinatorProtocol {
    
    var navigationController: UINavigationController { get set }
    
    func start()
}
