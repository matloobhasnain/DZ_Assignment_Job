//
//  ProductDetailVC.m
//  DZ_Test_iOS
//
//  Created by PureLogics on 16/01/2020.
//  Copyright © 2020 Matloob Hasnain. All rights reserved.
//

#import "ProductDetailVC.h"
#import <DZ_Test_iOS-Swift.h>
@import SDWebImage;
@interface ProductDetailVC ()

@property (weak, nonatomic) IBOutlet UICollectionView *productImageCollection;
@property (weak, nonatomic) IBOutlet UIPageControl *pager;
@property (weak, nonatomic) IBOutlet UILabel *productNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *productPriceLabel;


@end

@implementation ProductDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpPager];
    [self showDataOnUI];
   
    [_productImageCollection registerNib:[UINib nibWithNibName:@"ImageViewerCell" bundle:nil] forCellWithReuseIdentifier:@"ImageViewerCell"];

}
- (void)setUpPager {
    self.pager.numberOfPages = self.ImagesArray.count;
}

- (void)showDataOnUI {
    self.productPriceLabel.text = self.productPrice;
    self.productNameLabel.text = self.productName;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.ImagesArray.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ImageViewerCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"ImageViewerCell" forIndexPath:indexPath];
    NSString *imageURL = [self.ImagesArray objectAtIndex:indexPath.row];
    [cell.productImageView sd_setImageWithURL:[NSURL URLWithString:imageURL]
                 placeholderImage:[UIImage imageNamed:@"load.png"]];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.productImageCollection.frame.size.width, self.productImageCollection.frame.size.height);
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
}


@end
