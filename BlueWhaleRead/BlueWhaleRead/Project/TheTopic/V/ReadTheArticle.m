//
//  ReadTheArticle.m
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/5/7.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "ReadTheArticle.h"
@implementation ReadTheArticle{
    BaseLabel * title;
    BaseLabel * subTitle;
}
-(instancetype)init{
    self = [super init];
    if (self) {
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    self.backgroundColor = RANDOMCOLOR;
    WS(ws);
    title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(51, 51, 51) LabelFont:TextFont(25) TextAlignment:NSTextAlignmentCenter Text:ZHANWEIZI];
    [self addSubview:title];
    
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(ws.mas_centerX);
        make.top.equalTo(ws).with.offset(LENGTH(46));
        make.left.equalTo(ws).with.offset(LENGTH(20));
        make.right.equalTo(ws).with.offset(-LENGTH(20));
    }];
    

    
    subTitle = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(51, 51, 51) LabelFont:TextFont(20) TextAlignment:NSTextAlignmentLeft Text:ZHANWEIZI];
    subTitle.numberOfLines = 0;
    subTitle.text = @"";
    [self addSubview:subTitle];
    
    [subTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(ws.mas_centerX);
        make.top.equalTo(self->title.mas_bottom).with.offset(LENGTH(50));
        make.left.equalTo(ws).with.offset(LENGTH(55));
        make.right.equalTo(ws).with.offset(-LENGTH(55));
        make.bottom.mas_equalTo(ws).with.offset(0);
    }];
    
}
- (void)setModel:(TZXZArticle *)model{
    _model = model;
    title.text = model.title;
    subTitle.text = model.content;
}
@end
