//
//  WaterFallLayout.h
//  瀑布流
//
//  Created by 刘伟哲 on 2018/4/17.
//  Copyright © 2018年 刘伟哲. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *实现了瀑布流功能，但是不能添加头部和底部视图，如项目中有添加头部或底部视图的需求，请慎用！！！
 */
@interface WaterFallLayout : UICollectionViewLayout


#pragma mark- 属性
//总共多少列，默认是2
@property (nonatomic, assign) NSInteger columnCount;

//列间距，默认是0
@property (nonatomic, assign) NSInteger columnSpacing;

//行间距，默认是0
@property (nonatomic, assign) NSInteger rowSpacing;

//section与collectionView的间距，默认是（0，0，0，0）
@property (nonatomic, assign) UIEdgeInsets sectionInset;

//计算item高度的block，将item的高度与indexPath传递给外界
@property (nonatomic, strong) CGFloat(^itemHeightBlock)(CGFloat itemHeight,NSIndexPath *indexPath);

- (instancetype)initWithColumnCount:(NSInteger)columnCount;
@end
