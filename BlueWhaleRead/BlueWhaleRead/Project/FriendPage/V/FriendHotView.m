//
//  FriendHotView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/20.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "FriendHotView.h"
#import "ReadBookListTableView.h"
@implementation FriendHotView{
    BaseLabel * Title;
    ReadBookListTableView *tableView;
    GeneraNoDataView * wdView;

}
-(instancetype)init{
    self = [super init];
    if (self) {
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    self.backgroundColor = [UIColor whiteColor];
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = LENGTH(2);
    
    Title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(51,51,51) LabelFont:TextFont(19) TextAlignment:NSTextAlignmentCenter Text:@"在读书籍"];
    [self addSubview:Title];
    
    tableView = [ReadBookListTableView new];
    tableView.inter = 1;
    tableView.scrollEnabled = YES;
    [self addSubview:tableView];

    WS(ws);
    [Title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(0);
        make.top.equalTo(ws).with.offset(LENGTH(18));
        make.right.equalTo(ws).with.offset(0);
    }];
    
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->Title.mas_bottom).with.offset(0);
        make.left.equalTo(ws).with.offset(0);
        make.right.equalTo(ws).with.offset(0);
        make.bottom.equalTo(ws).with.offset(0);
        make.height.mas_equalTo(LENGTH(392));
    }];
    
}
- (void)setItemarray:(NSMutableArray *)itemarray{
    _itemarray = itemarray;
    tableView.nav = self.nav;

    if (_itemarray.count == 0 && wdView==nil) {
        [tableView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(LENGTH(392));
        }];
        [self addWdView];
    }
    
    if (_itemarray.count !=0) {
        if (wdView != nil) {
            [wdView removeFromSuperview];
        }
        tableView.itemarray = _itemarray;
    }

}

- (void)addWdView{
    WS(ws);
    wdView = [GeneraNoDataView new];
    wdView.backgroundColor = WhitColor;
    wdView.image = @"icon_缺省页_书";
    wdView.titlename = @"TA还没有开始读书哦！";
    wdView.style = NoDtaaViewStyleImageLabel;
    [self addSubview:wdView];
    [wdView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];

}
//- (void)uptableview{
//    [tableView UpDataHeight];
//}
@end
