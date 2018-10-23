//
//  PersonDownView.m
//  BoWanJuanForPad
//
//  Created by 杨帅 on 2018/6/5.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "PersonDownView.h"

@implementation PersonDownView{
    BaseLabel * TitLabel;
    BaseLabel * SunTitle;
}

-(instancetype)init{
    self = [super init];
    if (self) {
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    WS(ws);
    TitLabel = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(51,51,51) LabelFont:TextFont(16) TextAlignment:NSTextAlignmentLeft Text:@""];
    [self addSubview:TitLabel];
    [TitLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(LENGTH(20));
        make.bottom.equalTo(ws).with.offset(-LENGTH(20));
        make.left.mas_equalTo(ws).with.offset(LENGTH(15.5));
    }];
    
    SunTitle = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(153,153,153) LabelFont:TextFont(16) TextAlignment:NSTextAlignmentLeft Text:@""];
    [self addSubview:SunTitle];
    [SunTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(ws.mas_centerY);
        make.right.mas_equalTo(ws).with.offset(-LENGTH(50));
    }];
    
    BaseView * view = [BaseView new];
    view.backgroundColor = RGB(244,246,246);
    [self addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(ws).with.offset(-LENGTH(1));
        make.left.mas_equalTo(ws).with.offset(LENGTH(16));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(16));
        make.height.mas_equalTo(LENGTH(1));
    }];
    
}

-(void)setTitle:(NSString *)title{
    TitLabel.text = title;
}
-(void)setSubtitle:(NSString *)subtitle{
    SunTitle.text = subtitle;
}
- (void)setJt:(BOOL)jt{
    if (jt == NO) {
        WS(ws);
        [SunTitle mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(ws).with.offset(-LENGTH(28));
        }];
    }
}
@end
