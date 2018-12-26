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
    UIView * downxian;
    
    BaseLabel * kjr;
    UIImageView * duigou;
    BaseLabel * yidu;

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
    time = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255, 255, 255) LabelFont:TextFont(14) TextAlignment:NSTextAlignmentCenter Text:@""];
    [self addSubview:time];
    [time mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws);
        make.centerX.mas_equalTo(ws);
        make.width.and.height.mas_equalTo(LENGTH(28));
    }];
    downxian = [UIView new];
    downxian.backgroundColor = RGB(223,213,128);
    [self addSubview:downxian];
    [downxian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->time.mas_bottom).with.offset(LENGTH(5));
        make.centerX.mas_equalTo(ws);
        make.width.mas_equalTo(LENGTH(18));
        make.height.mas_equalTo(LENGTH(2));
    }];
    downxian.hidden = YES;
    
    kjr = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(230,94,57) LabelFont:TextFont(10) TextAlignment:NSTextAlignmentCenter Text:@""];
    [self addSubview:kjr];
    [kjr mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->time.mas_bottom).with.offset(LENGTH(5));
        make.centerX.mas_equalTo(ws);
    }];
    kjr.hidden = YES;
    
    duigou = [UIImageView new];
    duigou.contentMode = UIViewContentModeScaleAspectFit;
    duigou.image = UIIMAGE(@"勾");
    [self addSubview:duigou];
    [duigou mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->time.mas_bottom).with.offset(LENGTH(0));
        make.centerX.mas_equalTo(ws);
        make.width.mas_equalTo(LENGTH(12));
        make.height.mas_equalTo(LENGTH(8));
    }];
    yidu = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(54,142,137) LabelFont:TextFont(10) TextAlignment:NSTextAlignmentCenter Text:@""];
    [self addSubview:yidu];
    [yidu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->duigou.mas_bottom);
        make.centerX.mas_equalTo(ws);
    }];
    yidu.hidden = YES;
    duigou.hidden = YES;
}
- (void)wushuju{
    time.text = @"";
    downxian.hidden = YES;
    kjr.hidden = YES;
    yidu.hidden = YES;
    duigou.hidden = YES;
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
        downxian.hidden = YES;
        kjr.hidden = YES;
        yidu.hidden = YES;
        duigou.hidden = YES;
    }else if (model.type ==1){
        time.layer.cornerRadius = LENGTH(14);
        time.layer.masksToBounds = YES;
        time.backgroundColor = RGB(223,213,128);
        downxian.hidden = NO;
        kjr.hidden = YES;
        yidu.hidden = YES;
        duigou.hidden = YES;
    }else if (model.type == 0){
        time.layer.cornerRadius = LENGTH(14);
        time.layer.masksToBounds = YES;
        time.backgroundColor = RGBA(0, 0, 0, 0.3);
        downxian.hidden = YES;
        kjr.hidden = YES;
        yidu.hidden = YES;
        duigou.hidden = YES;
    }
    if (model.types == 3){
        downxian.hidden = YES;
        kjr.hidden = YES;
        yidu.hidden = NO;
        duigou.hidden = NO;
        yidu.text = [NSString stringWithFormat:@"已读%@本",model.readbook];
    }
    if (model.types == 4){
        time.layer.cornerRadius = LENGTH(14);
        time.layer.masksToBounds = YES;
        time.backgroundColor = RGB(254,122,87);
        downxian.hidden = YES;
        kjr.hidden = NO;
        kjr.text = [NSString stringWithFormat:@"第%@期开奖日",model.periods_num];
        yidu.hidden = YES;
        duigou.hidden = YES;
    }

}
@end
