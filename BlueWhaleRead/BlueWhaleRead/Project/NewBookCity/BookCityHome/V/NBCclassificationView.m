//
//  NBCclassificationView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/7.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "NBCclassificationView.h"
#import "NBCclassificationCollectionView.h"
#import "NBCmenuView.h"
#import "BookCityViewController.h"
#define itemWidth LENGTH(103)
#define itemHeight LENGTH(62)
@implementation NBCclassificationView{
    NBCclassificationCollectionView * collectView;
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
    menu.label.text = @"书籍分类";
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
    flowLayout.minimumLineSpacing = LENGTH(12);
    //定义每个UICollectionView 纵向的间距
    flowLayout.minimumInteritemSpacing = 0;
    //定义每个UICollectionView 的边距距
    flowLayout.sectionInset = UIEdgeInsetsMake(0, LENGTH(22), 0, LENGTH(22));//上左下右
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    collectView = [[NBCclassificationCollectionView alloc] initWithFrame:CGRectMake(0, 0, 0,0) collectionViewLayout:flowLayout];
    [self addSubview:collectView];
    [collectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(LENGTH(0));
        make.top.equalTo(menu.mas_bottom).with.offset(LENGTH(0));
        make.right.equalTo(ws).with.offset(LENGTH(0));
        make.bottom.equalTo(ws).with.offset(-LENGTH(14));
        make.height.mas_equalTo(itemHeight);
    }];
}
- (void)push{
    BookCityViewController * vc = [BookCityViewController new];
    NSIndexPath * indpath = [NSIndexPath indexPathForRow:0 inSection:0];
    vc.inpath = indpath;
    vc.cata = [NSString stringWithFormat:@"100"];
    [self.nav pushViewController:vc animated:YES];
}
- (void)setModel:(NBCALLModel *)model{
    _model = model;
    collectView.nav =self.nav;
    collectView.itemarray = model.catalogList;
}

@end
