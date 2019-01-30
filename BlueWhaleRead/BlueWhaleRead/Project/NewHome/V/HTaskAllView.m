//
//  HTaskAllView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/1/9.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "HTaskAllView.h"
#import "TKPrizeViewController.h"
#import "HTaskprogressView.h"
#import "HTProLasDatView.h"
#import "HTaskWeekTableView.h"
#import "HorizontalcalendarView.h"
#import "TAskForViewController.h"
@implementation HTaskAllView{
    BaseLabel * taskname;//任务名
    BaseLabel * ydl;//阅读量
    BaseLabel * allJp;//全部奖品
    UIImageView *jpjt;//奖品箭头

    BaseLabel * cktaskxq;//查看
    UIImageView *ckjt;//查看查看箭头
    
    HTaskprogressView * progressView;//进度
    HTProLasDatView * proLas;
    
    NSMutableArray * colorarray;
    HTaskWeekTableView * weektabview;
    
    UIImageView *lianjieone;//连接1
    UIImageView *lianjietwo;//连接2

    HorizontalcalendarView * calend;//g横划日历

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
    UIView * backview = [UIView new];
    backview.backgroundColor = RGB(255, 255, 255);
    [self addSubview:backview];
    [backview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws);
        make.left.mas_equalTo(ws).with.offset(LENGTH(20));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(20));

    }];
    backview.layer.shadowOpacity = 0.24;
    backview.layer.shadowColor = RGB(171, 171, 171).CGColor;
    backview.layer.shadowRadius = LENGTH(16);
    backview.layer.shadowOffset = CGSizeMake(0,4);
    backview.layer.cornerRadius = LENGTH(12);
    
    taskname = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(51,51,51) LabelFont:TextFontCu(20) TextAlignment:NSTextAlignmentLeft Text:@""];
    [backview addSubview:taskname];
    [taskname mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(backview).with.offset(LENGTH(22));
        make.top.mas_equalTo(backview).with.offset(LENGTH(19));
    }];
    
    ydl = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(51, 51, 51) LabelFont:TextFont(13) TextAlignment:NSTextAlignmentLeft Text:@"298736人已完成"];
    [backview addSubview:ydl];
    [ydl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(backview).with.offset(LENGTH(22));
        make.top.mas_equalTo(self->taskname.mas_bottom).with.offset(LENGTH(12));
    }];
    
    jpjt = [UIImageView new];
    jpjt.contentMode = UIViewContentModeScaleAspectFit;
    UIImage * image = UIIMAGE(@"icon_个人资料_箭头");
    jpjt.image = image;
    jpjt.image = [jpjt.image imageWithRenderingMode:(UIImageRenderingModeAlwaysTemplate)];
    [backview addSubview:jpjt];
    [jpjt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(backview).with.offset(-LENGTH(16));
        make.centerY.mas_equalTo(self->taskname.mas_centerY);
        make.width.mas_equalTo(LENGTH(7));
        make.height.mas_equalTo(LENGTH(12));
    }];
    
    allJp = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(236,138,53) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentLeft Text:@"全部奖品"];
    [backview addSubview:allJp];
    [allJp mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self->jpjt.mas_left).with.offset(-LENGTH(8));
        make.centerY.mas_equalTo(self->taskname.mas_centerY);
    }];
    allJp.userInteractionEnabled = YES;
    UITapGestureRecognizer * ckjptap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ckjpclick)];
    [allJp addGestureRecognizer:ckjptap];
    jpjt.hidden = YES;
    allJp.hidden = YES;
    
    progressView = [HTaskprogressView new];
    progressView.inter = 0;
    [backview addSubview:progressView];
    [progressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->ydl.mas_bottom);
        make.left.and.right.mas_equalTo(backview);
    }];
    
    proLas = [HTProLasDatView new];
    [backview addSubview:proLas];
    [proLas mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->progressView.mas_bottom).with.offset(LENGTH(20));
        make.left.and.right.mas_equalTo(backview);
    }];
    
    BaseLabel * bweektask = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(51,51,51) LabelFont:TextFontCu(19) TextAlignment:NSTextAlignmentCenter Text:@"- 本周任务 -"];
    [backview addSubview:bweektask];
    [bweektask mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->proLas.mas_bottom).with.offset(LENGTH(17));
        make.left.and.right.mas_equalTo(backview);
    }];
    weektabview = [HTaskWeekTableView new];
    [backview addSubview:weektabview];
    [weektabview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(bweektask.mas_bottom);
        make.left.and.right.mas_equalTo(backview);
    }];
    
    cktaskxq = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(236,138,53) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentLeft Text:@"查看任务详情"];
    [backview addSubview:cktaskxq];
    [cktaskxq mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(backview);
        make.top.mas_equalTo(self->weektabview.mas_bottom);
        make.bottom.mas_equalTo(backview).with.offset(-LENGTH(18));
    }];
    cktaskxq.userInteractionEnabled = YES;
    UITapGestureRecognizer * cktaskxqtap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ckclick)];
    [cktaskxq addGestureRecognizer:cktaskxqtap];
    
    ckjt = [UIImageView new];
    ckjt.contentMode = UIViewContentModeScaleAspectFit;
    ckjt.image = UIIMAGE(@"icon_个人资料_箭头");
    ckjt.image = [ckjt.image imageWithRenderingMode:(UIImageRenderingModeAlwaysTemplate)];
    [backview addSubview:ckjt];
    [ckjt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->cktaskxq.mas_right).with.offset(LENGTH(7));
        make.centerY.mas_equalTo(self->cktaskxq.mas_centerY);
        make.width.mas_equalTo(LENGTH(7));
        make.height.mas_equalTo(LENGTH(12));
    }];
    
    UIView * downview = [UIView new];
    downview.backgroundColor = RGB(255, 255, 255);
    [self addSubview:downview];
    [downview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(backview.mas_bottom).with.offset(LENGTH(16));
        make.left.mas_equalTo(ws).with.offset(LENGTH(20));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(20));
        make.bottom.mas_equalTo(ws).with.offset(-LENGTH(14));
    }];
    downview.layer.shadowOpacity = 0.24;
    downview.layer.shadowColor = RGB(171, 171, 171).CGColor;
    downview.layer.shadowRadius = LENGTH(16);
    downview.layer.shadowOffset = CGSizeMake(0,4);
    downview.layer.cornerRadius = LENGTH(12);
    
    
    lianjieone = [UIImageView new];
    lianjieone.contentMode = UIViewContentModeScaleAspectFit;
    lianjieone.image = UIIMAGE(@"连接橙色");
    [self addSubview:lianjieone];
    [lianjieone mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(backview).with.offset(LENGTH(50));
        make.top.mas_equalTo(backview.mas_bottom).with.offset(-LENGTH(11));
        make.width.mas_equalTo(LENGTH(10));
        make.height.mas_equalTo(LENGTH(38));
    }];
    
    lianjietwo = [UIImageView new];
    lianjietwo.contentMode = UIViewContentModeScaleAspectFit;
    lianjietwo.image = UIIMAGE(@"连接橙色");
    [self addSubview:lianjietwo];
    [lianjietwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(backview).with.offset(-LENGTH(50));
        make.top.mas_equalTo(backview.mas_bottom).with.offset(-LENGTH(11));
        make.width.mas_equalTo(LENGTH(10));
        make.height.mas_equalTo(LENGTH(38));
    }];
    
    calend = [HorizontalcalendarView new];
    [downview addSubview:calend];
    [calend mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(downview);
    }];

}
- (void)upcolor{
    allJp.textColor = colorarray[0];
    jpjt.tintColor = colorarray[0];
    cktaskxq.textColor = colorarray[0];
    ckjt.tintColor = colorarray[0];
    if ([_model.mission.mission_type integerValue] == 1) {
        lianjieone.image = UIIMAGE(@"连接橙色");
        lianjietwo.image = UIIMAGE(@"连接橙色");
    }
    if ([_model.mission.mission_type integerValue] == 3) {
        lianjieone.image = UIIMAGE(@"连接青色");
        lianjietwo.image = UIIMAGE(@"连接青色");
    }
    if ([_model.mission.mission_type integerValue] == 5) {
        lianjieone.image = UIIMAGE(@"连接黄绿色");
        lianjietwo.image = UIIMAGE(@"连接黄绿色");
    }
    if ([_model.mission.mission_type integerValue]== 6) {
        lianjieone.image = UIIMAGE(@"连接蓝色");
        lianjietwo.image = UIIMAGE(@"连接蓝色");
    }
    if ([_model.mission.mission_type integerValue]== 7) {
        lianjieone.image = UIIMAGE(@"连接紫色");
        lianjietwo.image = UIIMAGE(@"连接紫色");
    }
    
}
- (void)setModel:(NHMissionModel *)model{
    _model = model;
    colorarray = [BaseObject TaskColorArray:[model.mission.mission_type integerValue]];
    progressView.colorarray = colorarray;
    progressView.jindu = [model.userRatio floatValue];
    
    proLas.colorarray = colorarray;
    weektabview.colorarray = colorarray;
    calend.colorarray = colorarray;
    [self upcolor];
    if (model.mission.periods_num.length == 0 || [model.mission.periods_num isEqualToString:@"0"]) {
        jpjt.hidden = YES;
        allJp.hidden = YES;
        taskname.text = model.mission.mission_name;
    }else{
        jpjt.hidden = NO;
        allJp.hidden = NO;
        taskname.text = [NSString stringWithFormat:@"%@第%@期",model.mission.mission_name,model.mission.periods_num];
        AttributedStringModel * model1 = [AttributedStringModel new];
        model1.textString = taskname.text;
        model1.bianString = [NSString stringWithFormat:@"第%@期",model.mission.periods_num];
        model1.fount = 15;
        NSArray * modelarray = @[model1];
        NSMutableAttributedString *AttributedStr = [BaseObject AttributedAll:modelarray];
        taskname.attributedText = AttributedStr;
    }
    ydl.text = [NSString stringWithFormat:@"%@人已完成",model.mission.completed_num];
    proLas.zt = model.thisWeekInfo.rankinfo;
    NSMutableArray * rwuarray = [NSMutableArray array];
    NHTimeListModel * reedbook = [NHTimeListModel new];
    reedbook.name = [NSString stringWithFormat:@"阅读完成%@本书",model.missionRole.week_book_num];
    reedbook.completed = [model.thisWeekInfo.book_is_completed integerValue];
    reedbook.week_book_num = model.thisWeekInfo.week_book_num;
    reedbook.allweek_book_num = model.missionRole.week_book_num;
    reedbook.types = 1;
    reedbook.book_Score = model.thisWeekInfo.book_Score;
    
    NHTimeListModel * share = [NHTimeListModel new];
    share.name = [NSString stringWithFormat:@"分享%@次",model.missionRole.week_share_num];
    share.completed = [model.thisWeekInfo.share_is_completed integerValue];
    share.week_share_num = model.thisWeekInfo.week_share_num;
    share.allweek_share_num = model.missionRole.week_share_num;
    share.types = 2;
    share.book_Score = model.thisWeekInfo.share_Score;
    [rwuarray addObject:reedbook];
    [rwuarray addObject:share];
    weektabview.frien = 0;
    weektabview.ing = 1;
    weektabview.itemarray = rwuarray;
    calend.model = model;
    //确保动画正常进行，保证所有视图更新后
    progressView.mission_type = [model.mission.mission_type integerValue];

}


- (void)ckjpclick{
    TKPrizeViewController * vc = [TKPrizeViewController new];
    [[self viewController].navigationController pushViewController:vc animated:YES];
}

- (void)ckclick{
    TAskForViewController * vc = [TAskForViewController new];
    vc.type = @"1";
    vc.missionid = [NSString stringWithFormat:@"%@",_model.mission.ssid];
    vc.navtitle = _model.mission.mission_name;
    [[self viewController].navigationController pushViewController:vc animated:YES];
}
@end
