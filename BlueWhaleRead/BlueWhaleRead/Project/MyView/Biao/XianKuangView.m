//
//  XianKuangView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/25.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "XianKuangView.h"
#import "XianNeiRongView.h"
@implementation XianKuangView{
    NSMutableArray * viewarray;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addView];
    }
    return self;
}
- (void)addView{
    self.layer.masksToBounds = YES;
//    self.layer.cornerRadius = LENGTH(5);
//    self.layer.borderWidth = 1;
//    self.layer.borderColor = [UIColor grayColor].CGColor;
    WS(ws);
    BaseLabel * onexian = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(50,73,73) LabelFont:TextFont(18) TextAlignment:NSTextAlignmentCenter Text:@"阅读均衡等级对照表"];
//    onexian.lineBreakMode = NSLineBreakByTruncatingTail;
//    onexian.layer.borderWidth = 1;
//    onexian.layer.borderColor = [UIColor blackColor].CGColor;
    [self addSubview:onexian];
    [onexian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws);
        make.right.mas_equalTo(ws);
        make.top.mas_equalTo(ws);
        make.height.mas_equalTo(ws).multipliedBy(0.125);
    }];
    
    viewarray = [NSMutableArray array];
    for (int i = 0; i < 7; i++) {
        if (i == 0) {
            XianNeiRongView * view = [[XianNeiRongView alloc] initWithStyle:XianNeiRongStyleTitle];
            [viewarray addObject:view];
        }else{
            XianNeiRongView * view = [[XianNeiRongView alloc] initWithStyle:XianNeiRongStyleNeirong];
            [viewarray addObject:view];
        }
    }
    
    XianNeiRongView * lastview;
    for (int i = 0; i < viewarray.count; i++) {
        XianNeiRongView * view = viewarray[i];
        [self addSubview:view];
        if (!lastview) {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(onexian.mas_bottom).with.offset(0);
                make.left.equalTo(ws).with.offset(0);
                make.right.equalTo(ws).with.offset(0);
            }];
        }else{
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.height.equalTo(lastview.mas_height).with.offset(0);
                make.left.equalTo(ws).with.offset(0);
                make.right.equalTo(ws).with.offset(0);
                make.top.equalTo(lastview.mas_bottom).with.offset(LENGTH(2));
            }];
        }
        if (i == viewarray.count-1) {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.bottom.equalTo(self.mas_bottom).with.offset(0);
            }];
        }
        lastview = view;
    }
}

- (void)setReadBalance:(AchievementreadBalanceModel *)readBalance{
    if (_readBalance == nil) {
        _readBalance = readBalance;
        for (int i = 0; i < viewarray.count; i++) {
            if (i == 0) {
                XianNeiRongView * view = viewarray[i];
                view.myleve = _readBalance.myLevel;
                view.itemarray = _readBalance.systemBalance.catalogList;
            }else{
                XianNeiRongView * view = viewarray[i];
                view.myleve = _readBalance.myLevel;
                view.model = _readBalance.systemBalance.levelBalance[i-1];
            }
        }
    }
}
@end
