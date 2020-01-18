//
//  ProductListingVC.swift
//  DZ_Test_iOS
//
//  Created by PureLogics on 16/01/2020.
//  Copyright © 2020 Matloob Hasnain. All rights reserved.
//

import UIKit
import SkeletonView

class ProductListingVC: UIViewController {
    
    // Outlets
    @IBOutlet weak var productCollectionView: UICollectionView!
    
    // conditional Variables
    
    var isCollectionAnimation = true
    
    // datavariables
    
    var productArray = [Results]()
    
    private var productListingPresenter:ProductListingPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productCollectionView.register(UINib(nibName: "ProductCell", bundle: nil), forCellWithReuseIdentifier: "ProductCell")
        setupPresenter()
        fetchProducts()
    }
    func setupPresenter() {
        productListingPresenter = ProductListingPresenter(protocole: self)
    }
    
    func fetchProducts() {
        productListingPresenter?.fetchProductList()
    }
    
}




extension ProductListingVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if (isCollectionAnimation) {
            return
        }
        let product = productArray[indexPath.row]
        let productDetailVC = self.storyboard?.instantiateViewController(withIdentifier: "ProductDetailVC") as! ProductDetailVC
        let objCMutableArray = NSMutableArray(array:product.image_urls_thumbnails ?? [])
        productDetailVC.imagesArray = objCMutableArray
        productDetailVC.productName = product.name ?? ""
        productDetailVC.productPrice = product.price ?? ""
        self.navigationController?.pushViewController(productDetailVC, animated: true)
    }
    
}

extension ProductListingVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (UIScreen.main.bounds.width)/2, height: 270)
    }
    
}
extension ProductListingVC: UICollectionViewDataSource , SkeletonCollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (isCollectionAnimation) {
            return 5
        }
        return productArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as! ProductCell
        if(isCollectionAnimation) {
            
            let gradient = SkeletonGradient(baseColor: UIColor.alizarin)
            let animation = SkeletonAnimationBuilder().makeSlidingAnimation(withDirection: .rightLeft)
            cell.shadowView.showAnimatedGradientSkeleton(usingGradient: gradient, animation: animation)
            
        }
        else {
            cell.shadowView.hideSkeleton()
            let product = productArray[indexPath.row]
            cell.configureCell(product: product)
        }
        
        return cell
        
    }
    
    func collectionSkeletonView(_ skeletonView: UICollectionView, cellIdentifierForItemAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return "RecentPostCell"
    }
    
    func collectionSkeletonView(_ skeletonView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    
}



extension ProductListingVC: ProductListingProtocole {
    
    func didRecieveProductLising(products: ProductListing?, message: String?) {
        
        
        if((message) != nil) {
            Dzutil.sharedInstance.showAlert(message: message!, sourceController: self)
        }
        else {
            // hide animation and reload collection view
            isCollectionAnimation = false
            productArray  = products?.results ?? [Results]()
            productCollectionView.reloadData()
        }
    }
    
    
}
