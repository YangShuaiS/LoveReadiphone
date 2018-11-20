//
//  DTJieGuoViewController.m
//  BoWanJuanForPad
//
//  Created by 杨帅 on 2018/5/25.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "DTJieGuoViewController.h"
#import "TiaoZHanJieGuoView.h"
#import "ChaKanCuoTiViewController.h"

#import "BookCityViewController.h"

#import "BookListViewController.h"

#import "DtJieGuoTopView.h"//答题结果上面

@interface DTJieGuoViewController ()<NavDelegate>
@end

@implementation DTJieGuoViewController{
    DtJieGuoTopView * TopView;
    FLAnimatedImageView * topImageView;
    
    
    BaseLabel * AllTime;
    BaseLabel * AllJiFen;
    TiaoZHanJieGuoView * TZJG;
    BaseLabel * OneLabel;
    BaseLabel * TwoLabel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGB(255, 255, 255);
    [self AddView];
//    [self LoadData];

    // Do any additional setup after loading the view.
}
//- (void)LoadData{
//    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_TJTIDAAN];
//    [[BaseAppRequestManager manager] getNormaldataURL:url dic:nil andBlock:^(id responseObject, NSError *error) {
//        if (responseObject) {
//            TKJIEGUOMODEL * model = [TKJIEGUOMODEL mj_objectWithKeyValues:responseObject];
//            if ([model.code isEqual:@200]) {
//                [self UpData:model];
//            }
//
//
//        }else{
//
//        }
//    }];
//}

//- (void)UpData:(TKJIEGUOMODEL *)model{
//
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)NavLeftClick {
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }

//
//    NSInteger i = 0;
//    switch (_style) {
//        case DTBookStyle:
//            i = 2;
//            break;
//        case DTXunZhangStyle:
//            i = 3;
//            break;
//        default:
//            break;
//    }
//    NSArray * contarray = self.navigationController.viewControllers;
//        for (int i =0; i < contarray.count; i++) {
//            UIViewController *controller = contarray[i];
//            if ([controller isKindOfClass:[BookListViewController class]]) {
//                [self.navigationController popToViewController:controller animated:YES];
//                break;
//            }
//    }

//    BookListViewController * vc = [BookListViewController new];
//    [self.navigationController pushViewController:vc animated:YES];
}
#pragma mark --------------------  导航栏以及代理
- (void)addtitle{
    
    WS(ws);
    BaseLabel * title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255, 255, 255) LabelFont:TextFont(20) TextAlignment:NSTextAlignmentCenter Text:@"答题结果"];
    [self.view addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(ws.view);
        make.top.mas_equalTo(ws.view).with.offset(StatusBar+8);
    }];

}
#pragma mark --------------------  添加视图
- (void)AddView{
    WS(ws);
//    DTJieGuoModel * model = [DTJieGuoModel new];
//    model.have = _model.challengeTime;
//    model.style = _model.isPassed;
    TopView = [DtJieGuoTopView new];
    TopView.nav = self.navigationController;
    TopView.bookfenshu = _bookfenshu;
    TopView.secont = _secont;
    TopView.cuotiarray = _timuarray;
    TopView.nav = self.navigationController;
    TopView.models = _model;
    [self.view addSubview:TopView];
    [TopView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws.view);
    }];
    
    [self addtitle];
    
    if (_model.newCompleted == 1) {
        WS(ws);
        GenPopViewModel * m = [GenPopViewModel new];
        m.imageurl = _model.badgeMinLogo;
        GeneralUpView * genView = [GeneralUpView new];
        genView.style = PopUpViewStyleMedalcomplete;
        genView.model = m;
        [self.view addSubview:genView];
        [genView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(ws.view);
        }];
    }else{
        
    }

//    TopView.model = model;
//    FLAnimatedImageView * leftImage = [FLAnimatedImageView new];
//    leftImage.backgroundColor = RANDOMCOLOR;
//    [self.view addSubview:leftImage];
//    [leftImage mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(self->TopView.mas_top).with.offset(LENGTH(50));
//        make.left.mas_equalTo(ws.view).with.offset(LENGTH(50));
//        make.height.mas_equalTo(LENGTH(20));
//        make.width.mas_equalTo(LENGTH(20));
//    }];
//
//    BaseLabel * Time = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255, 255, 255) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentLeft Text:@"用时："];
//    [self.view addSubview:Time];
//    [Time mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.mas_equalTo(leftImage.mas_centerY);
//        make.left.mas_equalTo(leftImage.mas_right).with.offset(LENGTH(10));
//    }];
//
//    AllTime = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255, 255, 255) LabelFont:TextFont(16) TextAlignment:NSTextAlignmentLeft Text:@"00:00"];
//    [self.view addSubview:AllTime];
//    [AllTime mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.mas_equalTo(leftImage.mas_centerY);
//        make.left.mas_equalTo(Time.mas_right).with.offset(LENGTH(10));
//    }];
//
//    AllJiFen = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255, 255, 255) LabelFont:TextFont(16) TextAlignment:NSTextAlignmentLeft Text:@"100"];
//    [self.view addSubview:AllJiFen];
//    [AllJiFen mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.mas_equalTo(leftImage.mas_centerY);
//        make.right.mas_equalTo(ws.view).with.offset(-LENGTH(50));
//    }];
//
//    BaseLabel * JiFen = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255, 255, 255) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentLeft Text:@"获得积分："];
//    [self.view addSubview:JiFen];
//    [JiFen mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.mas_equalTo(leftImage.mas_centerY);
//        make.right.mas_equalTo(self->AllJiFen.mas_left).with.offset(-LENGTH(10));
//    }];
//
//    FLAnimatedImageView * rightImage = [FLAnimatedImageView new];
//    rightImage.backgroundColor = RANDOMCOLOR;
//    [self.view addSubview:rightImage];
//    [rightImage mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.mas_equalTo(leftImage.mas_centerY);
//        make.right.mas_equalTo(JiFen.mas_left).with.offset(-LENGTH(10));
//        make.height.mas_equalTo(LENGTH(20));
//        make.width.mas_equalTo(LENGTH(20));
//    }];
//
//    TZJG = [TiaoZHanJieGuoView new];
//    [TopView addSubview:TZJG];
//    [TZJG mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.bottom.mas_equalTo(self->TopView.mas_bottom).with.offset(-LENGTH(105));
//        make.centerX.mas_equalTo(self->TopView.mas_centerX);
//        make.width.mas_equalTo(LENGTH(356));
//        make.height.mas_equalTo(LENGTH(242));
//    }];
//
//
//    OneLabel = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(11,78,86) LabelFont:TextFont(20) TextAlignment:NSTextAlignmentLeft Text:@"0"];
//    [self.view addSubview:OneLabel];
//    [OneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(self->TopView.mas_bottom).with.offset(LENGTH(52));
//        make.centerX.mas_equalTo(ws.view);
//    }];
//    NSString * book = @"老人与海";
//    NSString * all = @"10";
//    NSString * dadui = @"5";
//    NSString * onetextstr = [NSString stringWithFormat:@"“%@”挑战答题中,共 %@ 道题 答对 %@ 道题",book,all,dadui];
//    AttributedStringModel * model = [AttributedStringModel new];
//    model.textString = onetextstr;
//    model.bianString = all;
//    model.fount = 25;
//    AttributedStringModel * model1 = [AttributedStringModel new];
//    model1.textString = onetextstr;
//    model1.bianString = dadui;
//    model1.fount = 25;
//    NSArray * modelarray = @[model,model1];
//    NSMutableAttributedString *AttributedStr = [BaseObject Attributed:modelarray];
//    OneLabel.attributedText = AttributedStr;
//
//
//    TwoLabel = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(11,78,86) LabelFont:TextFont(20) TextAlignment:NSTextAlignmentLeft Text:@"0"];
//    [self.view addSubview:TwoLabel];
//    [TwoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.mas_equalTo(ws.view);
//        make.top.mas_equalTo(self->OneLabel.mas_bottom).with.offset(LENGTH(36));
//    }];
//
//    NSString * zhengquelv = @"80%";
//    NSString * twistr = [NSString stringWithFormat:@"正确率：%@",zhengquelv];
//    AttributedStringModel * model3 = [AttributedStringModel new];
//    model3.textString = twistr;
//    model3.bianString = zhengquelv;
//    model3.fount = 25;
//    NSArray * modelarrays = @[model3];
//    NSMutableAttributedString *AttributedStr1 = [BaseObject Attributed:modelarrays];
//    TwoLabel.attributedText = AttributedStr1;
//
//    BaseLabel * Confirm = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255, 255, 255) LabelFont:TextFont(18) TextAlignment:NSTextAlignmentCenter Text:@"查看错题"];
//    Confirm.backgroundColor = RGB(98,132,234);
//    Confirm.layer.masksToBounds = YES;
//    Confirm.layer.cornerRadius = LENGTH(25);
//    Confirm.userInteractionEnabled = YES;
//    [self.view addSubview:Confirm];
//
//    [Confirm mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self->TwoLabel.mas_bottom).with.offset(LENGTH(64));
//        make.centerX.mas_equalTo(ws.view);
//        make.width.mas_equalTo(LENGTH(190));
//        make.height.mas_equalTo(LENGTH(50));
//    }];
//
//    //添加手势
//    UITapGestureRecognizer * tapGesture1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture1)];
//    //将手势添加到需要相应的view中去
//    [Confirm addGestureRecognizer:tapGesture1];
}
- (void)tapGesture1{
    ChaKanCuoTiViewController * vc = [ChaKanCuoTiViewController new];
    vc.style = _style;
    vc.cuotiarray = _timuarray;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)setTimuarray:(NSMutableArray *)timuarray{
    _timuarray = timuarray;
}
- (void)setModel:(TKJIEGUOMODEL *)model{
    _model = model;
}

//-(void)viewDidAppear:(BOOL)animated {
//    [super viewDidAppear:animated];
//    if([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
//        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
//    }
//}
@end
