//
//  TKAlltaskTopView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/29.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "TKAlltaskTopView.h"
#import "TKYuanQuan.h"
@implementation TKAlltaskTopView{
    UIView * backview;
    TKYuanQuan * yqone;
    TKYuanQuan * yqtwo;

    
    UIImageView * backimageview;
    BaseLabel * name;
    BaseLabel * subtitle;
    BaseLabel * yd;
    BaseLabel * lq;
    NSMutableArray * colorarray;
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
    
    self.backgroundColor = [UIColor whiteColor];
    backview = [UIView new];
    backview.backgroundColor = RGB(255, 255, 255);
    [self addSubview:backview];
    [backview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws).with.insets(UIEdgeInsetsMake(LENGTH(10), LENGTH(20), LENGTH(10), LENGTH(20)));
    }];
    backview.layer.shadowOpacity = 0.24;
    backview.layer.shadowRadius = LENGTH(8);
    backview.layer.shadowOffset = CGSizeMake(0,4);
    backview.layer.cornerRadius = LENGTH(12);
    
    
    backimageview = [UIImageView new];
//    backimageview.layer.masksToBounds = YES;
    backimageview.layer.cornerRadius = LENGTH(12);
    backimageview.contentMode = UIViewContentModeScaleAspectFill;
    backimageview.layer.masksToBounds = YES;
    [backview addSubview:backimageview];
    [backimageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self->backview);
        make.height.mas_equalTo(LENGTH(209));
    }];

    name = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(51,51,51) LabelFont:TextFontCu(22) TextAlignment:NSTextAlignmentLeft Text:@"第0期新手任务(有奖))"];
    [backview addSubview:name];
    [name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->backview).with.offset(LENGTH(25));
        make.top.mas_equalTo(self->backview).with.offset(LENGTH(26));
    }];
    
    subtitle = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(51,51,51) LabelFont:TextFontCu(17) TextAlignment:NSTextAlignmentCenter Text:@"完成新手任务，得平衡车大奖!"];
    [backview addSubview:subtitle];
    [subtitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->backview).with.offset(LENGTH(25));
        make.top.mas_equalTo(self->name.mas_bottom).with.offset(LENGTH(15));
    }];
    
    yqone = [TKYuanQuan new];
    [backview addSubview:yqone];
    [yqone mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->backview).with.offset(LENGTH(26));
        make.top.mas_equalTo(self->subtitle.mas_bottom).with.offset(LENGTH(18));
    }];
    
    yqtwo = [TKYuanQuan new];
    [backview addSubview:yqtwo];
    [yqtwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->backview).with.offset(LENGTH(26));
        make.top.mas_equalTo(self->yqone.mas_bottom).with.offset(LENGTH(13));
    }];
    
    lq = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(51,51,51) LabelFont:TextFontCu(12) TextAlignment:NSTextAlignmentLeft Text:@"298736人已领取"];
    [self addSubview:lq];
    [lq mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->yqone.mas_right).with.offset(LENGTH(8));
        make.centerY.mas_equalTo(self->yqone);
        
    }];
    
    yd = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(51,51,51) LabelFont:TextFontCu(12) TextAlignment:NSTextAlignmentLeft Text:@"298736人已完成"];
    [backview addSubview:yd];
    [yd mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->yqtwo.mas_right).with.offset(LENGTH(8));
        make.centerY.mas_equalTo(self->yqtwo);
    }];
}

- (void)setModel:(TKTaskListModel *)model{
    _model = model;
    NSMutableArray * colorarray = [BaseObject TaskColorArray:[model.mission_type integerValue]];
    UIColor * backcolor = colorarray[5];
    backview.layer.shadowColor = backcolor.CGColor;
    yqone.wview.backgroundColor = colorarray[6];
    yqtwo.wview.backgroundColor = colorarray[6];

    [backimageview sd_setImageWithURL:URLIMAGE(model.mission_background)];
    name.text = [NSString stringWithFormat:@"第%@期新手任务(有奖)",model.periods_num];
    subtitle.text = [NSString stringWithFormat:@"完成新手任务，得%@大奖",model.prize_name];
    yd.text = [NSString stringWithFormat:@"%@人已完成",_model.completedNum];
    lq.text = [NSString stringWithFormat:@"%@人已领取",_model.receiveNum];
}
@end
