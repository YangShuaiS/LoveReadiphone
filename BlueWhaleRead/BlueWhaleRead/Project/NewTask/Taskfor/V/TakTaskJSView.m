//
//  TakTaskJSView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/4.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "TakTaskJSView.h"

@implementation TakTaskJSView{
    BaseLabel * title;
    BaseLabel * subtitle;
    UIImageView * leftimage;
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
    WS(ws);
    self.backgroundColor = [UIColor clearColor];
    UIView * backview = [UIView new];
    backview.backgroundColor = RGB(255, 255, 255);
    [self addSubview:backview];
    [backview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws).with.insets(UIEdgeInsetsMake(0, LENGTH(20), LENGTH(14), LENGTH(20)));
    }];
    backview.layer.shadowOpacity = 0.24;
    backview.layer.shadowColor = RGB(171, 171, 171).CGColor;
    backview.layer.shadowRadius = LENGTH(8);
    backview.layer.shadowOffset = CGSizeMake(0,4);
    backview.layer.cornerRadius = LENGTH(12);
    
    
    leftimage = [UIImageView new];
//    leftimage.contentMode = UIViewContentModeScaleAspectFit;
    leftimage.image = UIIMAGE(@"标题装饰紫色");
    leftimage.image = [leftimage.image imageWithRenderingMode:(UIImageRenderingModeAlwaysTemplate)];
    [backview addSubview:leftimage];

    
    title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(51,51,51) LabelFont:TextFontCu(19) TextAlignment:NSTextAlignmentCenter Text:@"任务介绍"];
    [backview addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(backview).with.offset(LENGTH(15));
        make.left.mas_equalTo(backview).with.offset(LENGTH(15));
        make.right.mas_equalTo(backview).with.offset(-LENGTH(15));
    }];
    
    [leftimage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(ws);
        make.left.mas_equalTo(self->title.mas_left).with.offset(LENGTH(34));
        make.right.mas_equalTo(self->title.mas_right).with.offset(-LENGTH(34));
        make.centerY.mas_equalTo(self->title);
    }];

    
    subtitle = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(51,51,51)  LabelFont:TextFont(14) TextAlignment:NSTextAlignmentLeft Text:CHANGWENZI];
    subtitle.numberOfLines = 0;
    [backview addSubview:subtitle];
    [subtitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->title.mas_bottom).with.offset(LENGTH(20));
        make.left.mas_equalTo(backview).with.offset(LENGTH(18));
        make.right.mas_equalTo(backview).with.offset(-LENGTH(18));
        make.bottom.mas_equalTo(backview).with.offset(-LENGTH(15));
    }];

}

- (void)setModel:(TAKALLModel *)model{
    _model = model;
    leftimage.tintColor = _colorarray[0];
    subtitle.text = model.mission.mission_info;
    
}
@end
