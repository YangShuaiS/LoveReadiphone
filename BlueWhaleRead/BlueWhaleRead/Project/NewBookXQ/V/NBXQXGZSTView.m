//
//  NBXQXGZSTView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/3/19.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "NBXQXGZSTView.h"
#import "NKRRecommendedCollectionView.h"
#import "SearchMyHistoryViewController.h"
#define itemWidth LENGTH(163)
#define itemHeight LENGTH(163)*0.552147+LENGTH(10)+LENGTH(14)
@implementation NBXQXGZSTView{
    NKRRecommendedCollectionView * collectView;
    UIView * tab;
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
    self.backgroundColor = RGB(255, 255, 255);
    self.layer.masksToBounds = YES;
    WS(ws);
    UIImageView * leftimageview = [UIImageView new];
    leftimageview.contentMode = UIViewContentModeScaleAspectFit;
    leftimageview.image = UIIMAGE(@"椭圆3");
    [self addSubview:leftimageview];
    [leftimageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws).with.offset(LENGTH(6));
        make.left.mas_equalTo(ws).with.offset(LENGTH(9));
        make.size.mas_equalTo(CGSizeMake(LENGTH(leftimageview.image.size.width), LENGTH(leftimageview.image.size.height)));
    }];
    
    BaseLabel * jj = [[BaseLabel alloc] initWithTxteColor:RGB(31, 31, 31) LabelFont:TextFont(18) TextAlignment:NSTextAlignmentLeft Text:@"相关知识图"];
    [self addSubview:jj];
    [jj mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws).with.offset(LENGTH(12));
        make.left.mas_equalTo(ws).with.offset(LENGTH(20));
    }];
    
   FLAnimatedImageView* bakimage = [FLAnimatedImageView new];
    bakimage.image = UIIMAGE(@"箭头");
    [self addSubview:bakimage];
    [bakimage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(ws).with.offset(-LENGTH(22));
        make.centerY.mas_equalTo(jj);
        make.size.mas_equalTo(CGSizeMake(LENGTH(20), LENGTH(20)));
    }];
    
    tab = [UIView new];
    [self addSubview:tab];
    [tab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.and.top.and.bottom.mas_equalTo(ws);
        make.width.mas_equalTo(LENGTH(100));
    }];
    tab.userInteractionEnabled = NO;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click)];
    [tab addGestureRecognizer:tap];
    
    
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
    collectView.style = 2;
    collectView.allinter = 2;
    [self addSubview:collectView];
    [collectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(LENGTH(0));
        make.top.equalTo(jj.mas_bottom).with.offset(LENGTH(13));
        make.right.equalTo(ws).with.offset(LENGTH(0));
        make.bottom.equalTo(ws).with.offset(-LENGTH(14));
        make.height.mas_equalTo(itemHeight);
    }];
}
- (void)click{
    SearchMyHistoryViewController * vc = [SearchMyHistoryViewController new];
    vc.titles = @"相关知识图";
    vc.style = 4;
    vc.ssid = _model.book.ssid;
    [[self viewController].navigationController pushViewController:vc animated:YES];
}

- (void)setModel:(BookXQModel *)model{
    _model = model;
    tab.userInteractionEnabled = YES;
    collectView.itemarray = model.bannerknowledgeList;
}
@end
