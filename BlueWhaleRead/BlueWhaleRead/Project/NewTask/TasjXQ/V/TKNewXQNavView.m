//
//  TKNewXQNavView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/1/14.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "TKNewXQNavView.h"
#import "TKIssueViewController.h"
#import "TFameViewController.h"
@implementation TKNewXQNavView{
    BaseLabel * title;
    BaseLabel * rightlabel;
    BaseLabel * Pastwinners;
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
    self.backgroundColor = RGB(255, 255, 255);
    [self mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(StatusBar+44);
    }];
    WS(ws);
    UIImageView* backImage = [UIImageView new];
    backImage.contentMode = UIViewContentModeScaleAspectFit;
    backImage.image = UIIMAGE(@"backhei");
    [self addSubview:backImage];
    [backImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws).with.offset(StatusBar+13);
        make.left.mas_equalTo(ws).with.offset(LENGTH(12));
        make.width.mas_equalTo(12);
        make.height.mas_equalTo(22);
    }];
    
    title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(51, 51, 51) LabelFont:TextFontCu(24) TextAlignment:NSTextAlignmentLeft Text:@""];
    [self addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(backImage.mas_right).with.offset(LENGTH(15));
        make.centerY.mas_equalTo(backImage);
    }];
    
    UIView * tapview = [UIView new];
    [self addSubview:tapview];
    [tapview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.mas_equalTo(ws);
        make.height.mas_equalTo(NavHeight);
        make.width.mas_equalTo(LENGTH(50));
    }];
    tapview.userInteractionEnabled = YES;
    UITapGestureRecognizer * tapviewtap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(NavLeftClick)];
    //将手势添加到需要相应的view中去
    [tapview addGestureRecognizer:tapviewtap];
    
    Pastwinners = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(51, 51, 51) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentLeft Text:@"名人堂>"];
    [self addSubview:Pastwinners];
    [Pastwinners mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(backImage);
        make.right.mas_equalTo(ws).with.offset(-LENGTH(12));
    }];
}
- (void)NavLeftClick{
    [[self viewController].navigationController popViewControllerAnimated:YES];
    
}
- (void)setModel:(TAKALLModel *)model{
    _model = model;
    if ([model.mission.mission_type isEqualToString:@"1"]) {
        title.text = [NSString stringWithFormat:@"%@ 第%@期",model.mission.mission_name,model.mission.periods_num];
        Pastwinners.text = @"查看往期中奖>";
        Pastwinners.userInteractionEnabled = YES;
        UITapGestureRecognizer * tapviewtap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(wqzj)];
        //将手势添加到需要相应的view中去
        [Pastwinners addGestureRecognizer:tapviewtap];
    }else if ([model.mission.mission_type isEqualToString:@"3"]){
        title.text = model.mission.mission_name;
    }else{
        title.text = model.mission.mission_name;
        Pastwinners.text = @"名人堂>";
        Pastwinners.userInteractionEnabled = YES;
        UITapGestureRecognizer * tapviewtap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(mrt)];
        //将手势添加到需要相应的view中去
        [Pastwinners addGestureRecognizer:tapviewtap];
    }
    
}

- (void)wqzj{
    TKIssueViewController * vc = [TKIssueViewController new];
    vc.missionid = _model.mission.ssid;
    [[self viewController].navigationController pushViewController:vc animated:YES];
}

- (void)mrt{
    TFameViewController * vc = [TFameViewController new];
    vc.missionid = _model.mission.ssid;
    [[self viewController].navigationController pushViewController:vc animated:YES];
}
@end
