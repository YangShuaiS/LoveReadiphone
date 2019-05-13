//
//  MyAccountListView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/4/26.
//  Copyright © 2019 YS. All rights reserved.
//

#import "MyAccountListView.h"
#import "MyAccountListTableView.h"
#import "MyAccountListTableView.h"
@implementation MyAccountListView{
    MyAccountListTableView * tableView;
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
    self.backgroundColor = [UIColor whiteColor];
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = LENGTH(5);
    self.layer.borderColor = RGB(238,238,238).CGColor;
    self.layer.borderWidth = 1;
    
    WS(ws);
    tableView = [MyAccountListTableView new];
    [self addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
}
- (void)setItemarray:(NSMutableArray *)itemarray{
    _itemarray = itemarray;
    tableView.itemarray = itemarray;
}
@end
