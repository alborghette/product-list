//
//  UIStoryboard.swift
//  ProductList
//
//  Created by Murilo Alves Alborghette on 01/02/20.
//  Copyright © 2020 Murilo Alves Alborghette. All rights reserved.
//

import UIKit

extension UIStoryboard {
    
    static func viewController<T: UIViewController>(from storyboard: UIStoryboard.Name, andViewControllerId identifier: String) -> T {
        let storyboard = UIStoryboard(name: storyboard.rawValue, bundle: Bundle.main)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: identifier) as? T else {
            fatalError("Could not instantiate ViewController with identifier: \(identifier)")
        }
        
        return viewController
    }
    
    enum Name: String {
        case main = "Main"
    }
    
}
