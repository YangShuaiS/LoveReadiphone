//
//  MyTopView.m
//  BoWanJuanForPad
//
//  Created by 杨帅 on 2018/5/28.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "MyTopView.h"
#import "AchievementReportViewController.h"
#import "MyClassViewController.h"

#import "PersonalViewController.h"//个人中心
#import "MyMessageViewController.h"
@implementation MyTopView{
    FLAnimatedImageView * imageView;
    BaseLabel * name;
    BaseLabel * banji;
    BaseView * byview;
    BaseLabel * BiaoYang;
    FLAnimatedImageView * biaoyangimage;
    BaseLabel * BiaoYnagShu;
    BaseView * CJBB;
    BaseLabel * ChengjiuBaoBiao;
    BaseLabel * YDFJ;
    BaseLabel * YDJF;
    BaseLabel * BJPM;
    
    BaseLabel * TongZhi;//通知个数

    BaseLabel * titleLable;//
}

-(instancetype)init{
    self = [super init];
    if (self) {
        self.backgroundColor = MAINCOLOR;
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    WS(ws);
    
    titleLable = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0xff, 0xfe, 0xfe) LabelFont:TextFont(20) TextAlignment:NSTextAlignmentCenter Text:@"我的"];
    [self addSubview:titleLable];
    [titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws.mas_top);
        make.height.mas_equalTo(@44);
        make.width.mas_equalTo(@200);
        make.centerX.mas_equalTo(ws);
    }];
    
    
    imageView = [FLAnimatedImageView new];
    imageView.userInteractionEnabled = YES;
    imageView.layer.masksToBounds = YES;
    imageView.layer.cornerRadius = LENGTH(35);
    [self addSubview:imageView];
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws).with.offset(LENGTH(15));
        make.top.mas_equalTo(self->titleLable.mas_bottom).with.offset(LENGTH(5.5));
        make.width.mas_equalTo(LENGTH(70));
        make.height.mas_equalTo(LENGTH(70));
    }];
    
    UITapGestureRecognizer * tapGestur = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestur)];
    //将手势添加到需要相应的view中去
    [imageView addGestureRecognizer:tapGestur];
    
    name = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255, 255, 255) LabelFont:TextFont(20) TextAlignment:NSTextAlignmentLeft Text:@""];
    [self addSubview:name];
    [name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->imageView.mas_top).with.offset(LENGTH(11));
        make.left.equalTo(self->imageView.mas_right).with.offset(LENGTH(10));
    }];

    banji = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255, 255, 255) LabelFont:TextFont(13) TextAlignment:NSTextAlignmentLeft Text:@""];
    [self addSubview:banji];
    [banji mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->name.mas_bottom).with.offset(LENGTH(5));
        make.left.equalTo(self->imageView.mas_right).with.offset(LENGTH(10));
    }];
    
    byview = [BaseView new];
    byview.backgroundColor = RGB(16,144,139);
    byview.layer.masksToBounds = YES;
    [self addSubview:byview];
    [byview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self->name.mas_centerY);
        make.left.equalTo(self->name.mas_right).with.offset(LENGTH(6));
//        make.width.mas_equalTo(LENGTH(60));
        make.height.mas_equalTo(LENGTH(20));
    }];
    
    BiaoYang = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255, 255, 255) LabelFont:TextFont(11) TextAlignment:NSTextAlignmentLeft Text:@""];
    [byview addSubview:BiaoYang];
    [BiaoYang mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->byview.mas_top).with.offset(LENGTH(2));
        make.left.equalTo(self->byview.mas_left).with.offset(LENGTH(8));
        make.right.equalTo(self->byview.mas_right).with.offset(-LENGTH(8));
        make.bottom.equalTo(self->byview.mas_bottom).with.offset(-LENGTH(2));
    }];

//    biaoyangimage = [FLAnimatedImageView new];
//    biaoyangimage.image = UIIMAGE(@"icon_我的_小红花");
////    biaoyangimage.backgroundColor = RANDOMCOLOR;
//    [self addSubview:biaoyangimage];
//    [biaoyangimage mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.equalTo(self->byview.mas_right).with.offset(-LENGTH(10));
//        make.top.equalTo(self->byview.mas_top).with.offset(-LENGTH(6));
//        make.width.mas_equalTo(LENGTH(13));
//        make.height.mas_equalTo(LENGTH(15));
//    }];
    
    
//    BiaoYnagShu = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(251,110,99) LabelFont:TextFont(11) TextAlignment:NSTextAlignmentLeft Text:@""];
//    [self addSubview:BiaoYnagShu];
//    [BiaoYnagShu mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self->biaoyangimage.mas_right).with.offset(LENGTH(2));
//        make.top.equalTo(self->byview.mas_top).with.offset(-LENGTH(6));
//    }];
//
    
    CJBB = [BaseView new];
    CJBB.backgroundColor = RGBA(255, 255, 255, 0.7);
    CJBB.layer.masksToBounds = YES;
    [self addSubview:CJBB];
    [CJBB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(LENGTH(22)+NavHeight-StatusBar);
        make.right.equalTo(ws).with.offset(-LENGTH(12.5));
        
//        make.width.mas_equalTo(LENGTH(72));
//        make.height.mas_equalTo(LENGTH(23));
    }];
    
    ChengjiuBaoBiao = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(2,144,143) LabelFont:TextFont(14) TextAlignment:NSTextAlignmentCenter Text:@""];
    [CJBB addSubview:ChengjiuBaoBiao];
    [ChengjiuBaoBiao mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.mas_equalTo(self->CJBB);
        make.left.mas_equalTo(self->CJBB).with.offset(LENGTH(13));
        make.right.mas_equalTo(self->CJBB).with.offset(-LENGTH(13));
        make.top.mas_equalTo(self->CJBB).with.offset(LENGTH(6));
        make.bottom.mas_equalTo(self->CJBB).with.offset(-LENGTH(6));


    }];
    
    UITapGestureRecognizer * tapGesture1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture1)];
    //将手势添加到需要相应的view中去
    [CJBB addGestureRecognizer:tapGesture1];
    
    
    FLAnimatedImageView * CJBBtz = [FLAnimatedImageView new];
    CJBBtz.image = UIIMAGE(@"icon_我的_消息");
    [self addSubview:CJBBtz];
    [CJBBtz mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(ws.mas_right).with.offset(-LENGTH(14));
        make.centerY.equalTo(self->titleLable.mas_centerY);
        make.width.mas_equalTo(LENGTH(25));
        make.height.mas_equalTo(LENGTH(17.5));
    }];
    
    TongZhi = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255,255,255) LabelFont:TextFont(7.5) TextAlignment:NSTextAlignmentCenter Text:@""];
    TongZhi.backgroundColor = RGB(251,110,99);
    TongZhi.layer.masksToBounds = YES;
    TongZhi.layer.cornerRadius = LENGTH(6);
    TongZhi.layer.borderColor = WhitColor.CGColor;
    TongZhi.layer.borderWidth = LENGTH(1);
    [self addSubview:TongZhi];
    [TongZhi mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(CJBBtz.mas_right).with.offset(-LENGTH(10));
        make.top.mas_equalTo(CJBBtz.mas_top).with.offset(-LENGTH(7));
        make.width.mas_equalTo(LENGTH(15));
        make.height.mas_equalTo(LENGTH(12));
    }];
    CJBBtz.userInteractionEnabled = YES;
    UITapGestureRecognizer * tapGesture3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture3)];
    //将手势添加到需要相应的view中去
    [CJBBtz addGestureRecognizer:tapGesture3];
    
    
    BaseLabel * tdfj = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255, 255, 255) LabelFont:TextFont(13) TextAlignment:NSTextAlignmentCenter Text:@"等级"];
    [self addSubview:tdfj];
    
    BaseLabel * tdjf = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255, 255, 255) LabelFont:TextFont(13) TextAlignment:NSTextAlignmentCenter Text:@"积分"];
    [self addSubview:tdjf];
    
    BaseLabel * ydjf = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255, 255, 255) LabelFont:TextFont(13) TextAlignment:NSTextAlignmentCenter Text:@"班级排名"];
    ydjf.userInteractionEnabled = YES;
    [self addSubview:ydjf];
    
    UITapGestureRecognizer * tapGesture2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture2)];
    //将手势添加到需要相应的view中去
    [ydjf addGestureRecognizer:tapGesture2];
    
    
    YDFJ = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255, 255, 255) LabelFont:TextFont(12) TextAlignment:NSTextAlignmentCenter Text:@""];
    [self addSubview:YDFJ];
    
    YDJF = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255, 255, 255) LabelFont:TextFont(12) TextAlignment:NSTextAlignmentCenter Text:@""];
    [self addSubview:YDJF];
    
    BJPM = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255, 255, 255) LabelFont:TextFont(12) TextAlignment:NSTextAlignmentCenter Text:@""];
    [self addSubview:BJPM];
    
    [tdfj mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->imageView.mas_bottom).with.offset(LENGTH(12));
        make.left.equalTo(ws).with.offset(0);
        make.width.mas_equalTo(tdjf.mas_width);
    }];
    
    [YDFJ mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(tdfj.mas_bottom).with.offset(LENGTH(4));
        make.centerX.mas_equalTo(tdfj.mas_centerX);
    }];
    

    [tdjf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(tdfj.mas_centerY);
        make.left.equalTo(tdfj.mas_right).with.offset(0);
        make.width.mas_equalTo(ydjf.mas_width);
    }];
    [YDJF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(tdjf.mas_bottom).with.offset(LENGTH(4));
        make.centerX.mas_equalTo(tdjf.mas_centerX);
    }];

    [ydjf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(tdfj.mas_centerY);
        make.left.equalTo(tdjf.mas_right).with.offset(0);
        make.right.mas_equalTo(ws);
        make.width.mas_equalTo(tdfj.mas_width);
    }];
    [BJPM mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ydjf.mas_bottom).with.offset(LENGTH(4));
        make.centerX.mas_equalTo(ydjf.mas_centerX);
        make.bottom.mas_equalTo(ws).with.offset(-LENGTH(15));
    }];
    
}
- (void)setModel:(MyUserInfo *)model{
    _model = model;
    name.text = model.name;
    banji.text = [NSString stringWithFormat:@"%@%@",model.grade[@"name"],model.clazz[@"name"]];
    BiaoYang.text = [NSString stringWithFormat:@"表扬 %@",model.praiseNum];
    UIImage * img;
    if (model.sex == 1) {
        img = UIIMAGE(ZHANWEITUTXN);
    }else{
        img = UIIMAGE(ZHANWEITUTXV);
    }
    [imageView sd_setImageWithURL:URLIMAGE(model.avatar) placeholderImage:img];
    [byview layoutIfNeeded];
    byview.layer.cornerRadius = byview.frame.size.height/2;
//    BiaoYnagShu.text = @"+99";
    ChengjiuBaoBiao.text = @"我的成就";
    [CJBB layoutIfNeeded];
    CJBB.layer.cornerRadius = CJBB.frame.size.height/2;
    YDFJ.text = [NSString stringWithFormat:@"Lv %@",model.level];
    YDJF.text = model.score;
    BJPM.text = model.myRank;
    if ([model.messageNum isEqualToString:@"0"]) {
        TongZhi.hidden = YES;
        TongZhi.text = model.messageNum;
    }else{
        TongZhi.hidden = NO;
        TongZhi.text = model.messageNum;
    }

}

#pragma mark----------------------view跳转
-(void)tapGesture1{
    AchievementReportViewController * vc = [AchievementReportViewController new];
    [self.nav pushViewController:vc animated:YES];
}

- (void)tapGesture2{
    MyClassViewController * vc = [MyClassViewController new];
    [self.nav pushViewController:vc animated:YES];
}

- (void)tapGestur{
    //头像
    PersonalViewController *  vc = [PersonalViewController new];
    [self.nav pushViewController:vc animated:YES];
}
//通知
- (void)tapGesture3{
    MyMessageViewController *  vc = [MyMessageViewController new];
    [self.nav pushViewController:vc animated:YES];
}
@end
