//
//  TKAlltaskTopView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/29.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "TKAlltaskTopView.h"

@implementation TKAlltaskTopView{
    UIImageView * backimageview;
    BaseLabel * name;
    BaseLabel * subtitle;
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

- (void)layoutSubviews{
    [super layoutSubviews];
    WS(ws);
    [backimageview mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(ws.frame.size.height);
    }];
}
- (void)addview{
    WS(ws);
    
    backimageview = [UIImageView new];
    backimageview.contentMode = UIViewContentModeScaleAspectFill;
    backimageview.layer.masksToBounds = YES;
    [self addSubview:backimageview];
    
    UIView * backtopviw = [UIView new];
    backtopviw.backgroundColor = RGBA(0, 121, 111, 0.6);
    [backimageview addSubview:backtopviw];
    
    name = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255,255,255) LabelFont:TextFontCu(30) TextAlignment:NSTextAlignmentCenter Text:@"第0期新手任务(有奖)"];
    [self addSubview:name];
    [name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(ws);
        make.top.mas_equalTo(ws).with.offset(LENGTH(64));
    }];
    
    subtitle = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255,255,255) LabelFont:TextFontCu(17) TextAlignment:NSTextAlignmentCenter Text:@"完成新手任务，得大奖"];
    [self addSubview:subtitle];
    [subtitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(ws);
        make.top.mas_equalTo(self->name.mas_bottom).with.offset(LENGTH(15));
    }];
    
    yd = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255,255,255) LabelFont:TextFontCu(13) TextAlignment:NSTextAlignmentCenter Text:@"298736人已完成"];
    [self addSubview:yd];
    [yd mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(ws);
        make.top.mas_equalTo(self->subtitle.mas_bottom).with.offset(LENGTH(35));
    }];
    

    lq = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255,255,255) LabelFont:TextFontCu(13) TextAlignment:NSTextAlignmentCenter Text:@"298736人已领取"];
    [self addSubview:lq];
    [lq mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(ws);
        make.top.mas_equalTo(self->yd.mas_bottom).with.offset(LENGTH(15));
        make.bottom.mas_equalTo(ws).with.offset(-LENGTH(18));

    }];
    
    [backimageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.mas_equalTo(ws);
        make.top.mas_equalTo(ws);
        make.height.mas_equalTo(LENGTH(250));
    }];
    [backtopviw mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self->backimageview);
    }];
}
- (void)setModel:(TKTaskListModel *)model{
    _model = model;
    [backimageview sd_setImageWithURL:URLIMAGE(model.mission_background)];
    name.text = [NSString stringWithFormat:@"第%@期新手任务(有奖)",model.periods_num];
    subtitle.text = [NSString stringWithFormat:@"完成新手任务，得%@大奖",model.prize_name];
    yd.text = [NSString stringWithFormat:@"%@人已完成",_model.completedNum];
    lq.text = [NSString stringWithFormat:@"%@人已领取",_model.receiveNum];
}
@end
