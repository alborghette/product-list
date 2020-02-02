//
//  ListCollectionViewCell.swift
//  ProductList
//
//  Created by Murilo Alves Alborghette on 02/02/20.
//  Copyright © 2020 Murilo Alves Alborghette. All rights reserved.
//

import UIKit
import Kingfisher

class ListCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "ListCollectionViewCell"
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var previousPriceLabel: UILabel!
    @IBOutlet weak var currentPriceLabel: UILabel!
    @IBOutlet weak var installmentPriceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = .white
    }
    
    func setupCell(withModel productListItem: ProductListItem) {
        
        if let imageUrl = URL(string: productListItem.imageUrl) {
            imageView.kf.setImage(with: imageUrl)
        }
        
        descriptionLabel.text = productListItem.description
        ratingLabel.text = "\(productListItem.rating)/5"
        
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: productListItem.price.previousPrice.currencyString())
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: NSRange(location: 0, length: attributeString.length))
        
        previousPriceLabel.attributedText = attributeString
        currentPriceLabel.text = productListItem.price.currentPrice.currencyString()
        installmentPriceLabel.text = productListItem.price.installment
    }
}
