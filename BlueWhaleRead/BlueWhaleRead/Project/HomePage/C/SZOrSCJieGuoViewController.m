//
//  SZOrSCJieGuoViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/5.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "SZOrSCJieGuoViewController.h"
#import "SZSCJGView.h"
@interface SZOrSCJieGuoViewController ()<NavDelegate>{
    SZSCJGView * TopView;
}

@end

@implementation SZOrSCJieGuoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self AddView];
}
#pragma mark --------------------  添加视图
- (void)AddView{
    WS(ws);
    self.view.backgroundColor = WhitColor;
    TopView = [SZSCJGView new];
    TopView.nav = self.navigationController;
    TopView.titles = _titles;
    TopView.jg = _jg;
    [self.view addSubview:TopView];
    [TopView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws.view);
    }];
    
    [self addtitle];
    
   
}
- (void)setJg:(NSString *)jg{
    _jg = jg;
}
- (void)BackBookList{
    
}
#pragma mark --------------------  导航栏以及代理
- (void)addtitle{
    
    WS(ws);
    BaseLabel * title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255, 255, 255) LabelFont:TextFont(17) TextAlignment:NSTextAlignmentCenter Text:@"检测结果"];
    [self.view addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(ws.view);
        make.top.mas_equalTo(ws.view).with.offset(StatusBar+14);
    }];
    
}
- (void)setTitles:(NSString *)titles{
    _titles = titles;
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
