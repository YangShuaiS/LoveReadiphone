//
//  NBClistAllView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/7.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "NBClistAllView.h"
#import "NBClistCollectionView.h"
#import "NBCmenuView.h"
#define itemWidth (WIDTH - LENGTH(44))/2
#define itemHeight LENGTH(24)
@implementation NBClistAllView{
    NBClistCollectionView * collectView;
    
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
    menu.label.text = @"排行榜";
//    menu.styles = NBCmenuViewStyleimage;
    [self addSubview:menu];
    [menu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.and.right.mas_equalTo(ws);
    }];
    [menu setBlock:^{
        [ws push];
    }];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(itemWidth,itemHeight);
    //定义每个UICollectionView 横向的间距
    flowLayout.minimumLineSpacing = LENGTH(20);
    //定义每个UICollectionView 纵向的间距
    flowLayout.minimumInteritemSpacing = 0;
    //定义每个UICollectionView 的边距距
    flowLayout.sectionInset = UIEdgeInsetsMake(LENGTH(25), 0, LENGTH(25), 0);//上左下右
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    collectView = [[NBClistCollectionView alloc] initWithFrame:CGRectMake(0, 0, 0,0) collectionViewLayout:flowLayout];
    collectView.backgroundColor = RGB(82,199,198);
    collectView.layer.masksToBounds = YES;
    collectView.layer.cornerRadius = LENGTH(8);
    [self addSubview:collectView];
    [collectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(LENGTH(22));
        make.top.equalTo(menu.mas_bottom).with.offset(LENGTH(10));
        make.right.equalTo(ws).with.offset(-LENGTH(22));
        make.bottom.equalTo(ws).with.offset(-LENGTH(14));
        make.height.mas_equalTo(itemHeight);
    }];
    UIView * xian = [UIView new];
    xian.backgroundColor = RGBA(255,255,255,0.3);
    [self addSubview:xian];
    [xian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self->collectView);
        make.top.mas_equalTo(self->collectView).with.offset(LENGTH(30));
        make.bottom.mas_equalTo(self->collectView).with.offset(-LENGTH(30));
        make.width.mas_equalTo(1);
    }];
}
- (void)push{
}
- (void)setModel:(NBCALLModel *)model{
    _model = model;
    collectView.nav = self.nav;
    collectView.itemarray = model.rankList;
}
@end
