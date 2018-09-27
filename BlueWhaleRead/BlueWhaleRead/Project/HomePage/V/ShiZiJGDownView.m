//
//  ShiZiJGDownView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/26.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "ShiZiJGDownView.h"
#import "GenBookView.h"
@implementation ShiZiJGDownView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addView];
    }
    return self;
}
- (void)addView{
    
}
- (void)setItmearray:(NSMutableArray *)itmearray{
    _itmearray = itmearray;
    WS(ws);
    GenBookView * lastview;
    for (int i = 0; i < itmearray.count; i++) {
        GenBookView * view = [GenBookView new];
        view.layer.masksToBounds = YES;
        view.layer.cornerRadius = LENGTH(20);
        view.backgroundColor = RGB(253, 254, 254);
        [self addSubview:view];
        
        if (!lastview) {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.top.equalTo(ws).with.offset(0);
                make.left.equalTo(ws).with.offset(0);
                make.right.equalTo(ws).with.offset(0);
            }];
        }else{
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(ws).with.offset(0);
                make.right.equalTo(ws).with.offset(0);
                make.top.equalTo(lastview.mas_bottom).with.offset(LENGTH(8));
            }];
        }
        if (i == itmearray.count-1) {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.bottom.equalTo(ws).with.offset(0);
            }];
        }
        lastview = view;
    }

}
@end
