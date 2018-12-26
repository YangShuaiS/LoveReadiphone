//
//  TCompleteView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/30.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "TCompleteView.h"
#import "TKJMenu.h"
#import "TPHBViewController.h"

#import "TKAlltaskViewController.h"
#import "TAskForViewController.h"
@implementation TCompleteView{
    UIScrollView * scrollView;
    BaseLabel * ruxq;
    BaseLabel * leftlabel;
    BaseLabel * rightlabel;
    
    TPHBViewController * hotview;
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
    self.backgroundColor = RGBA(0, 0, 0, 0.6);
    scrollView = [UIScrollView new];
    scrollView.backgroundColor = [UIColor  clearColor];
    scrollView.userInteractionEnabled = YES;
    [self addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
    
    ruxq = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255,225,61) LabelFont:TextFont(16) TextAlignment:NSTextAlignmentCenter Text:@"恭喜你完成 初级任务！\n太棒了～你的成绩为 460 分!"];
    ruxq.numberOfLines = 2;
    AttributedStringModel * model1 = [AttributedStringModel new];
    model1.textString = ruxq.text;
    model1.bianString = @"初级任务";
    model1.fount = 21;
    model1.color = RGB(255,225,61);
    
    AttributedStringModel * model2 = [AttributedStringModel new];
    model2.textString = ruxq.text;
    model2.bianString = @" 460 ";
    model2.fount = 30;
    model2.color = RGB(254,89,31);

    NSArray * modelarray = @[model1,model2];
    NSMutableAttributedString *AttributedStr = [BaseObject Attributed:modelarray];
    ruxq.attributedText = AttributedStr;
    [scrollView addSubview:ruxq];
    [ruxq mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(ws);
        make.top.mas_equalTo(self->scrollView).with.offset(StatusBar+LENGTH(62));
    }];
    
    BaseLabel * xz = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255,255,255) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentCenter Text:@"你可以选择："];
    [scrollView addSubview:xz];
    [xz mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->ruxq.mas_bottom).with.offset(LENGTH(48));
        make.centerX.mas_equalTo(ws);
    }];
    
    leftlabel = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255,255,255) LabelFont:TextFont(18) TextAlignment:NSTextAlignmentCenter Text:@"领取中级任务"];
    leftlabel.backgroundColor = RGB(255,91,40);
    leftlabel.layer.cornerRadius = LENGTH(21);
    leftlabel.layer.masksToBounds = YES;
    [scrollView addSubview:leftlabel];
    [leftlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws).with.offset(LENGTH(22));
        make.top.mas_equalTo(xz.mas_bottom).with.offset(LENGTH(20));
        make.width.mas_equalTo(LENGTH(150));
        make.height.mas_equalTo(LENGTH(42));
    }];
    
    
    rightlabel = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255,255,255) LabelFont:TextFont(18) TextAlignment:NSTextAlignmentCenter Text:@"重复初级任务"];
    rightlabel.backgroundColor = RGB(78,229,192);
    rightlabel.layer.cornerRadius = LENGTH(21);
    rightlabel.layer.masksToBounds = YES;
    [scrollView addSubview:rightlabel];
    [rightlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(ws).with.offset(-LENGTH(22));
        make.top.mas_equalTo(xz.mas_bottom).with.offset(LENGTH(20));
        make.width.mas_equalTo(LENGTH(150));
        make.height.mas_equalTo(LENGTH(42));
    }];
    
    leftlabel.userInteractionEnabled = YES;
    UITapGestureRecognizer * leftlabeltap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(leftlabelclick)];
    //将手势添加到需要相应的view中去
    [leftlabel addGestureRecognizer:leftlabeltap];
    
    rightlabel.userInteractionEnabled = YES;
    UITapGestureRecognizer * rightlabeltap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(rightlabelclick)];
    //将手势添加到需要相应的view中去
    [rightlabel addGestureRecognizer:rightlabeltap];

    
    TKJMenu * homeMenu = [TKJMenu new];
    homeMenu.titarray = @[@"排行榜"];
    [scrollView addSubview:homeMenu];
    [homeMenu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(LENGTH(20));
        make.right.equalTo(ws).with.offset(-LENGTH(20));
        make.top.equalTo(self->rightlabel.mas_bottom).with.offset(LENGTH(28));
        make.bottom.mas_equalTo(self->scrollView).with.offset(-LENGTH(20));
        make.height.mas_equalTo(LENGTH(543));
    }];
    NSMutableArray *childVC = [[NSMutableArray alloc] init];
    hotview = [[TPHBViewController alloc] init];
    //    hotview.bookCase = BookCaseStyleSJWD;
    [[self viewController] addChildViewController:hotview];
    [childVC addObject:hotview];
    homeMenu.controllerArray = childVC;
    
    FLAnimatedImageView * imageview = [FLAnimatedImageView new];
    imageview.contentMode = UIViewContentModeScaleAspectFit;
    imageview.image = UIIMAGE(@"组120");
    [self addSubview:imageview];
    [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws).with.offset(StatusBar+LENGTH(5));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(22));
        make.width.and.height.mas_equalTo(LENGTH(42));
    }];
    
    imageview.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(shanchu)];
    //将手势添加到需要相应的view中去
    [imageview addGestureRecognizer:tap];
    [hotview setBlock:^{
        [ws removeFromSuperview];
    }];
}

- (void)shanchu{
    [self removeFromSuperview];
}

- (void)leftlabelclick{
    if ([_model.mission.next_mission isEqualToString:@"4"]) {
        TKAlltaskViewController * vc = [TKAlltaskViewController new];
        [self.nav pushViewController:vc animated:YES];
    }else{
        TAskForViewController * vc = [TAskForViewController new];
        vc.type = @"1";
        vc.missionid = [NSString stringWithFormat:@"%@",_model.mission.next_mission];
        vc.navtitle = _model.mission.next_mission_name;
        [self.nav pushViewController:vc animated:YES];
    }
    [self removeFromSuperview];
}

- (void)rightlabelclick{
    TAskForViewController * vc = [TAskForViewController new];
    vc.type = @"1";
    vc.missionid = [NSString stringWithFormat:@"%@",_model.mission.ssid];
    vc.navtitle = _model.mission.mission_name;
    [self.nav pushViewController:vc animated:YES];
    [self removeFromSuperview];
}

- (void)setModel:(TKXSTaskXQModel *)model{
    _model = model;
    NSMutableArray * itemarray = model.studentRankList;
    if (model.student.myRank.length == 0 || ![model.student.myRank isEqualToString:@"0"]) {
        [itemarray insertObject:model.student atIndex:0];
        hotview.bianse = @"1";
    }
    hotview.missionid = @"1";
    hotview.nav = self.nav;
    hotview.itemarray = itemarray;
    ruxq.text = [NSString stringWithFormat:@"恭喜你完成 %@！\n太棒了～你的成绩为 %@ 分!",model.mission.mission_name,model.mission.score];
    AttributedStringModel * model1 = [AttributedStringModel new];
    model1.textString = ruxq.text;
    model1.bianString = model.mission.score;
    model1.fount = 24;
    model1.color = RGB(254,89,31);
    NSArray * modelarray = @[model1];
    NSMutableAttributedString *AttributedStr = [BaseObject Attributed:modelarray];
    ruxq.attributedText = AttributedStr;
    
    if ([model.mission.next_mission isEqualToString:@"4"]) {
        leftlabel.text = @"全部任务";
    }else{
        leftlabel.text = [NSString stringWithFormat:@"领取%@",model.mission.next_mission_name];
    }
    rightlabel.text = [NSString stringWithFormat:@"重复%@",model.mission.mission_name];
}
@end
