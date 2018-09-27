//
//  TZJieGuoViewController.m
//  BoWanJuanForPad
//
//  Created by 杨帅 on 2018/5/28.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "TZJieGuoViewController.h"

@interface TZJieGuoViewController ()<NavDelegate>{
    BaseView * TopView;
    BaseLabel * AllTime;
    FLAnimatedImageView * ImageView;
    BaseLabel * topTitle;
    BaseLabel * OneLabel;
    BaseLabel * TwoLabel;
    BaseLabel * ThreeLabel;
    
    BaseLabel * Allscore;
}

@end

@implementation TZJieGuoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self AddNavtion];
    [self AddView];
    
}
#pragma mark --------------------  导航栏以及代理
- (void)AddNavtion{
    [super AddNavtion];
    WS(ws);
    self.navtive = [[NativeView alloc] initWithLeftImage:@"home-Click" Title:@"挑战结果" RightTitle:@"" NativeStyle:NavStyleGeneral];
    self.navtive.delegate = self;
    self.navtive.backgroundColor = RGB(85,137,230);
    [self.view addSubview:self.navtive];
    [ws.navtive mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.top.equalTo(ws.view).with.offset(0);
        make.height.mas_equalTo(NavHeight);
    }];
}


- (void)NavCenterClick {
    
}

- (void)NavLeftClick {
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    }
    NSInteger i = 0;
    switch (_style) {
        case DTBookStyle:
            i = 2;
            break;
        case DTXunZhangStyle:
            i = 3;
            break;
        default:
            break;
    }
    UIViewController *controller = self.navigationController.viewControllers[self.navigationController.viewControllers.count-1-i];
    [self.navigationController popToViewController:controller animated:YES];
    
}

- (void)NavRightClick {
    
}

#pragma mark --------------------  添加视图
- (void)AddView{
    WS(ws);
    TopView = [BaseView new];
    TopView.backgroundColor = RGB(85,137,230);
    [self.view addSubview:TopView];
    
    [TopView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws.navtive.mas_bottom);
        make.left.mas_equalTo(ws.view);
        make.right.mas_equalTo(ws.view);
        make.height.mas_equalTo(LENGTH(440)-44);
    }];
    FLAnimatedImageView * leftImage = [FLAnimatedImageView new];
    leftImage.backgroundColor = RANDOMCOLOR;
    [TopView addSubview:leftImage];
    [leftImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->TopView.mas_top).with.offset(LENGTH(50));
        make.left.mas_equalTo(self->TopView.mas_left).with.offset(LENGTH(50));
        make.height.mas_equalTo(LENGTH(20));
        make.width.mas_equalTo(LENGTH(20));
    }];
    
    BaseLabel * Time = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255, 255, 255) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentLeft Text:@"用时："];
    [TopView addSubview:Time];
    [Time mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(leftImage.mas_centerY);
        make.left.mas_equalTo(leftImage.mas_right).with.offset(LENGTH(10));
    }];
    
    AllTime = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255, 255, 255) LabelFont:TextFont(16) TextAlignment:NSTextAlignmentLeft Text:@"00:00"];
    [TopView addSubview:AllTime];
    [AllTime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(leftImage.mas_centerY);
        make.left.mas_equalTo(Time.mas_right).with.offset(LENGTH(10));
    }];
    
    ImageView = [FLAnimatedImageView new];
    ImageView.backgroundColor = [UIColor whiteColor];
    ImageView.layer.masksToBounds = YES;
    ImageView.layer.cornerRadius = LENGTH(60);
    [TopView addSubview:ImageView];
    [ImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self->TopView);
        make.top.mas_equalTo(leftImage.mas_bottom).with.offset(LENGTH(44));
        make.width.mas_equalTo(LENGTH(120));
        make.height.mas_equalTo(LENGTH(120));

    }];
    
    topTitle = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255, 255, 255) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentLeft Text:@"恭喜你点亮了人文勋章！"];
    [TopView addSubview:topTitle];
    [topTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self->TopView);
        make.top.mas_equalTo(self->ImageView.mas_bottom).with.offset(LENGTH(54));
    }];
    
    Allscore = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(23) TextAlignment:NSTextAlignmentCenter Text:@"总得分：9999999999"];
    [self.view addSubview:Allscore];
    [Allscore mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->TopView.mas_bottom).with.offset(LENGTH(40));
        make.centerX.mas_equalTo(ws.view);
    }];
    
    
    
    OneLabel = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(11,78,86) LabelFont:TextFont(20) TextAlignment:NSTextAlignmentLeft Text:@"0"];
    [self.view addSubview:OneLabel];
    [OneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->Allscore.mas_bottom).with.offset(LENGTH(42));
        make.centerX.mas_equalTo(ws.view);
    }];
    NSString * book = @"人文勋章";
    NSString * all = @"10";
    NSString * dadui = @"5";
    NSString * onetextstr = [NSString stringWithFormat:@"“%@”挑战答题中,共 %@ 道题 答对 %@ 道题",book,all,dadui];
    AttributedStringModel * model = [AttributedStringModel new];
    model.textString = onetextstr;
    model.bianString = all;
    model.fount = 25;
    AttributedStringModel * model1 = [AttributedStringModel new];
    model1.textString = onetextstr;
    model1.bianString = dadui;
    model1.fount = 25;
    NSArray * modelarray = @[model,model1];
    NSMutableAttributedString *AttributedStr = [BaseObject Attributed:modelarray];
    OneLabel.attributedText = AttributedStr;
    
    
    TwoLabel = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(11,78,86) LabelFont:TextFont(20) TextAlignment:NSTextAlignmentLeft Text:@"0"];
    [self.view addSubview:TwoLabel];
    [TwoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(ws.view);
        make.top.mas_equalTo(self->OneLabel.mas_bottom).with.offset(LENGTH(36));
    }];
    
    NSString * zhengquelv = @"80分";
    NSString * twistr = [NSString stringWithFormat:@"得分：%@",zhengquelv];
    AttributedStringModel * model3 = [AttributedStringModel new];
    model3.textString = twistr;
    model3.bianString = zhengquelv;
    model3.fount = 25;
    NSArray * modelarrays = @[model3];
    NSMutableAttributedString *AttributedStr1 = [BaseObject Attributed:modelarrays];
    TwoLabel.attributedText = AttributedStr1;
    
    ThreeLabel = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(11,78,86) LabelFont:TextFont(20) TextAlignment:NSTextAlignmentLeft Text:@"0"];
    [self.view addSubview:ThreeLabel];
    [ThreeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(ws.view);
        make.top.mas_equalTo(self->TwoLabel.mas_bottom).with.offset(LENGTH(36));
    }];
    
    NSString * jiefen = @"20分";
    NSString * threestr = [NSString stringWithFormat:@"阅读用时30s 获得加分：%@",jiefen];
    AttributedStringModel * model4 = [AttributedStringModel new];
    model4.textString = threestr;
    model4.bianString = jiefen;
    model4.fount = 25;
    NSArray * modelarrayss = @[model4];
    NSMutableAttributedString *AttributedStr2 = [BaseObject Attributed:modelarrayss];
    ThreeLabel.attributedText = AttributedStr2;

    BaseLabel * Confirm = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255, 255, 255) LabelFont:TextFont(18) TextAlignment:NSTextAlignmentCenter Text:@"查看错题"];
    Confirm.backgroundColor = RGB(98,132,234);
    Confirm.layer.masksToBounds = YES;
    Confirm.layer.cornerRadius = LENGTH(25);
    Confirm.userInteractionEnabled = YES;
    [self.view addSubview:Confirm];
    
    [Confirm mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->ThreeLabel.mas_bottom).with.offset(LENGTH(64));
        make.centerX.mas_equalTo(ws.view);
        make.width.mas_equalTo(LENGTH(190));
        make.height.mas_equalTo(LENGTH(50));
    }];
    
    //添加手势
    UITapGestureRecognizer * tapGesture1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture1)];
    //将手势添加到需要相应的view中去
    [Confirm addGestureRecognizer:tapGesture1];
}
- (void)tapGesture1{
//    ChaKanCuoTiViewController * vc = [ChaKanCuoTiViewController new];
//    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
