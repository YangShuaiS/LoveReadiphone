//
//  HHotBookView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/1.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "HHotBookView.h"
#import "NBCmenuView.h"
#import "HomeModerateCollectView.h"
#import "NBCMoreChannelViewController.h"
#define itemHeight LENGTH(170)
#import "HomeActivityViewController.h"
@implementation HHotBookView{
    NBCmenuView * navMenu;
    HomeModerateCollectView * collectView;
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
    flowLayout.itemSize = CGSizeMake((WIDTH - LENGTH(13)*2 -LENGTH(24)*2)/3,itemHeight);
    //定义每个UICollectionView 横向的间距
    flowLayout.minimumLineSpacing = LENGTH(0);
    //定义每个UICollectionView 纵向的间距
    flowLayout.minimumInteritemSpacing = LENGTH(0);
    //定义每个UICollectionView 的边距距
    flowLayout.sectionInset = UIEdgeInsetsMake(LENGTH(5), LENGTH(24), 0, LENGTH(24));//上左下右
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    collectView = [[HomeModerateCollectView alloc] initWithFrame:CGRectMake(0, 0, 0,0) collectionViewLayout:flowLayout];
    collectView.foundinter = 6;
    [self addSubview:collectView];
    [collectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(0);
        make.top.equalTo(self->navMenu.mas_bottom).with.offset(-LENGTH(10));
        make.right.equalTo(ws).with.offset(0);
        make.bottom.equalTo(ws).with.offset(-LENGTH(18));
    }];
}

- (void)LookAll{
    HomeActivityViewController * vc = [HomeActivityViewController new];
    vc.hiden = YES;
    vc.itemid = _model.ssid;
    [self.nav pushViewController:vc animated:YES];
    
//    NBCMoreChannelViewController * vc = [NBCMoreChannelViewController new];
//    [[self viewController].navigationController pushViewController:vc animated:YES];
}

- (void)setModel:(NHBookTagModel *)model{
    _model = model;
    navMenu.label.text = model.name;
    collectView.itemarray = model.bookList;

}
@end
