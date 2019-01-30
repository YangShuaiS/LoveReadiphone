//
//  TUpView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/30.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "TUpView.h"
#import "TAskForViewController.h"
@implementation TUpView{
    BaseLabel * time;
    BaseLabel * stime;
    BaseLabel * jindu;
    
    UIScrollView * scrollView;
    UIView * clickview;
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
    self.backgroundColor = RGBA(0, 0, 0, 0.4);
    WS(ws);
    scrollView = [UIScrollView new];
    scrollView.userInteractionEnabled = YES;
    [self addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
    
    UIView * backview = [UIView new];
    backview.layer.cornerRadius = LENGTH(10);
    backview.layer.masksToBounds = YES;
    backview.backgroundColor = [UIColor whiteColor];
    [scrollView addSubview:backview];
    [backview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws).with.offset(LENGTH(23));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(23));
        make.top.mas_equalTo(self->scrollView.mas_top).with.offset(LENGTH(8)+NavHeight);
        make.bottom.mas_equalTo(self->scrollView.mas_bottom).with.offset(-LENGTH(8)-TabBarHeight);

//        make.height.mas_equalTo(LENGTH(466));
//        make.width.mas_equalTo(LENGTH(330));
//        make.center.mas_equalTo(ws);
    }];
    
    UIImageView * imageviews = [UIImageView new];
    imageviews.image = UIIMAGE(@"完成任务后开奖提醒");
    imageviews.contentMode = UIViewContentModeScaleToFill;
    [backview addSubview:imageviews];
    [imageviews mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(backview);
    }];
    
    time = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255, 255, 255) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentCenter Text:@"距离第 XX 期新手任务开奖日还剩"];
    [imageviews addSubview:time];
    [time mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.mas_equalTo(imageviews);
        make.top.mas_equalTo(imageviews).with.offset(LENGTH(233));
    }];
    
    stime = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255, 255, 255) LabelFont:TextFont(70) TextAlignment:NSTextAlignmentCenter Text:@"6"];
    stime.layer.cornerRadius = LENGTH(50);
    stime.layer.masksToBounds = YES;
    stime.layer.borderWidth = LENGTH(4);
    stime.layer.borderColor = RGB(255, 255, 255).CGColor;
    stime.layer.shadowColor = RGB(255,91,40).CGColor;
    stime.layer.shadowOffset = CGSizeMake(0,6);//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
    stime.layer.shadowRadius = 8;
    stime.layer.shadowOpacity = 0.2;
    [imageviews addSubview:stime];
    [stime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.and.height.mas_equalTo(LENGTH(100));
        make.centerX.mas_equalTo(imageviews);
        make.top.mas_equalTo(self->time.mas_bottom).with.offset(LENGTH(13));
    }];
    
    BaseLabel * day = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255, 255, 255) LabelFont:TextFont(18) TextAlignment:NSTextAlignmentLeft Text:@"天"];
    [imageviews addSubview:day];
    [day mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->stime.mas_right);
        make.top.mas_equalTo(self->stime.mas_bottom).with.offset(-LENGTH(20));
    }];
    
    

    
    jindu = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(154,77,26) LabelFont:TextFont(17) TextAlignment:NSTextAlignmentCenter Text:@"恭喜你已经完成了新手任务\n开奖前一周会通知你，请关注消息！"];
    jindu.numberOfLines = 2;
    [imageviews addSubview:jindu];
    [jindu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(day.mas_bottom).with.offset(LENGTH(26));
        make.left.and.right.mas_equalTo(imageviews);
    }];
    
    clickview = [UIView new];
    clickview.backgroundColor = RGB(255,91,40);
    clickview.layer.cornerRadius = LENGTH(22);
    clickview.layer.masksToBounds = YES;
    [self addSubview:clickview];
    [clickview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->jindu.mas_bottom);
        make.centerX.mas_equalTo(imageviews);
        make.height.mas_equalTo(LENGTH(44));
        make.bottom.mas_equalTo(imageviews).with.offset(-LENGTH(20));
    }];
    
    BaseLabel * ck = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255, 255, 255) LabelFont:TextFont(19) TextAlignment:NSTextAlignmentLeft Text:@"查看我的成绩"];
    [clickview addSubview:ck];
    [ck mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.bottom.mas_equalTo(self->clickview);
        make.left.mas_equalTo(self->clickview).with.offset(LENGTH(29));
    }];
    
    UIImageView * jiantou = [UIImageView new];
    jiantou.contentMode = UIViewContentModeScaleAspectFit;
    jiantou.image = UIIMAGE(@"》");
    [self addSubview:jiantou];
    [jiantou mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self->clickview);
        make.left.mas_equalTo(ck.mas_right).with.offset(LENGTH(5));
        make.right.mas_equalTo(self->clickview).with.offset(-LENGTH(27));
        make.width.mas_equalTo(LENGTH(21));
        make.height.mas_equalTo(LENGTH(19));
    }];
    
    
    FLAnimatedImageView * imageview = [FLAnimatedImageView new];
    imageview.contentMode = UIViewContentModeScaleAspectFit;
    imageview.image = UIIMAGE(@"组120");
    [self addSubview:imageview];
    [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws).with.offset(StatusBar+LENGTH(5));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(22));
        make.width.and.height.mas_equalTo(42);
    }];
    
    imageview.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(shanchu)];
    //将手势添加到需要相应的view中去
    [imageview addGestureRecognizer:tap];
    
    ck.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(push)];
    //将手势添加到需要相应的view中去
    [ck addGestureRecognizer:tap1];
}

- (void)shanchu{
    [self removeFromSuperview];
}
- (void)push{
    TAskForViewController * vc = [TAskForViewController new];
    vc.type = @"1";
    vc.missionid = @"1";
    vc.navtitle = @"新手任务";
    [self.nav pushViewController:vc animated:YES];
    [self shanchu];
}
- (void)setModel:(NewHomeModel *)model{
    _model = model;
    time.text = [NSString stringWithFormat:@"距离第 %@ 期新手任务开奖日还剩%@天",model.periods_num,model.remaindDays];
    stime.text = model.remaindDays;
    if ([model.remaindDays integerValue]<=7) {
        jindu.hidden = YES;
        [clickview mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self->stime.mas_bottom).with.offset(LENGTH(26));
        }];
    }
    
}
@end
