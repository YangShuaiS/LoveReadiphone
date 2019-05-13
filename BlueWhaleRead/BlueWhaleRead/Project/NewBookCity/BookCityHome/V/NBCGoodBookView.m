//
//  NBCGoodBookView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/6.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "NBCGoodBookView.h"
#import "NBCmenuView.h"
#import "NBCGoodBookCollectionView.h"
#import "HomeActivityViewController.h"
#define itemWidth (WIDTH - LENGTH(13)*2 -LENGTH(24)*2)/3
#define itemHeight LENGTH(170)+LENGTH(19)
@implementation NBCGoodBookView{
    NBCGoodBookCollectionView * collectView;
    NBCmenuView * menu;

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
//    menu.label.text = @"上架好书";
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
    //定义每个UICollectionView 横向的间距
    flowLayout.minimumLineSpacing = LENGTH(13);
    //定义每个UICollectionView 纵向的间距
    flowLayout.minimumInteritemSpacing = LENGTH(13);
    //定义每个UICollectionView 的边距距
    flowLayout.sectionInset = UIEdgeInsetsMake(LENGTH(5), LENGTH(24), 0, LENGTH(24));//上左下右
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    collectView = [[NBCGoodBookCollectionView alloc] initWithFrame:CGRectMake(0, 0, 0,0) collectionViewLayout:flowLayout];
//    collectView.pagingEnabled = NO;
    collectView.decelerationRate = UIScrollViewDecelerationRateNormal;
    [self addSubview:collectView];
    [collectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(0);
        make.top.equalTo(self->menu.mas_bottom).with.offset(-LENGTH(5));
        make.right.equalTo(ws).with.offset(0);
        make.bottom.equalTo(ws).with.offset(-LENGTH(14));
        make.height.mas_equalTo((itemHeight)*2+LENGTH(13));
    }];
}
- (void)push{
//    BookCityViewController * vc = [BookCityViewController new];
//    NSIndexPath * indpath = [NSIndexPath indexPathForRow:0 inSection:0];
//    vc.inpath = indpath;
//    vc.cata = [NSString stringWithFormat:@"100"];
//    [self.nav pushViewController:vc animated:YES];
    
    
    HomeActivityViewController * vc = [HomeActivityViewController new];
    vc.hiden = YES;
    vc.itemid = _model.ssid;
    [self.nav pushViewController:vc animated:YES];
}
- (void)setModel:(TypeListModel *)model{
    _model = model;
    menu.label.text = model.name;
    collectView.nav = self.nav;
    collectView.itemarray = model.bookList;
}
@end
