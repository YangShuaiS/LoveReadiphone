//
//  HomeFriendReadingView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/8.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "HomeFriendReadingView.h"
#import "HomeFriendReadingCollectionView.h"
#import "NavigationMenuView.h"
#define itemWidth LENGTH(99)
#define itemHeight LENGTH(256.5)
@implementation HomeFriendReadingView

{
    HomeFriendReadingCollectionView * collectView;
    NSInteger page;
    NavigationMenuView * navMenu;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self addView];
    }
    return self;
}
- (void)addView{
    WS(ws);
    
    navMenu = [NavigationMenuView new];
    navMenu.style = NavMenuStyleMore;
    navMenu.leftTitle = @"同学在读";
    navMenu.rightTitle = @"换一换";
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
    flowLayout.itemSize = CGSizeMake(itemWidth,itemHeight);
//    //定义每个UICollectionView 横向的间距
//    flowLayout.minimumLineSpacing = LENGTH(36);
//    //定义每个UICollectionView 纵向的间距
//    flowLayout.minimumInteritemSpacing = LENGTH(36);
    //定义每个UICollectionView 的边距距
    flowLayout.sectionInset = UIEdgeInsetsMake(0, LENGTH(14.5), 0, LENGTH(14.5));//上左下右
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    collectView = [[HomeFriendReadingCollectionView alloc] initWithFrame:CGRectMake(0, 0, 0,0) collectionViewLayout:flowLayout];
    [self addSubview:collectView];
    [collectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(0);
        make.top.equalTo(self->navMenu.mas_bottom).with.offset(LENGTH(17.5));
        make.right.equalTo(ws).with.offset(0);
        make.bottom.equalTo(ws).with.offset(-LENGTH(0));
        make.height.mas_equalTo(itemHeight);
    }];
}
- (void)setItemarray:(NSMutableArray *)itemarray{
    _itemarray = itemarray;
    collectView.nav = self.nav;
    page = 1;
    collectView.itemarray = _itemarray;
    if (_friendBookCount<=3) {
        [navMenu remohyh];
    }
}
#pragma mark ------------------ 换一批
- (void)LookAll{
    [self LoadData];
}

- (void)LoadData{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_FRIENDHYH];
    NSDictionary * dic = @{@"studentid":Me.ssid,@"page":[NSString stringWithFormat:@"%ld",(long)page]};
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            HomeFriendHYHModel * model = [HomeFriendHYHModel mj_objectWithKeyValues:responseObject];
            if ([model.code isEqual:@200]) {
                [self UpData:model];
            }
        }else{

        }
    }];
    
}
- (void)UpData:(HomeFriendHYHModel *)model{
    collectView.itemarray = model.friendBook;
    if (page >=model.totalCount) {
        page = 1;
    }else{
        page ++;
    }
}
@end
