//
//  ViewController.m
//  瀑布流
//
//  Created by 刘伟哲 on cellNumber18/4/17.
//  Copyright © cellNumber18年 刘伟哲. All rights reserved.
//

#import "ViewController.h"
#import "WaterFallLayout.h"
#define cellNumber 20
@interface ViewController ()<UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray<UIColor *> * ColorArray;
@property (nonatomic, strong) NSMutableArray * widthArray;
@property (nonatomic, strong) NSMutableArray * heightArray;
@end

@implementation ViewController

- (NSMutableArray *)ColorArray{
    if(!_ColorArray){
        _ColorArray = [[NSMutableArray alloc]init];
        for(int i=0;i<cellNumber;i++){
            int R = (arc4random() % 256) ;
            int G = (arc4random() % 256) ;
            int B = (arc4random() % 256) ;
            [_ColorArray addObject:[UIColor colorWithRed:(R/255.0) green:(G/255.0) blue:(B/255.0) alpha:1]];
        }
    }
    return _ColorArray;
}
- (NSMutableArray *)widthArray{
    if(!_widthArray){
        _widthArray = [[NSMutableArray alloc]init];
        for(int i=0;i<cellNumber;i++){
            int R = [self getRandomNumber:50 to:100];
            [_widthArray addObject:[NSString stringWithFormat:@"%d",R]];
        }
    }
    return _widthArray;
}
- (NSMutableArray *)heightArray{
    if(!_heightArray){
        _heightArray = [[NSMutableArray alloc]init];
        for(int i=0;i<cellNumber;i++){
            int R = [self getRandomNumber:100 to:150];
            [_heightArray addObject:[NSString stringWithFormat:@"%d",R]];
        }
    }
    return _heightArray;
}
-(int)getRandomNumber:(int)from to:(int)to
{
    return (int)(from + (arc4random() % (to - from + 1)));
}
- (void)viewDidLoad {
    [super viewDidLoad];

    WaterFallLayout *waterfall = [[WaterFallLayout alloc]initWithColumnCount:4];
    
    //设置各属性的值
    waterfall.rowSpacing = 10;
    waterfall.columnSpacing = 10;
    waterfall.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    
    
    __weak ViewController * weakSelf = self;
    [waterfall setItemHeightBlock:^CGFloat(CGFloat itemWidth, NSIndexPath *indexPath) {
        //根据图片的原始尺寸，及显示宽度，等比例缩放来计算显示高度
        NSString * width = weakSelf.widthArray[indexPath.item];
        NSString * height = weakSelf.heightArray[indexPath.item];
        return height.intValue / width.intValue * itemWidth;
    }];
    
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:waterfall];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    self.collectionView.dataSource = self;
    [self.view addSubview:self.collectionView];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return cellNumber;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor = self.ColorArray[indexPath.item];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
