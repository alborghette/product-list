//
//  TabBarCoordinator.swift
//  ProductList
//
//  Created by Murilo Alves Alborghette on 02/02/20.
//  Copyright © 2020 Murilo Alves Alborghette. All rights reserved.
//

import UIKit

class TabBarCoordinator {
    
    // MARK: - Tabs
    private let listNavigationController = UINavigationController()
    private let listCordinator: ListCoordinator
    
    // MARK: - Init
    init() {
        listCordinator = ListCoordinator(navigationController: listNavigationController)
    }
    
    // MARK: - Public methods
    func start() -> TabBarViewController {
        listCordinator.start()
        
        let viewController = TabBarViewController.instantiate()
        viewController.viewControllers = [listNavigationController]
        
        return viewController
    }
    
}
