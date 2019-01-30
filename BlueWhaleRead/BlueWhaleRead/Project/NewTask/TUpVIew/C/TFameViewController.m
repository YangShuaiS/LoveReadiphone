//
//  TFameViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/30.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "TFameViewController.h"
#import "TKJMenu.h"
#import "TPHBViewController.h"
@interface TFameViewController ()<NavDelegate>

@end

@implementation TFameViewController
#pragma mark --------------------  导航栏以及代理
- (void)AddNavtion{
    [super AddNavtion];
    WS(ws);
    self.navtive = [[NativeView alloc] initWithLeftImage:@"backhei" Title:@"名人堂" RightTitle:@"" NativeStyle:NavStyleGeneral];
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
    self.view.backgroundColor = [UIColor whiteColor];
    [self AddNavtion];
    WS(ws);
    TKJMenu * homeMenu = [TKJMenu new];
    homeMenu.titarray = @[@"实时",@"往期"];
    [self.view addSubview:homeMenu];
    [homeMenu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(LENGTH(20));
        make.right.equalTo(ws.view).with.offset(-LENGTH(20));
        make.top.equalTo(ws.navtive.mas_bottom).with.offset(LENGTH(2));
        make.bottom.mas_equalTo(ws.view).with.offset(LENGTH(5));
    }];
    NSMutableArray *childVC = [[NSMutableArray alloc] init];
    TPHBViewController * hotview = [[TPHBViewController alloc] init];
    //    hotview.bookCase = BookCaseStyleSJWD;
    hotview.missionid = _missionid;
    hotview.type = @"1";
    [self addChildViewController:hotview];
    [childVC addObject:hotview];
    
    TPHBViewController * hotview1 = [[TPHBViewController alloc] init];
    //    hotview.bookCase = BookCaseStyleSJWD;
    hotview1.missionid = _missionid;
    hotview1.type = @"2";
    [self addChildViewController:hotview1];
    [childVC addObject:hotview1];
    homeMenu.controllerArray = childVC;
    
    [hotview setBlock:^{
        
    }];
    [hotview1 setBlock:^{
        
    }];
    // Do any additional setup after loading the view.
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
