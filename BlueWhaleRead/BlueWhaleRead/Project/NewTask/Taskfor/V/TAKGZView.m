//
//  TAKGZView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/4.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "TAKGZView.h"
#import "TakGFGLViewController.h"
@implementation TAKGZView{
    BaseLabel * onelabel;
    BaseLabel * twolabel;
    BaseLabel * threelabel;
    BaseLabel * fourlabel;
    BaseLabel * fivelabel;
    BaseLabel * sexlabel;

    UIView * fourview;
    UIView * fiveview;
    UIView * sexview;

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
    UIView * backview = [UIView new];
    backview.backgroundColor = RGBA(204,235,235,0.6);
    [self addSubview:backview];
    [backview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws).with.insets(UIEdgeInsetsMake(0, LENGTH(30), 0, LENGTH(30)));
    }];
    
    BaseLabel * title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(49,87,86) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentCenter Text:@"规则"];
    [backview addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(backview).with.offset(LENGTH(12));
        make.centerX.mas_equalTo(backview);
    }];
    
    BaseLabel * gfgl = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(253,129,38) LabelFont:TextFont(13) TextAlignment:NSTextAlignmentCenter Text:@"高分攻略"];
    [backview addSubview:gfgl];
    [gfgl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(title);
        make.right.mas_equalTo(backview).with.offset(-LENGTH(16));
    }];
    backview.userInteractionEnabled = YES;
    gfgl.userInteractionEnabled = YES;
    UITapGestureRecognizer * tapviewtap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gfgl)];
    //将手势添加到需要相应的view中去
    [gfgl addGestureRecognizer:tapviewtap];
    
    UIView * oneview = [self addyuanquan];
    [backview addSubview:oneview];
    [oneview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(backview).with.offset(LENGTH(22));
        make.top.mas_equalTo(title.mas_bottom).with.offset(LENGTH(15));
        make.width.and.height.mas_equalTo(LENGTH(4));
    }];
    onelabel = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(49,87,86) LabelFont:TextFont(14) TextAlignment:NSTextAlignmentLeft Text:@"需要每周读两本书，如果本周没有读两本书，分数少；"];
    onelabel.numberOfLines = 0;
    [backview addSubview:onelabel];
    [onelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(title.mas_bottom).with.offset(LENGTH(12));
        make.left.mas_equalTo(oneview).with.offset(LENGTH(12));
        make.right.mas_equalTo(backview).with.offset(-LENGTH(24));
    }];
    
    UIView * twoview = [self addyuanquan];
    [backview addSubview:twoview];
    [twoview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(backview).with.offset(LENGTH(22));
        make.top.mas_equalTo(self->onelabel.mas_bottom).with.offset(LENGTH(19));
        make.width.and.height.mas_equalTo(LENGTH(4));
    }];
    twolabel = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(49,87,86) LabelFont:TextFont(14) TextAlignment:NSTextAlignmentLeft Text:@"需要每周分享到朋友圈或分享给好友一次，如果本周未分享，分数少；"];
    twolabel.numberOfLines = 0;
    [backview addSubview:twolabel];
    [twolabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->onelabel.mas_bottom).with.offset(LENGTH(15));
        make.left.mas_equalTo(twoview).with.offset(LENGTH(12));
        make.right.mas_equalTo(backview).with.offset(-LENGTH(24));
    }];
    
    UIView * threeview = [self addyuanquan];
    [backview addSubview:threeview];
    [threeview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(backview).with.offset(LENGTH(22));
        make.top.mas_equalTo(self->twolabel.mas_bottom).with.offset(LENGTH(19));
        make.width.and.height.mas_equalTo(LENGTH(4));
    }];
    threelabel = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(49,87,86) LabelFont:TextFont(14) TextAlignment:NSTextAlignmentLeft Text:@"至少完成一次识字/识词量测试，完成后可得10积分；"];
    threelabel.numberOfLines = 0;
    [backview addSubview:threelabel];
    [threelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->twolabel.mas_bottom).with.offset(LENGTH(15));
        make.left.mas_equalTo(threeview).with.offset(LENGTH(12));
        make.right.mas_equalTo(backview).with.offset(-LENGTH(24));
    }];
    
    fourview = [self addyuanquan];
    [backview addSubview:fourview];
    [fourview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(backview).with.offset(LENGTH(22));
        make.top.mas_equalTo(self->threelabel.mas_bottom).with.offset(LENGTH(19));
        make.width.and.height.mas_equalTo(LENGTH(4));
    }];
    
    fourlabel = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(49,87,86) LabelFont:TextFont(14) TextAlignment:NSTextAlignmentLeft Text:@"完成后可得奖品"];
    fourlabel.numberOfLines = 0;
    [backview addSubview:fourlabel];
    [fourlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->threelabel.mas_bottom).with.offset(LENGTH(15));
        make.left.mas_equalTo(self->fourview).with.offset(LENGTH(12));
        make.right.mas_equalTo(backview).with.offset(-LENGTH(24));
//        make.bottom.mas_equalTo(backview).with.offset(-LENGTH(20));
    }];
    
    fiveview = [self addyuanquan];
    [backview addSubview:fiveview];
    [fiveview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(backview).with.offset(LENGTH(22));
        make.top.mas_equalTo(self->fourlabel.mas_bottom).with.offset(LENGTH(19));
        make.width.and.height.mas_equalTo(LENGTH(4));
    }];
    
    fivelabel = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(49,87,86) LabelFont:TextFont(14) TextAlignment:NSTextAlignmentLeft Text:@"完成后可得奖品"];
    fivelabel.numberOfLines = 0;
    [backview addSubview:fivelabel];
    [fivelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->fourlabel.mas_bottom).with.offset(LENGTH(15));
        make.left.mas_equalTo(self->fiveview).with.offset(LENGTH(12));
        make.right.mas_equalTo(backview).with.offset(-LENGTH(24));
    }];

    sexview = [self addyuanquan];
    [backview addSubview:sexview];
    [sexview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(backview).with.offset(LENGTH(22));
        make.top.mas_equalTo(self->fivelabel.mas_bottom).with.offset(LENGTH(19));
        make.width.and.height.mas_equalTo(LENGTH(4));
    }];
    
    sexlabel = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(49,87,86) LabelFont:TextFont(14) TextAlignment:NSTextAlignmentLeft Text:@"完成后可得奖品"];
    sexlabel.numberOfLines = 0;
    [backview addSubview:sexlabel];
    [sexlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->fivelabel.mas_bottom).with.offset(LENGTH(15));
        make.left.mas_equalTo(self->sexview).with.offset(LENGTH(12));
        make.right.mas_equalTo(backview).with.offset(-LENGTH(24));
        make.bottom.mas_equalTo(backview).with.offset(-LENGTH(20));
    }];
}

- (UIView *)addyuanquan{
    UIView * v = [UIView new];
    v.backgroundColor = RGB(75,127,127);
    v.layer.masksToBounds = YES;
    v.layer.cornerRadius = LENGTH(2);
    return v;
}

- (void)setModel:(TAKALLModel *)model{
    _model = model;
    if ([model.mission.mission_type isEqualToString:@"1"]) {
    onelabel.text = @"新手任务为固定时间21天（三周），完成后根据积分排名，可获得各项大奖。";
    twolabel.text = [NSString stringWithFormat:@"每周阅读%@本书，并正确回答问题，如果没有完成或超时，则不计入分数。",model.missionRole.week_book_num];
    threelabel.text = [NSString stringWithFormat:@"在新手任务三周内，各完成一次识字量、识词量检测，完成后每项分别获得固定积分%@分。",model.missionRole.literacy_num];
    fourlabel.text = [NSString stringWithFormat:@"每周完成%@次分享任务，分享到朋友圈可以获得到更多的好友支持，完成后每周可以获得固定积分%@分。",model.missionRole.week_share_num,model.missionRole.share_score];
    fivelabel.text = [NSString stringWithFormat:@"奖品分为三级，一等奖%@名、二等奖%@名、三等奖%@名、优胜奖%@名，奖品请参考奖品名单（每期奖品可能修改，以奖品名单为准）。",model.mission.first_prize_num,model.mission.second_prize_num,model.mission.third_prize_num,model.mission.excellent_prize_num];
    sexlabel.text = [NSString stringWithFormat:@"任务完成后，领奖日起30天内领奖，超过30天，视为自动放弃，不再保留领奖权利，请保持手机通畅，确保工作人员可以及时联系到您。"];
    }else{
        fourview.hidden = YES;
        fiveview.hidden = YES;
        sexview.hidden = YES;
        fourlabel.text = @"";
        fivelabel.text = @"";
        sexlabel.text = @"";
        onelabel.text = [NSString stringWithFormat:@"每周阅读%@本书，并正确回答问题，如果没有完成或超时，则不计入分数。",model.missionRole.week_book_num];
        twolabel.text =[NSString stringWithFormat:@"在%@%@周内，各完成一次识字量、识词量检测，完成后每项分别获得固定积分%@分。",model.mission.mission_name,model.missionRole.mission_duration,model.missionRole.literacy_num];
        threelabel.text = [NSString stringWithFormat:@"每周完成%@次分享任务，分享到朋友圈可以获得到更多的好友支持，完成后每周可以获得固定积分%@分。",model.missionRole.week_share_num,model.missionRole.share_score];

    }
}


- (void)gfgl{
    TakGFGLViewController * vc = [TakGFGLViewController new];
    vc.url = _model.missionRole.high_grade;
    [[self viewController].navigationController pushViewController:vc animated:YES];
}
@end
