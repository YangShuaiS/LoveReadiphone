//
//  TKMytaskView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/29.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "TKMytaskView.h"

@implementation TKMytaskView{
    UIImageView * backimageview;
    BaseLabel * title;
    UIView * zijian;
    BaseLabel * fenshu;
    BaseLabel * time;
    BaseLabel * ztlabel;
    
    BaseLabel * zj;

    UIView * zt;
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
    self.layer.shadowColor = RGB(115, 115, 115).CGColor;
    self.layer.shadowOffset = CGSizeMake(0,2);//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
    self.layer.shadowRadius = 9;
    self.layer.shadowOpacity = 0.2;
    self.layer.cornerRadius = LENGTH(5);
    self.layer.masksToBounds = YES;
    
    WS(ws);
    backimageview = [UIImageView new];
    backimageview.contentMode = UIViewContentModeScaleToFill;
    backimageview.backgroundColor = RANDOMCOLOR;
    [self addSubview:backimageview];
    [backimageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
    
    title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:[UIColor whiteColor] LabelFont:TextFontCu(18) TextAlignment:NSTextAlignmentLeft Text:@"初级任务一二三四五六七八"];
    [backimageview addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->backimageview).with.offset(LENGTH(16));
        make.top.mas_equalTo(self->backimageview).with.offset(LENGTH(20));
        make.width.mas_equalTo(LENGTH(214));
    }];
    
    zijian = [UIView new];
    zijian.backgroundColor = RGBA(255, 255, 255, 0.4);
    [backimageview addSubview:zijian];
    [zijian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->title.mas_right).with.offset(LENGTH(2));
        make.height.mas_equalTo(LENGTH(15));
        make.centerY.mas_equalTo(self->title);
    }];
    zijian.layer.cornerRadius = LENGTH(15)/2;
    zijian.layer.masksToBounds = YES;
    
    zj = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:[UIColor whiteColor] LabelFont:TextFontCu(11) TextAlignment:NSTextAlignmentCenter Text:@"自建"];
    [zijian addSubview:zj];
    [zj mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.bottom.mas_equalTo(self->zijian);
        make.left.mas_equalTo(self->zijian).with.offset(LENGTH(8));
        make.right.mas_equalTo(self->zijian).with.offset(-LENGTH(8));
    }];
    zijian.hidden = YES;
    
    fenshu = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:[UIColor whiteColor] LabelFont:TextFontCu(16) TextAlignment:NSTextAlignmentLeft Text:@"分数 "];
    [backimageview addSubview:fenshu];
    [fenshu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->backimageview).with.offset(LENGTH(18));
        make.top.mas_equalTo(self->title.mas_bottom).with.offset(LENGTH(14));
    }];
    
    time = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:[UIColor whiteColor] LabelFont:TextFontCu(13) TextAlignment:NSTextAlignmentLeft Text:@"2018.7.21 - 8.21   共4周"];
    [backimageview addSubview:time];
    [time mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->backimageview).with.offset(LENGTH(18));
        make.top.mas_equalTo(self->fenshu.mas_bottom).with.offset(LENGTH(14));
//        make.bottom.mas_equalTo(self->backimageview).with.offset(-LENGTH(18));
    }];
    
    zt = [UIView new];
    zt.backgroundColor = RGBA(255, 255, 2551, 1);
    zt.layer.cornerRadius = LENGTH(31);
    zt.layer.masksToBounds = YES;
    [backimageview addSubview:zt];
    [zt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self->backimageview);
        make.right.mas_equalTo(self->backimageview).with.offset(-LENGTH(25));
        make.width.and.height.mas_equalTo(LENGTH(62));
    }];
    
    ztlabel = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(71,223,105) LabelFont:TextFontCu(15) TextAlignment:NSTextAlignmentCenter Text:@"进行中"];
    [zt addSubview:ztlabel];
    [ztlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self->zt);
    }];
}
- (void)setModel:(TKMyListModel *)model{
    _model = model;
    [backimageview sd_setImageWithURL:URLIMAGE(model.mission.mission_check_background)];
    title.text = model.mission.mission_name;
    if ([model.mission.mission_type isEqualToString:@"3"]) {
        zijian.hidden = NO;
    }else{
        zijian.hidden = YES;
    }
    fenshu.text = [NSString stringWithFormat:@"分数 %@",model.studentMission.score];
    
    NSDate * receive_timedate = [BaseObject TimeStringForDate:model.studentMission.receive_time];
    NSDate * rcompleted_timedate = [BaseObject TimeStringForDate:model.studentMission.completed_time];

    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit unit = NSCalendarUnitDay;//只比较天数差异
    NSDateComponents *delta = [calendar components:unit fromDate:receive_timedate toDate:rcompleted_timedate options:0];
    NSInteger dalentgt = delta.day;
    NSInteger ceilA = ceilf(dalentgt/7.0);

    time.text = [NSString stringWithFormat:@"%@ - %@  共%ld周",model.studentMission.receive_time,model.studentMission.completed_time,ceilA];
    if ([model.studentMission.status isEqualToString:@"1"]) {
        ztlabel.text = @"进行中";
        zt.backgroundColor = RGBA(255, 255, 255, 1);
    }else if ([model.studentMission.status isEqualToString:@"2"]){
        ztlabel.text = @"已完成";
        zt.backgroundColor = RGBA(255, 255, 255, 0.7);
    }else{
        ztlabel.text = @"已放弃";
        zt.backgroundColor = RGBA(255, 255, 255, 0.7);
    }
}


@end
