//
//  MyQingKuang.m
//  BoWanJuanForPad
//
//  Created by 杨帅 on 2018/5/28.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "MyQingKuang.h"
#import "MyQingKuangCollectionViewCell.h"
#import "AchievementReportViewController.h"
#define itemWidth LENGTH(85)
#define itemHeight LENGTH(85)+LENGTH(43)

@interface MyQingKuang ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic, strong) UICollectionView *collectionView; /**< 集合视图 */

@end
@implementation MyQingKuang{
    BaseLabel * titles;
}

-(instancetype)init{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    WS(ws);
    
    titles = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:ChangYongTitLe LabelFont:TextFontCu(19) TextAlignment:NSTextAlignmentLeft Text:@""];
    [self addSubview:titles];
    [titles mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(LENGTH(26));
        make.left.equalTo(ws).with.offset(LENGTH(15));
    }];
    
    [self addSubview:self.collectionView];
    
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        //        make.edges.mas_equalTo(ws);
        make.left.equalTo(ws).with.offset(0);
        make.top.equalTo(self->titles.mas_bottom).with.offset(LENGTH(20));
        make.right.equalTo(ws).with.offset(0);
        make.bottom.mas_equalTo(ws);
        make.height.mas_offset(itemHeight);
    }];
}
#pragma mark *** UICollectionViewDataSource ***
// 设置组数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

// 设置行数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _itemarray.count;
}

// 设置单元格
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    // item重用机制
    
    MyQingKuangCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.title = _itemarray[indexPath.row];
    cell.contenttitle = _contertarray[indexPath.row];
    return cell;
}

-( void )collectionView:( UICollectionView *)collectionView didSelectItemAtIndexPath:( NSIndexPath *)indexPath{
    
    AchievementReportViewController * vc = [AchievementReportViewController new];
    if ([_itemarray[indexPath.row] isEqualToString:@"阅读均衡"]) {
        vc.tiao = 0;
    }else if ([_itemarray[indexPath.row] isEqualToString:@"阅读能力"]){
        vc.tiao = 1;
    }else if ([_itemarray[indexPath.row] isEqualToString:@"阅读量"]){
        vc.tiao = 2;
    }else if ([_itemarray[indexPath.row] isEqualToString:@"识字量"]){
        vc.tiao = 3;
    }else if ([_itemarray[indexPath.row] isEqualToString:@"识词量"]){
        vc.tiao = 4;
    }
    [self.nav pushViewController:vc animated:YES];
}

- (UICollectionView *)collectionView {
    if (_collectionView == nil) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.itemSize = CGSizeMake(itemWidth,itemHeight);
        //定义每个UICollectionView 横向的间距
        flowLayout.minimumLineSpacing = LENGTH(15);
        //定义每个UICollectionView 纵向的间距
        flowLayout.minimumInteritemSpacing = LENGTH(15);
        //定义每个UICollectionView 的边距距
        flowLayout.sectionInset = UIEdgeInsetsMake(0, LENGTH(15), 0, LENGTH(15));//上左下右
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, 0,0) collectionViewLayout:flowLayout];
        
        //注册cell和ReusableView（相当于头部）
        [_collectionView registerClass:[MyQingKuangCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        //设置代理
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        // 设置是否允许滚动
        _collectionView.scrollEnabled = YES;
        //背景颜色
        _collectionView.backgroundColor = [UIColor clearColor];
        //自适应大小
        _collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _collectionView.scrollsToTop = NO;
        
    }else{
        
        [_collectionView reloadData];
    }
    return _collectionView;
}




- (void)setTitle:(NSString *)title{
    titles.text = title;
}
- (void)setItemarray:(NSMutableArray *)itemarray{
    _itemarray = itemarray;
    [_collectionView reloadData];
}
- (void)setContertarray:(NSMutableArray *)contertarray{
    _contertarray = contertarray;
    [_collectionView reloadData];
}
@end
