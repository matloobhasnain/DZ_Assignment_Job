//
//  ProductCell.swift
//  DZ_Test_iOS
//
//  Created by PureLogics on 17/01/2020.
//  Copyright © 2020 Matloob Hasnain. All rights reserved.
//

import UIKit
import SDWebImage

@objc class ProductCell: UICollectionViewCell {
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var productImagView: UIImageView!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productNameLabel: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configureCell(product:Results) {
        
        if let url = product.image_urls_thumbnails?[0] {
             productImagView.sd_setImage(with: URL(string:url), placeholderImage: UIImage(named: "load.png"))
        }
        productNameLabel.text = product.name
        productPriceLabel.text = product.price
        
       

    }
    
    @IBAction func buyButtonPressed(_ sender: UIButton) {
    }
    
}
