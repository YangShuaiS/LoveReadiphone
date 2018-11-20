//
//  NBCweekReadingView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/6.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "NBCweekReadingView.h"
#import "NBCchannelCollectionView.h"
#import "NBCmenuView.h"
#import "NBCMoreWeekViewController.h"
@implementation NBCweekReadingView

{
    NBCchannelCollectionView * nfcc;
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
    
    NBCmenuView * menu = [NBCmenuView new];
    menu.label.text = @"本周精读";
    menu.styles = NBCmenuViewStyleimage;
    [self addSubview:menu];
    [menu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.and.right.mas_equalTo(ws);
    }];
    [menu setBlock:^{
        [ws push];
    }];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(LENGTH(332),LENGTH(108));
    //定义每个UICollectionView 横向的间距
    flowLayout.minimumLineSpacing = LENGTH(12);
    //定义每个UICollectionView 纵向的间距
    flowLayout.minimumInteritemSpacing = 0;
    //定义每个UICollectionView 的边距距
    flowLayout.sectionInset = UIEdgeInsetsMake(0, LENGTH(22), 0, LENGTH(22));//上左下右
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;

    nfcc = [[NBCchannelCollectionView alloc] initWithFrame:CGRectMake(0, 0, 0,0) collectionViewLayout:flowLayout];
//    nfcc.pagingEnabled = YES;
    nfcc.more = NO;
    nfcc.zt = NO;
    nfcc.decelerationRate = UIScrollViewDecelerationRateNormal;

    [self addSubview:nfcc];
    [nfcc mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(0);
        make.top.equalTo(menu.mas_bottom).with.offset(LENGTH(10));
        make.right.equalTo(ws).with.offset(0);
        make.bottom.equalTo(ws).with.offset(-LENGTH(14));
        make.height.mas_equalTo(LENGTH(108)+LENGTH(14)+LENGTH(14));
    }];
}

- (void)push{
    NBCMoreWeekViewController * vc = [NBCMoreWeekViewController new];
    [self.nav pushViewController:vc animated:YES];
}
- (void)setModel:(NBCALLModel *)model{
    _model = model;
    nfcc.nav = self.nav;
    nfcc.itemArray = model.themeWeek;
}
@end
