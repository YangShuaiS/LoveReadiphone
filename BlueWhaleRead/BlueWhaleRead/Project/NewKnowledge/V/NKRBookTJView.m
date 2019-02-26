//
//  NKRBookTJView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/2/14.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "NKRBookTJView.h"
#import "NBCmenuView.h"
#import "HomeModerateCollectView.h"

#import "SearchBookTJViewController.h"
#define itemHeight LENGTH(170)

@implementation NKRBookTJView{
    NBCmenuView * menu;
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
    menu = [NBCmenuView new];
    menu.label.text = @"书籍推荐";
    menu.styles = NBCmenuViewStyleimage;
    [self addSubview:menu];
    [menu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.and.right.mas_equalTo(ws);
    }];
    [menu setBlock:^{
        [ws push];
    }];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake((WIDTH - LENGTH(13)*2 -LENGTH(24)*2)/3,itemHeight);
    //定义每个UICollectionView 横向的间距
    flowLayout.minimumLineSpacing = LENGTH(0);
    //定义每个UICollectionView 纵向的间距
    flowLayout.minimumInteritemSpacing = LENGTH(0);
    //定义每个UICollectionView 的边距距
    flowLayout.sectionInset = UIEdgeInsetsMake(0, LENGTH(24), 0, LENGTH(24));//上左下右
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    collectView = [[HomeModerateCollectView alloc] initWithFrame:CGRectMake(0, 0, 0,0) collectionViewLayout:flowLayout];
    collectView.foundinter = 6;
    [self addSubview:collectView];
    [collectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(0);
        make.top.equalTo(self->menu.mas_bottom).with.offset(LENGTH(0));
        make.right.equalTo(ws).with.offset(0);
        make.bottom.equalTo(ws).with.offset(-LENGTH(14));
    }];
    

}
- (void)setItemarray:(NSMutableArray *)itemarray{
    _itemarray = itemarray;
    collectView.itemarray = itemarray;
}
- (void)push{
    SearchBookTJViewController * vc = [SearchBookTJViewController new];
    vc.titles = @"书籍推荐";
    [[self viewController].navigationController pushViewController:vc animated:YES];
}
@end
