//
//  AgreementViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/5/8.
//  Copyright © 2019 YS. All rights reserved.
//

#import "AgreementViewController.h"
#import <WebKit/WebKit.h>

@interface AgreementViewController ()<NavDelegate>

@end

@implementation AgreementViewController{
    WKWebView *webView;
}
#pragma mark --------------------  导航栏以及代理
- (void)AddNavtion{
    [super AddNavtion];
    WS(ws);
    self.navtive = [[NativeView alloc] initWithLeftImage:@"backhei" Title:_titl RightTitle:@"" NativeStyle:NavStyleGeneral];
    self.navtive.delegate = self;
    self.navtive.titcolor = RGB(31, 31, 31);
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
    self.view.backgroundColor = [UIColor whiteColor];
    WS(ws);
    webView = [WKWebView new];
    [self.view addSubview:webView];
    [webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws.navtive.mas_bottom);
        make.left.and.right.and.bottom.mas_equalTo(ws.view);
    }];
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_url]]];

    // Do any additional setup after loading the view.
}
-(void)setTitl:(NSString *)titl{
    _titl = titl;
}

- (void)setUrl:(NSString *)url{
    _url = url;

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
