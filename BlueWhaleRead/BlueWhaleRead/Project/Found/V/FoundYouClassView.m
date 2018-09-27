//
//  FoundYouClassView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/8.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "FoundYouClassView.h"
#import "FoundClassTableView.h"
#import "NavigationMenuView.h"

@implementation FoundYouClassView{
    
    FoundClassTableView *tableView;
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
    navMenu.style = NavStyleGeneral;
    navMenu.leftTitle = @"你的同学";
    [navMenu setBlock:^{
    }];
    [self addSubview:navMenu];
    
    [navMenu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(0);
        make.top.equalTo(ws).with.offset(LENGTH(0));
        make.right.equalTo(ws).with.offset(0);
    }];
    
    tableView = [FoundClassTableView new];
    [self addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(navMenu.mas_bottom).with.offset(LENGTH(5));
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


@end
