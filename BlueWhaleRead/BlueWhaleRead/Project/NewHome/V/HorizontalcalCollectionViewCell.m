//
//  HorizontalcalCollectionViewCell.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/3.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "HorizontalcalCollectionViewCell.h"

@implementation HorizontalcalCollectionViewCell{
    BaseLabel * time;
    BaseLabel * kjr;
}
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    WS(ws);
    time = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(51, 51, 51) LabelFont:TextFont(14) TextAlignment:NSTextAlignmentCenter Text:@""];
    [self addSubview:time];
    [time mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws);
        make.centerX.mas_equalTo(ws);
        make.width.and.height.mas_equalTo(LENGTH(28));
    }];

    kjr = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(230,94,57) LabelFont:TextFont(10) TextAlignment:NSTextAlignmentCenter Text:@""];
    [self addSubview:kjr];
    [kjr mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->time.mas_bottom).with.offset(LENGTH(5));
        make.centerX.mas_equalTo(ws);
    }];
    kjr.hidden = YES;
}
- (void)wushuju{
    time.text = @"";
    kjr.hidden = YES;
    time.layer.masksToBounds = YES;
    time.backgroundColor = [UIColor clearColor];
    time.layer.cornerRadius = LENGTH(0);


}
- (void)setModel:(NHthisReadbokModel *)model{
    _model = model;
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *weekdayComponents = [gregorian components:NSCalendarUnitDay fromDate:model.timedate];
    NSInteger day = weekdayComponents.day;
    NSString * datstr = [NSString stringWithFormat:@"%ld",day];
    time.text = datstr;
    
    if (model.type == 2) {
        time.layer.cornerRadius = LENGTH(0);
        time.layer.masksToBounds = NO;
        time.backgroundColor = [UIColor clearColor];
        kjr.hidden = YES;
    }else if (model.type ==1){
        time.layer.cornerRadius = LENGTH(14);
        time.layer.masksToBounds = YES;
        time.backgroundColor = RGB(255,229,82);
        kjr.hidden = YES;
    }else if (model.type == 0){
        time.layer.cornerRadius = LENGTH(14);
        time.layer.masksToBounds = YES;
        time.backgroundColor = RGB(238,238,238);
        kjr.hidden = YES;
    }
    if (model.types == 3){
        time.layer.cornerRadius = LENGTH(14);
        time.layer.masksToBounds = YES;
        time.backgroundColor = _colorarray[2];
        kjr.hidden = NO;
        kjr.text = [NSString stringWithFormat:@"已读%@本",model.readbook];
        kjr.textColor = _colorarray[0];
    }
    if (model.types == 4){
        time.layer.cornerRadius = LENGTH(14);
        time.layer.masksToBounds = YES;
        time.backgroundColor = RGBA(255,94,94,0.42);
        kjr.hidden = NO;
        kjr.text = [NSString stringWithFormat:@"第%@期开奖日",model.periods_num];
        kjr.textColor = RGB(255,94,94);
    }
    if (model.types == 5){
        time.layer.cornerRadius = LENGTH(14);
        time.layer.masksToBounds = YES;
        time.backgroundColor = RGB(255,94,94);
        kjr.hidden = NO;
        kjr.text = [NSString stringWithFormat:@"本期开奖日"];
        kjr.textColor = RGB(255,94,94);
    }

}
@end
