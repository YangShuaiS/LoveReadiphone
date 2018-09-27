//
//  AboutViewController.m
//  BoWanJuanForPad
//
//  Created by 杨帅 on 2018/6/6.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController ()<NavDelegate,UIScrollViewDelegate>

@end

@implementation AboutViewController{
    UIScrollView * scrollView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self AddNavtion];
    [self Addview];
}
#pragma mark --------------------  导航栏以及代理
- (void)AddNavtion{
    [super AddNavtion];
    WS(ws);
    self.navtive = [[NativeView alloc] initWithLeftImage:@"icon_返回_粗" Title:@"关于天天爱读" RightTitle:@"" NativeStyle:NavStyleGeneral];
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
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)NavCenterClick {
    
}


- (void)NavRightClick {
    
}

- (void)Addview{
    WS(ws);
    scrollView = [UIScrollView new];
    scrollView.backgroundColor = BEIJINGCOLOR;
    scrollView.delegate = self;
    scrollView.userInteractionEnabled = YES;
    [self.view addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws.navtive.mas_bottom);
        make.left.mas_equalTo(ws.view);
        make.right.mas_equalTo(ws.view);
        make.bottom.mas_equalTo(ws.view);
    }];
    
    FLAnimatedImageView * imageView = [FLAnimatedImageView new];
//    imageView.backgroundColor = RGB(90,196,192);
    imageView.image = UIIMAGE(@"天天爱读");
    imageView.layer.masksToBounds = YES;
    imageView.layer.cornerRadius = LENGTH(10);
    [scrollView addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(ws.view);
        make.top.mas_equalTo(self->scrollView.mas_top).with.offset(LENGTH(40));
        make.width.mas_equalTo(LENGTH(70));
        make.height.mas_equalTo(LENGTH(70));
    }];
    
    BaseLabel * bbh = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(102,102,102) LabelFont:TextFont(13) TextAlignment:NSTextAlignmentCenter Text:BANBENHAO];
    [scrollView addSubview:bbh];
    [bbh mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(LENGTH(24));
        make.right.equalTo(ws.view).with.offset(-LENGTH(24));
        make.top.equalTo(imageView.mas_bottom).with.offset(LENGTH(5));
        make.centerX.mas_equalTo(ws.view);
    }];
    
    NSString * str = @"    天天爱读是一款面向全国小学生的阅读陪伴类移动产品。学生在阅读完喜欢的纸质书籍之后，使用天天爱读扫码回答书籍相关题目，便可以获得积分和勋章，还可以了解同班同学的阅读情况。系统跟踪记录孩子的阅读情况，帮助家长和老师更好地了解孩子对阅读喜好和程度。让孩子养成阅读习惯并爱上阅读，通过读书开拓视野，增长见识，为未来的学习成长打下基础。";
    BaseLabel * title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(102,102,102) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentLeft Text:str];
    title.numberOfLines = 0;
    [scrollView addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(LENGTH(24));
        make.right.equalTo(ws.view).with.offset(-LENGTH(24));
        make.top.equalTo(bbh.mas_bottom).with.offset(LENGTH(20));
        make.bottom.equalTo(self->scrollView.mas_bottom).with.offset(-LENGTH(20));
    }];
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
