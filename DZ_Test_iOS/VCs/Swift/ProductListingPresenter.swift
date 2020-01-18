//
//  ProductListingPresenter.swift
//  DZ_Test_iOS
//
//  Created by PureLogics on 16/01/2020.
//  Copyright © 2020 Matloob Hasnain. All rights reserved.
//

import UIKit

protocol ProductListingProtocole : NSObjectProtocol {
    
    func didRecieveProductLising(products: ProductListing?, message: String?)
}

class ProductListingPresenter: NSObject {
    
    weak private var productListingProtocol:ProductListingProtocole?
    
    init(protocole:ProductListingProtocole) {
        self.productListingProtocol = protocole
    }
    
    func fetchProductList() {
        NetworkLayer.sharedInstance.fetchProduct(success: { [weak self] (productListings) in
            if(productListings?.results?.count ?? 0 < 1) {
                self?.productListingProtocol?.didRecieveProductLising(products: productListings, message: "No Product found")
            }
            else {
                self?.productListingProtocol?.didRecieveProductLising(products: productListings, message: nil)
            }
            
        }) { [weak self] (errorString) in
            
             self?.productListingProtocol?.didRecieveProductLising(products: nil, message: errorString)
        }
        
    }
    
}
