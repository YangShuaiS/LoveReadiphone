



//
//  FriendXunZhangView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/20.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "FriendXunZhangView.h"
#import "FriendXunZhangTabView.h"

@implementation FriendXunZhangView{
    FriendXunZhangTabView *tableView;
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
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = LENGTH(2);
    WS(ws);
    tableView = [FriendXunZhangTabView new];
    [self addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(0);
        make.left.equalTo(ws).with.offset(0);
        make.right.equalTo(ws).with.offset(0);
        make.bottom.equalTo(ws).with.offset(0);
        make.height.mas_equalTo(HEIGHT);
    }];
}
- (void)setItemarray:(NSMutableArray *)itemarray{
    _itemarray = itemarray;
    tableView.nav = self.nav;
    tableView.itemarray = itemarray;
    [tableView reloadData];
    [tableView layoutIfNeeded];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self uptableview];
    });
}
- (void)uptableview{
    [tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(self->tableView.contentSize.height);
    }];

}

@end
