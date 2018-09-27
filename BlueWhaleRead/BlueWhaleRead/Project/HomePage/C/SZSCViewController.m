//
//  SZSCViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/5.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "SZSCViewController.h"
#import "SZOrSCViewController.h"
#import "BeiJingView.h"
@interface SZSCViewController ()<NavDelegate>

@end

@implementation SZSCViewController{
    BaseView * tiMu;
    BaseLabel * titles;
    CAShapeLayer *border;
    
    FLAnimatedImageView *RJOrFanHuiBookCity;


}
- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    border.cornerRadius = LENGTH(10);
    //虚线的颜色
    border.strokeColor = [UIColor whiteColor].CGColor;
    //填充的颜色
    border.fillColor = [UIColor clearColor].CGColor;
    
    //设置路径
    //    border.path = [UIBezierPath bezierPathWithRect:self.bounds].CGPath;
    border.path = [UIBezierPath bezierPathWithRoundedRect:tiMu.bounds cornerRadius:LENGTH(20)].CGPath;
    
    border.frame = tiMu.bounds;
    //虚线的宽度
    border.lineWidth = 1.f;
    
    //设置线条的样式
    //    border.lineCap = @"square";
    //虚线的间隔
    border.lineDashPattern = @[@4, @2];
    
    [tiMu.layer addSublayer:border];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    WS(ws);
    BeiJingView * backImageView = [BeiJingView new];
    [self.view addSubview:backImageView];
    [backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws.view);
    }];

    
    [self AddNavtion];
    [self AddView];

}
#pragma mark --------------------  导航栏以及代理
- (void)AddNavtion{
    [super AddNavtion];
    WS(ws);
    self.navtive = [[NativeView alloc] initWithLeftImage:@"icon_返回_粗" Title:_titles RightTitle:@"" NativeStyle:NavStyleGeneral];
    self.navtive.backgroundColor = [UIColor clearColor];
    self.navtive.delegate = self;
    [self.view addSubview:self.navtive];
    [ws.navtive mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.top.equalTo(ws.view).with.offset(0);
        make.height.mas_equalTo(NavHeight);
    }];
    
}
- (void)NavLeftClick{
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    }
    [self.navigationController popToRootViewControllerAnimated:YES];
}
- (void)AddView{
    WS(ws);
    border = [CAShapeLayer layer];
    tiMu = [BaseView new];
    tiMu.layer.masksToBounds = YES;
    tiMu.layer.cornerRadius = LENGTH(10);
    tiMu.backgroundColor = RGB(32,186,242);
    [self.view addSubview:tiMu];
    [tiMu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.view).with.offset(LENGTH(41)+NavHeight);
        make.left.equalTo(ws.view).with.offset(LENGTH(15));
        make.right.equalTo(ws.view ).with.offset(-LENGTH(15));
    }];
    NSString * str = @"";
    if ([_titles isEqualToString:@"识字量检测"]) {
        str = @"下面，你要进行识字量测试\n一共50个字，请按顺序回答\n测试没有时间限制\n你需将50个字全部答完并“提交答案”\n你的识字量测试结果可到“我的”中查看";
    }else if ([_titles isEqualToString:@"识词量检测"]){
        str = @"下面，你要进行识词量测试\n一共50个词，请按顺序回答\n测试没有时间限制\n你需将50个词全部答完并“提交答案”\n你的识词量测试结果可到“我的”中查看";
    }
    titles = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255, 255, 255) LabelFont:TextFont(20) TextAlignment:NSTextAlignmentCenter Text:str];
    titles.numberOfLines = 0;
    [tiMu addSubview:titles];
    
    [titles mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->tiMu.mas_top).with.offset(LENGTH(34));
        make.right.equalTo(self->tiMu.mas_right).with.offset(-LENGTH(40));
        make.left.equalTo(self->tiMu.mas_left).with.offset(LENGTH(35));
        make.bottom.equalTo(self->tiMu.mas_bottom).with.offset(-LENGTH(34));
    }];
    
    RJOrFanHuiBookCity = [FLAnimatedImageView new];
    RJOrFanHuiBookCity.backgroundColor = RGB(255,154,73);
    RJOrFanHuiBookCity.layer.masksToBounds = YES;
    RJOrFanHuiBookCity.layer.cornerRadius = LENGTH(22);
    RJOrFanHuiBookCity.layer.borderWidth = 2;
    RJOrFanHuiBookCity.layer.borderColor = [UIColor whiteColor].CGColor;
    [self.view addSubview:RJOrFanHuiBookCity];
    [RJOrFanHuiBookCity mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->tiMu.mas_bottom).with.offset(LENGTH(45));
        make.centerX.mas_equalTo(ws.view.mas_centerX);
        make.width.mas_equalTo(LENGTH(185));
        make.height.mas_equalTo(LENGTH(44));
    }];
    
    BaseLabel * Titles = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255,255,255) LabelFont:TextFont(20) TextAlignment:NSTextAlignmentCenter Text:@"开始检测"];
    [RJOrFanHuiBookCity addSubview:Titles];
    [Titles mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self->RJOrFanHuiBookCity );
    }];
    RJOrFanHuiBookCity.userInteractionEnabled = YES;
    //添加手势
    UITapGestureRecognizer * tapGesture2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(BackBookList)];
    //将手势添加到需要相应的view中去
    [RJOrFanHuiBookCity addGestureRecognizer:tapGesture2];
    
}
- (void)BackBookList{
    SZOrSCViewController * vc = [SZOrSCViewController new];
    vc.titles = _titles;
    [self.navigationController pushViewController:vc animated:YES];
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
