//
//  HomeNewMedalView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/7.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "HomeNewMedalView.h"
#import "HomeNewMedakTableView.h"
#import "NavigationMenuView.h"

#import "MedalListViewController.h"
@implementation HomeNewMedalView{

    HomeNewMedakTableView *tableView;
}
-(instancetype)init{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    WS(ws);
    NavigationMenuView * navMenu = [NavigationMenuView new];
    navMenu.style = NavMenuStyleAll;
    navMenu.leftTitle = @"热门勋章";
    navMenu.rightTitle = @"查看全部";
    [navMenu setBlock:^{
        [self LookAll];
    }];
    [self addSubview:navMenu];
    
    [navMenu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(0);
        make.top.equalTo(ws).with.offset(LENGTH(0));
        make.right.equalTo(ws).with.offset(0);
    }];
    
    tableView = [HomeNewMedakTableView new];
    [self addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(navMenu.mas_bottom).with.offset(LENGTH(0));
        make.left.equalTo(ws).with.offset(0);
        make.right.equalTo(ws).with.offset(0);
        make.bottom.equalTo(ws).with.offset(0);
        make.height.mas_equalTo(HEIGHT*3);
    }];
}
- (void)setItemarray:(NSMutableArray *)itemarray{
    _itemarray = itemarray;
    tableView.nav = self.nav;
    tableView.itemarray = itemarray;
}
- (void)LookAll{
    MedalListViewController * vc = [MedalListViewController new];
    [self.nav pushViewController:vc animated:YES];

}
@end
