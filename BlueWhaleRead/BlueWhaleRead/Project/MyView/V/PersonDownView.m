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
        make.top.equalTo(ws).with.offset(LENGTH(11));
        make.bottom.equalTo(ws).with.offset(-LENGTH(11));
        make.left.mas_equalTo(ws).with.offset(LENGTH(15.5));
    }];
    
    SunTitle = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(153,153,153) LabelFont:TextFont(16) TextAlignment:NSTextAlignmentLeft Text:@""];
    [self addSubview:SunTitle];
    [SunTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(ws.mas_centerY);
        make.right.mas_equalTo(ws).with.offset(-LENGTH(23));
    }];
    
    BaseView * view = [BaseView new];
    view.backgroundColor = RGB(153,153,153);
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
@end
