//
//  HAllTaskView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/1.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "HAllTaskView.h"
#import "NBCmenuView.h"
#import "HAllTaskCollectionView.h"
#import "TKAlltaskViewController.h"
@implementation HAllTaskView{
    NBCmenuView * navMenu;
    HAllTaskCollectionView * collectview;

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
    
    navMenu = [NBCmenuView new];
    navMenu.styles = NBCmenuViewStyleimage;
    navMenu.label.text = @"热门任务";
    [navMenu setBlock:^{
        [ws LookAll];
    }];
    [self addSubview:navMenu];
    
    [navMenu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(0);
        make.top.equalTo(ws).with.offset(LENGTH(0));
        make.right.equalTo(ws).with.offset(0);
    }];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake((WIDTH-LENGTH(14)*3)/2,LENGTH(104));
    //定义每个UICollectionView 横向的间距
    flowLayout.minimumLineSpacing = LENGTH(14);
    //定义每个UICollectionView 纵向的间距
    flowLayout.minimumInteritemSpacing = LENGTH(14);
    //定义每个UICollectionView 的边距距
    flowLayout.sectionInset = UIEdgeInsetsMake(LENGTH(0), LENGTH(14), 0, LENGTH(14));//上左下右
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    collectview = [[HAllTaskCollectionView alloc] initWithFrame:CGRectMake(0, 0, 0,0) collectionViewLayout:flowLayout];
    [self addSubview:collectview];
    [collectview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->navMenu.mas_bottom).with.offset(LENGTH(0));
        make.left.and.right.mas_equalTo(ws);
        make.height.mas_equalTo(LENGTH(104));
        make.bottom.equalTo(ws).with.offset(-LENGTH(18));
    }];
    
}

- (void)LookAll{
    TKAlltaskViewController * vc = [TKAlltaskViewController new];
    [[self viewController].navigationController pushViewController:vc animated:YES];
}

- (void)setItemArray:(NSMutableArray *)itemArray{
    _itemArray = itemArray;
    collectview.itemArray = itemArray;
}
@end
