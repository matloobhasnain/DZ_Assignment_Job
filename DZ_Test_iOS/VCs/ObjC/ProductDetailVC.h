//
//  ProductDetailVC.h
//  DZ_Test_iOS
//
//  Created by PureLogics on 16/01/2020.
//  Copyright © 2020 Matloob Hasnain. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ProductDetailVC : UIViewController <UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

// we cannot access struct inside objective c thats why using property alone instead of object

@property (nonatomic,retain) NSMutableArray *ImagesArray;
@property (nonatomic,retain) NSString *productName;
@property (nonatomic,retain) NSString *productPrice;


@end

NS_ASSUME_NONNULL_END
