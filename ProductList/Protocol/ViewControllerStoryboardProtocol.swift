//
//  ViewControllerStoryboardProtocol.swift
//  ProductList
//
//  Created by Murilo Alves Alborghette on 01/02/20.
//  Copyright © 2020 Murilo Alves Alborghette. All rights reserved.
//

import UIKit

protocol ViewControllerStoryboardProtocol {
    static var storyboardId: String { get }
    static func instantiate() -> Self
}

extension ViewControllerStoryboardProtocol {
    
    static func instantiate() -> Self {
        
        guard let viewController = UIStoryboard.viewController(from: .main, andViewControllerId: storyboardId) as? Self else {
            fatalError("Could not instantiate ViewController with identifier: \(storyboardId)")
        }
        
        return viewController
    }
    
}
