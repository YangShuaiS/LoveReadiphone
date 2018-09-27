

//
//  FoundOliverView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/8.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "FoundOliverView.h"
#import "FoundOliverTableView.h"
#import "NavigationMenuView.h"
#import "GppdBookPageViewController.h"
@implementation FoundOliverView{
    FoundOliverTableView *tableView;
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
    navMenu.leftTitle = @"优秀好文";
    navMenu.rightTitle = @"查看全部";
    [navMenu setBlock:^{
        [self LodAll];
    }];
    [self addSubview:navMenu];
    
    [navMenu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(0);
        make.top.equalTo(ws).with.offset(LENGTH(0));
        make.right.equalTo(ws).with.offset(0);
    }];
    
    tableView = [FoundOliverTableView new];
    [self addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(navMenu.mas_bottom).with.offset(LENGTH(30));
        make.left.equalTo(ws).with.offset(0);
        make.right.equalTo(ws).with.offset(0);
        make.bottom.equalTo(ws).with.offset(0);
        make.height.mas_equalTo(HEIGHT*3);
        
    }];
}
- (void)LodAll{
    GppdBookPageViewController * vc = [GppdBookPageViewController new];
    [self.nav pushViewController:vc animated:YES];
}
- (void)setItemarray:(NSMutableArray *)itemarray{
    _itemarray = itemarray;
    tableView.nav = self.nav;
    tableView.itemarray = itemarray;
}


@end
