//
//  NHMingYanTwoViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/4/15.
//  Copyright © 2019 YS. All rights reserved.
//

#import "NHMingYanTwoViewController.h"
#import "ShouCangTableView.h"

@interface NHMingYanTwoViewController ()<NavDelegate>

@end

@implementation NHMingYanTwoViewController{
    ShouCangTableView * tableview;
}
#pragma mark --------------------  导航栏以及代理
- (void)AddNavtion{
    [super AddNavtion];
    WS(ws);
    self.navtive = [[NativeView alloc] initWithLeftImage:@"backhei" Title:@"格言列表" RightTitle:@"" NativeStyle:NavStyleGeneral];
    self.navtive.titcolor = RGB(0, 0, 0);
    self.navtive.delegate = self;
    [self.view addSubview:self.navtive];
    [ws.navtive mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.top.equalTo(ws.view).with.offset(0);
        make.height.mas_equalTo(NavHeight);
    }];
    self.navtive.backgroundColor = [UIColor clearColor];
    
    //    self.navtive.downlayer = YES;
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
    tableview = [ShouCangTableView new];
    tableview.itemarray = _itemarray;
    [self.view addSubview:tableview];
    [tableview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws.navtive.mas_bottom).with.offset(1);
        make.left.and.right.and.bottom.mas_equalTo(ws.view);
    }];
    [tableview setBlocks:^(NSInteger now) {
        ws.blocks(now);
        [ws.navigationController popViewControllerAnimated:YES];
    }];
}
- (void)setItemarray:(NSMutableArray *)itemarray{
    _itemarray = itemarray;
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
