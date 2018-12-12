//
//  TKAlltaskView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/29.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "TKAlltaskView.h"

@implementation TKAlltaskView{
    UIImageView * backimageview;
    BaseLabel * name;
    BaseLabel * yd;
    BaseLabel * lq;
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
    
    backimageview = [UIImageView new];
    backimageview.contentMode = UIViewContentModeScaleToFill;
    backimageview.backgroundColor = RANDOMCOLOR;
    [self addSubview:backimageview];
    [backimageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
    
    name = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255,255,255) LabelFont:TextFontCu(22) TextAlignment:NSTextAlignmentCenter Text:@"任务"];
    [backimageview addSubview:name];
    [name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self->backimageview);
        make.top.mas_equalTo(self->backimageview).with.offset(LENGTH(32));
    }];
    yd = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255,255,255) LabelFont:TextFontCu(12) TextAlignment:NSTextAlignmentCenter Text:@""];
    [backimageview addSubview:yd];
    [yd mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self->backimageview);
        make.top.mas_equalTo(self->name.mas_bottom).with.offset(LENGTH(11));
        make.bottom.mas_equalTo(self->backimageview).with.offset(-LENGTH(39));
    }];
    
    lq = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255,255,255) LabelFont:TextFontCu(12) TextAlignment:NSTextAlignmentCenter Text:@""];
    [backimageview addSubview:lq];
    [lq mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self->backimageview);
        make.top.mas_equalTo(self->yd.mas_bottom).with.offset(LENGTH(8));
    }];
}

- (void)setModel:(TKTaskListModel *)model{
    _model = model;
    [backimageview sd_setImageWithURL:URLIMAGE(model.mission_background)];
    TKAlltaskStyle style = [model.mission_type integerValue];
    switch (style) {
        case TKAlltaskStyleZJ:
            [self addTKAlltaskStyleZJ];
            break;
        case TKAlltaskStyleZJALL:
            [self addTKAlltaskStyleZJALL];
            break;
        case TKAlltaskStyleZJS:
            [self addTKAlltaskStyleZJS];
            break;
        default:
            break;
    }
}

- (void)addTKAlltaskStyleZJ{
    name.text = _model.mission_name;
    yd.text = [NSString stringWithFormat:@"%@人已完成",_model.completedNum];
    lq.text = [NSString stringWithFormat:@"%@人已领取",_model.receiveNum];
}
- (void)addTKAlltaskStyleGJ{
    name.text = _model.mission_name;
    yd.text = [NSString stringWithFormat:@"%@人已完成",_model.completedNum];
    lq.text = [NSString stringWithFormat:@"%@人已领取",_model.receiveNum];

}
- (void)addTKAlltaskStyleZJALL{
    name.text = _model.mission_name;
    yd.text = @"此任务为自建任务";
    lq.text = @"";
}
- (void)addTKAlltaskStyleZJS{
    name.text = _model.mission_name;
    yd.text = [NSString stringWithFormat:@"%@人已自建",_model.selfBuildNum];
    lq.text = @"";
}
@end
