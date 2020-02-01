//
//  ListViewController.swift
//  ProductList
//
//  Created by Murilo Alves Alborghette on 31/01/20.
//  Copyright © 2020 Murilo Alves Alborghette. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {

    static let storyboardId = "ListViewController"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}

extension ListViewController: ViewControllerStoryboardProtocol {
    
    static func instantiate() -> Self {
        return UIStoryboard.viewController(from: .main, andViewControllerId: storyboardId)
    }
    
}
