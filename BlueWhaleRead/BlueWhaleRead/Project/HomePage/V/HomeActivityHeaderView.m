//
//  HomeActivityHeaderView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/1/28.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "HomeActivityHeaderView.h"

@implementation HomeActivityHeaderView

-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithReuseIdentifier:reuseIdentifier]) {
        
    }
    return self;
}
- (void)setSection:(NSInteger)section{
    UIView * v = [UIView new];
    UIView * xian = [[UIView alloc] initWithFrame:CGRectMake(LENGTH(22), LENGTH(26), LENGTH(2), LENGTH(18))];
    [v addSubview:xian];
    BaseLabel * label = [[BaseLabel alloc] initWithFrame:CGRectMake(LENGTH(38), LENGTH(21), WIDTH/2, LENGTH(28)) LabelTxteColor:RGB(71,198,198) LabelFont:TextFont(20) TextAlignment:NSTextAlignmentLeft Text:@""];
    [v addSubview:label];
    if (section == 1) {
        xian.backgroundColor = RGB(71,198,198);
        label.text = @"一年级必读书目";
        label.textColor = RGB(71,198,198);
        v.backgroundColor = RGB(211,242,242);
    }else if (section == 2){
        xian.backgroundColor = RGB(255,121,121);
        label.text = @"二年级必读书目";
        label.textColor = RGB(255,121,121);
        v.backgroundColor = RGB(252,218,218);
    }else if (section == 3){
        xian.backgroundColor = RGB(87,174,255);
        label.text = @"三年级必读书目";
        label.textColor = RGB(87,174,255);
        v.backgroundColor = RGB(211,231,249);
    }else if (section == 4){
        xian.backgroundColor = RGB(255,185,49);
        label.text = @"四年级必读书目";
        label.textColor = RGB(255,185,49);
        v.backgroundColor = RGB(251,238,213);
    }else if (section == 5){
        xian.backgroundColor = RGB(154,138,250);
        label.text = @"五年级必读书目";
        label.textColor = RGB(154,138,250);
        v.backgroundColor = RGB(235,232,250);
    }else if (section == 6){
        xian.backgroundColor = RGB(208,118,188);
        label.text = @"六年级必读书目";
        label.textColor = RGB(208,118,188);
        v.backgroundColor = RGB(247,233,244);
    }else if (section == 7){
        xian.backgroundColor = RGB(71,198,198);
        label.text = @"七年级必读书目";
        label.textColor = RGB(71,198,198);
        v.backgroundColor = RGB(211,242,242);
    }else if (section == 8){
        xian.backgroundColor = RGB(255,121,121);
        label.text = @"八年级必读书目";
        label.textColor = RGB(255,121,121);
        v.backgroundColor = RGB(252,218,218);
    }else if (section == 9){
        xian.backgroundColor = RGB(87,174,255);
        label.text = @"九年级必读书目";
        label.textColor = RGB(87,174,255);
        v.backgroundColor = RGB(211,231,249);
    }else if (section == 10){
        xian.backgroundColor = RGB(255,185,49);
        label.text = @"高一年级必读书目";
        label.textColor = RGB(255,185,49);
        v.backgroundColor = RGB(251,238,213);
    }else if (section == 11){
        xian.backgroundColor = RGB(154,138,250);
        label.text = @"高二年级必读书目";
        label.textColor = RGB(154,138,250);
        v.backgroundColor = RGB(235,232,250);
    }else if (section == 12){
        xian.backgroundColor = RGB(208,118,188);
        label.text = @"高三年级必读书目";
        label.textColor = RGB(208,118,188);
        v.backgroundColor = RGB(247,233,244);
    }
    
    [self addSubview:v];
    WS(ws);
    [v mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
    
    UIView * downview = [UIView new];
    downview.layer.shadowOffset = CGSizeMake(0,LENGTH(5));//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
    downview.layer.shadowRadius = LENGTH(5);
    downview.layer.shadowOpacity = 0.8;
    if (section == 1) {

    }else if (section == 2){
        downview.layer.shadowColor = RGB(250,184,184).CGColor;
        downview.backgroundColor = RGB(211,242,242);
    }else if (section == 3){
        downview.layer.shadowColor = RGB(149,199,245).CGColor;
        downview.backgroundColor = RGB(252,218,218);
    }else if (section == 4){
        downview.layer.shadowColor = RGB(255,219,152).CGColor;
        downview.backgroundColor = RGB(211,231,249);
    }else if (section == 5){
        downview.layer.shadowColor = RGB(211,203,252).CGColor;
        downview.backgroundColor = RGB(251,238,213);
    }else if (section == 6){
        downview.layer.shadowColor = RGB(253,185,240).CGColor;
        downview.backgroundColor = RGB(235,232,250);
        downview.layer.shadowOpacity = 1;
    }else if (section == 7){

    }else if (section == 8){
        downview.layer.shadowColor = RGB(250,184,184).CGColor;
        downview.backgroundColor = RGB(211,242,242);
    }else if (section == 9){
        downview.layer.shadowColor = RGB(149,199,245).CGColor;
        downview.backgroundColor = RGB(252,218,218);
    }else if (section == 10){
        downview.layer.shadowColor = RGB(255,219,152).CGColor;
        downview.backgroundColor = RGB(211,231,249);
    }else if (section == 11){
        downview.layer.shadowColor = RGB(211,203,252).CGColor;
        downview.backgroundColor = RGB(251,238,213);
    }else if (section == 12){
        downview.layer.shadowColor = RGB(253,185,240).CGColor;
        downview.backgroundColor = RGB(235,232,250);
    }
    [self addSubview:downview];
    [downview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.mas_equalTo(ws);
        make.top.mas_equalTo(ws).with.offset(-LENGTH(5));
        make.height.mas_equalTo(LENGTH(5));
    }];
    self.layer.masksToBounds = YES;
}
@end
