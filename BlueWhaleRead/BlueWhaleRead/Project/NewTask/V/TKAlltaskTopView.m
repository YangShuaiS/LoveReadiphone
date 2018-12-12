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
- (void)addview{
    WS(ws);
    
    backimageview = [UIImageView new];
    backimageview.contentMode = UIViewContentModeScaleToFill;
    backimageview.backgroundColor = RANDOMCOLOR;
    [self addSubview:backimageview];
    [backimageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
    
    name = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255,255,255) LabelFont:TextFontCu(30) TextAlignment:NSTextAlignmentCenter Text:@"第0期新手任务(有奖)"];
    [backimageview addSubview:name];
    [name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self->backimageview);
        make.top.mas_equalTo(self->backimageview).with.offset(LENGTH(64));
    }];
    
    subtitle = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255,255,255) LabelFont:TextFontCu(17) TextAlignment:NSTextAlignmentCenter Text:@"完成新手任务，得大奖"];
    [backimageview addSubview:subtitle];
    [subtitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self->backimageview);
        make.top.mas_equalTo(self->name.mas_bottom).with.offset(LENGTH(15));
    }];
    
    yd = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255,255,255) LabelFont:TextFontCu(13) TextAlignment:NSTextAlignmentCenter Text:@"298736人已完成"];
    [backimageview addSubview:yd];
    [yd mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self->backimageview);
        make.top.mas_equalTo(self->subtitle.mas_bottom).with.offset(LENGTH(35));
    }];
    

    lq = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255,255,255) LabelFont:TextFontCu(13) TextAlignment:NSTextAlignmentCenter Text:@"298736人已领取"];
    [backimageview addSubview:lq];
    [lq mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self->backimageview);
        make.top.mas_equalTo(self->yd.mas_bottom).with.offset(LENGTH(15));
        make.bottom.mas_equalTo(self->backimageview).with.offset(-LENGTH(18));

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
