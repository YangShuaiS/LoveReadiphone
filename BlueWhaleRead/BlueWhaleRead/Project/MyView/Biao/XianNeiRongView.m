//
//  XianNeiRongView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/25.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "XianNeiRongView.h"

@implementation XianNeiRongView{
    XianNeiRongStyle sty;
}
- (instancetype)initWithStyle:(XianNeiRongStyle)style{
    self = [super init];
    if (self) {
        sty = style;
    }
    return self;
}

- (void)addTitle{
    WS(ws);
    NSMutableArray * labeletitle = [NSMutableArray array];
    [labeletitle addObject:@"等级"];
    for (AchiZBModel * model in _itemarray) {
        [labeletitle addObject:model.name];
    }
    NSMutableArray * labelarray = [NSMutableArray array];
    for (int i = 0; i < labeletitle.count; i++) {
        BaseLabel * label = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(102,102,102) LabelFont:TextFont(16) TextAlignment:NSTextAlignmentCenter Text:labeletitle[i]];
        //    onexian.lineBreakMode = NSLineBreakByTruncatingTail;
        label.backgroundColor = RGB(222,242,240);
//        label.layer.borderWidth = 0.5;
//        label.layer.borderColor = [UIColor blackColor].CGColor;
        [labelarray addObject:label];
    }
    
    BaseLabel * lastview;
    for (int i = 0; i < labelarray.count; i++) {
        BaseLabel * view = labelarray[i];
        [self addSubview:view];
        if (!lastview) {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(ws).with.offset(0);
            }];
        }else{
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(lastview.mas_right).with.offset(0);
                make.width.mas_equalTo(lastview.mas_width);
            }];
        }
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(ws).with.offset(0);
            make.bottom.equalTo(ws).with.offset(0);
        }];
        if (i == labelarray.count-1) {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.equalTo(ws).with.offset(0);
            }];
        }
        lastview = view;
    }
    
    
}
- (void)setItemarray:(NSMutableArray *)itemarray{
    _itemarray = itemarray;
    switch (sty) {
        case XianNeiRongStyleTitle:
            [self addTitle];
            break;
            
        default:
            break;
    }
}

- (void)setModel:(AchiZBModel *)model{
    _model = model;
    switch (sty) {
        case XianNeiRongStyleNeirong:
            [self addNeirong];
            break;
            
        default:
            break;
    }
}
- (void)addNeirong{
    WS(ws);
    NSMutableArray * labeletitle = [NSMutableArray array];
    _itemarray = _model.catalogLevel;
    for (int i =0 ; i < _itemarray.count+1; i++) {
        if (i == 0) {
            [labeletitle addObject:_model.level];
        }else{
            AchieLeveModel * m = _itemarray[i-1];
            [labeletitle addObject:m.balance];
        }
    }
    NSMutableArray * labelarray = [NSMutableArray array];
    for (int i = 0; i < labeletitle.count; i++) {
        NSString * str;
        if (i == 0) {
            str = [NSString stringWithFormat:@"%@",labeletitle[i]];
        }else{
            CGFloat f = [labeletitle[i] floatValue]*100;
            str = [NSString stringWithFormat:@"%.0f%%",f];

        }
        BaseLabel * label = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(102,102,102) LabelFont:TextFont(16) TextAlignment:NSTextAlignmentCenter Text:str];
        //    onexian.lineBreakMode = NSLineBreakByTruncatingTail;
//        label.layer.borderWidth = 0.5;
//        label.layer.borderColor = [UIColor blackColor].CGColor;
        [labelarray addObject:label];
    }
    
    BaseLabel * lastview;
    for (int i = 0; i < labelarray.count; i++) {
        BaseLabel * view = labelarray[i];
        [self addSubview:view];
        if (!lastview) {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(ws).with.offset(0);
            }];
        }else{
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(lastview.mas_right).with.offset(0);
                make.width.mas_equalTo(lastview.mas_width);
            }];
        }
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(ws).with.offset(0);
            make.bottom.equalTo(ws).with.offset(0);
        }];
        if (i == labelarray.count-1) {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.equalTo(ws).with.offset(0);
            }];
        }
        lastview = view;
    }
    if ([_myleve isEqualToString:_model.level]) {
        self.backgroundColor = RGB(204,239,236);

    }else{
        self.backgroundColor = RGB(244,248,248);

    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
