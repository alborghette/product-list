//
//  ListViewController.swift
//  ProductList
//
//  Created by Murilo Alves Alborghette on 31/01/20.
//  Copyright © 2020 Murilo Alves Alborghette. All rights reserved.
//

import UIKit

// MARK: - ListViewController Navigation Delegate

protocol ListViewControllerNavigationDelegate: AnyObject {
    func goToProductDetail(byProductId productId: Int)
}

// MARK: - ListViewController

class ListViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var productListColletionView: UICollectionView!
    
    // MARK: - Dependencies
    
    var productListBusiness: ProductListBusinessProtocol = ProductListBusiness()
    weak var navigationDelegate: ListViewControllerNavigationDelegate?
    
    // MARK: - Properties
    
    private let cellHeight: CGFloat = 300
    private let collectionViewBorder: CGFloat = 3.0
    private let collectionViewBackgroundColor = UIColor(red: 240/255.0, green: 240/255.0, blue: 240/255.0, alpha: 1)
    private var productList: ProductListModel?
    
    // MARK: - View Controller Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Produtos"
        setupProductListCollectionView()
        requestProductList()
    }
    
    // MARK: - Private methods
    
    private func setupProductListCollectionView() {
        productListColletionView.dataSource = self
        productListColletionView.delegate = self
        productListColletionView.backgroundColor = collectionViewBackgroundColor
    }
    
    private func requestProductList() {
        productListBusiness.getProductList { [weak self] response in
            
            guard let self = self else {
                return
            }
            
            switch response {
            case .success(let productList):
                self.productList = productList
                self.productListColletionView.reloadData()
            case .failure(let error):
                switch error {
                case .badStatus(let statusCode):
                    self.showErrorMessage("\(statusCode)")
                case .other(let error):
                    self.showErrorMessage(error.localizedDescription)
                case .connectionFail:
                    self.showErrorMessage("offline =/")
                }
            }
        }
    }
    
    private func showErrorMessage(_ message: String) {
        let alert = UIAlertController(title: "Atenção", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

// MARK: - ViewControllerStoryboard Protocol

extension ListViewController: ViewControllerStoryboardProtocol {
    
    static var storyboardId: String = "ListViewController"
    
}

// MARK: - UICollectionView Delegate FlowLayout Protocol

extension ListViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (self.view.frame.width - collectionViewBorder) / 2
        return CGSize(width: width, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let productId = productList?.products[indexPath.row].identifier {
            navigationDelegate?.goToProductDetail(byProductId: productId)
        }
    }
}

// MARK: - UICollectionView DataSource

extension ListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let productList = self.productList?.products else {
            return 0
        }
        
        return productList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let productListItem = self.productList?.products[indexPath.row],
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListCollectionViewCell.reuseIdentifier, for: indexPath) as? ListCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.setupCell(withModel: productListItem)
        return cell
    }
}
