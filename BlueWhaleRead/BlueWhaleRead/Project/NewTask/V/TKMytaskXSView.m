//
//  TKMytaskXSView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/1/15.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "TKMytaskXSView.h"

@implementation TKMytaskXSView{
    UIView * backview;
    UIImageView * backimageview;
    UIImageView * leftimage;
    BaseLabel * ztlabel;
    BaseLabel * time;
    
    BaseLabel * name;
    BaseLabel * subtitle;
    BaseLabel * fenshu;

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
    
    leftimage = [UIImageView new];
    leftimage.contentMode = UIViewContentModeScaleAspectFit;
    leftimage.image = UIIMAGE(@"标签已放弃");
    leftimage.image = [leftimage.image imageWithRenderingMode:(UIImageRenderingModeAlwaysTemplate)];
    [backview addSubview:leftimage];
    [leftimage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->backview).with.offset(LENGTH(14));
        make.left.mas_equalTo(self->backview);
        make.width.mas_equalTo(LENGTH(56));
        make.height.mas_equalTo(LENGTH(23));
    }];
    
    ztlabel = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255,255,255) LabelFont:TextFontCu(13) TextAlignment:NSTextAlignmentCenter Text:@""];
    [leftimage addSubview:ztlabel];
    [ztlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self->leftimage);
    }];
    
    time = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(153,153,153) LabelFont:TextFontCu(13) TextAlignment:NSTextAlignmentLeft Text:@"2018.7.21 - 8.21   共4周"];
    [backview addSubview:time];
    [time mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->leftimage.mas_right).with.offset(LENGTH(8));
        make.centerY.mas_equalTo(self->leftimage);
    }];
    
    name = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(51,51,51) LabelFont:TextFontCu(22) TextAlignment:NSTextAlignmentLeft Text:@"第0期新手任务(有奖)"];
    [backview addSubview:name];
    [name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->backview).with.offset(LENGTH(25));
        make.top.mas_equalTo(self->leftimage.mas_bottom).with.offset(LENGTH(24));
    }];
    
    subtitle = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(51,51,51) LabelFont:TextFontCu(17) TextAlignment:NSTextAlignmentCenter Text:@"完成新手任务，得超级大奖!"];
    [backview addSubview:subtitle];
    [subtitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->backview).with.offset(LENGTH(25));
        make.top.mas_equalTo(self->name.mas_bottom).with.offset(LENGTH(15));
    }];
    
    fenshu = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(51, 51, 51) LabelFont:TextFont(17) TextAlignment:NSTextAlignmentCenter Text:@""];
    [backview addSubview:fenshu];
    [fenshu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->backview).with.offset(LENGTH(25));
        make.top.mas_equalTo(self->subtitle.mas_bottom).with.offset(LENGTH(13));

    }];
    
}

- (void)setModel:(TKMyListModel *)model{
    _model = model;
    NSMutableArray * colorarray = [BaseObject TaskColorArray:[model.mission.mission_type integerValue]];
    UIColor *colr = colorarray[5];
    backview.layer.shadowColor = colr.CGColor;
    fenshu.textColor = colorarray[0];
    [backimageview sd_setImageWithURL:URLIMAGE(model.mission.mission_background)];
    if ([model.studentMission.status isEqualToString:@"1"]) {
        ztlabel.text = @"进行中";
        leftimage.tintColor = RGB(141,214,213);
    }else if ([model.studentMission.status isEqualToString:@"2"]){
        ztlabel.text = @"已完成";
        leftimage.tintColor = RGB(123,206,255);
    }else{
        ztlabel.text = @"已放弃";
        leftimage.tintColor = RGB(224,224,224);
    }
    
    NSDate * receive_timedate = [BaseObject TimeStringForDate:model.studentMission.receive_time];
    NSDate * rcompleted_timedate = [BaseObject TimeStringForDate:model.studentMission.completed_time];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit unit = NSCalendarUnitDay;//只比较天数差异
    NSDateComponents *delta = [calendar components:unit fromDate:receive_timedate toDate:rcompleted_timedate options:0];
    NSInteger dalentgt = delta.day;
    NSInteger ceilA = ceilf(dalentgt/7.0);
    NSArray * lastime = [BaseObject TiemArray:model.studentMission.receive_time String:@"-"];
    NSArray * nexttime = [BaseObject TiemArray:model.studentMission.completed_time String:@"-"];
    time.text = [NSString stringWithFormat:@"%@.%@.%@-%@.%@  共%ld周",lastime[0],lastime[1],lastime[2],nexttime[1],nexttime[2],ceilA];
    //    name.text = [NSString stringWithFormat:@"第%@期新手任务(有奖)",model.periods_num];
    if ([model.mission.mission_type isEqualToString:@"1"]&&[model.studentMission.status isEqualToString:@"1"]) {
        fenshu.text = @"";
    }else{
        fenshu.text = [NSString stringWithFormat:@"分数 %@",model.studentMission.score];
    }
    
    name.text = [NSString stringWithFormat:@"第%@期新手任务(有奖)",model.studentMission.periods_num];
}
@end
