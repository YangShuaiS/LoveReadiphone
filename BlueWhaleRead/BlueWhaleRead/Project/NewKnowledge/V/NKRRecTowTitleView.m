//
//  NKRRecTowTitleView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/2/14.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "NKRRecTowTitleView.h"
#import "NKRRecommendedCollectionView.h"
#import "NBCmenuView.h"
#import "SearchMyHistoryViewController.h"
#define itemWidth LENGTH(162)
//#define itemHeight LENGTH(162*0.610561)+LENGTH(15)+LENGTH(20)+LENGTH(5)+LENGTH(16)
#define itemHeight LENGTH(163)*0.552147+LENGTH(10)+LENGTH(14)+LENGTH(3)+LENGTH(12)

@implementation NKRRecTowTitleView{
    NKRRecommendedCollectionView * collectView;
    NBCmenuView * menu;
    CGFloat topheight;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addview];
        
    }
    return self;
}

- (void)addview{
    WS(ws);
    menu = [NBCmenuView new];
    menu.label.text = @"相关推荐";
    menu.styles = NBCmenuViewStyleimage;
    [self addSubview:menu];
    [menu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.and.right.mas_equalTo(ws);
    }];
    [menu setBlock:^{
        [ws push];
    }];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(itemWidth,itemHeight);
    //    //定义每个UICollectionView 横向的间距
    flowLayout.minimumLineSpacing = LENGTH(15);
    //    //定义每个UICollectionView 纵向的间距
    flowLayout.minimumInteritemSpacing = 0;
    //    //定义每个UICollectionView 的边距距
    flowLayout.sectionInset = UIEdgeInsetsMake(0, LENGTH(17), 0, LENGTH(17));//上左下右
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    collectView = [[NKRRecommendedCollectionView alloc] initWithFrame:CGRectMake(0, 0, 0,0) collectionViewLayout:flowLayout];
    collectView.style = 3;
    collectView.allinter = 4;
    [self addSubview:collectView];
    [collectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(LENGTH(0));
        make.top.equalTo(self->menu.mas_bottom);
        make.right.equalTo(ws).with.offset(LENGTH(0));
        make.bottom.equalTo(ws).with.offset(-LENGTH(14));
        make.height.mas_equalTo(itemHeight);
    }];
    topheight = LENGTH(47);
}
- (void)setItemArray:(NSMutableArray *)itemArray{
    _itemArray = itemArray;
    collectView.itemarray = itemArray;
    
    if (itemArray.count == 0) {
        menu.hidden = YES;
        [menu mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(0);
        }];
    }else{
        [menu mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(self->topheight);
        }];
        menu.hidden = NO;
        
    }
}
- (void)push{
    SearchMyHistoryViewController * vc = [SearchMyHistoryViewController new];
    vc.titles = @"相关推荐";
    vc.style = 3;
    [[self viewController].navigationController pushViewController:vc animated:YES];
}
@end
