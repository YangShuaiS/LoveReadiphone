//
//  TKAwardViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/29.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "TKAwardViewController.h"
#import "TKAwardVIew.h"
@interface TKAwardViewController ()<NavDelegate>{
    UIScrollView * scrollView;
    TKAwardVIew * tkview;
}
@end

@implementation TKAwardViewController
#pragma mark --------------------  导航栏以及代理
- (void)AddNavtion{
    [super AddNavtion];
    WS(ws);
    self.navtive = [[NativeView alloc] initWithLeftImage:@"backhei" Title:@"领奖信息" RightTitle:@"" NativeStyle:NavStyleGeneral];
    self.navtive.titcolor = RGB(0, 0, 0);
    self.navtive.delegate = self;
    [self.view addSubview:self.navtive];
    [ws.navtive mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.top.equalTo(ws.view).with.offset(0);
        make.height.mas_equalTo(NavHeight);
    }];
    self.navtive.downlayer = YES;
}
- (void)NavLeftClick{
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)NavCenterClick {
    
}


- (void)NavRightClick {
    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self AddNavtion];
    scrollView = [UIScrollView new];
    scrollView.userInteractionEnabled = YES;
    [self.view addSubview:scrollView];
    WS(ws);
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.navtive.mas_bottom).with.offset(0);
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.bottom.equalTo(ws.view).with.offset(0);
    }];
    
    tkview = [TKAwardVIew new];
    [scrollView addSubview:tkview];
    [tkview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.mas_equalTo(ws.view);
        make.top.and.bottom.mas_equalTo(self->scrollView);
    }];
    tkview.model = _model;

    // Do any additional setup after loading the view.
}
- (void)setModel:(TKATextFileModel *)model{
    _model = model;
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
