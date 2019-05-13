//
//  MyAccountViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/4/25.
//  Copyright © 2019 YS. All rights reserved.
//

#import "MyAccountViewController.h"
#import "MyAccountListView.h"
#import "MyAccountCashcouponView.h"
#import "MyNoAccountListView.h"
@interface MyAccountViewController ()<NavDelegate>

@end

@implementation MyAccountViewController{
    MyAccountListView * MyAccountList;
    MyNoAccountListView * NoView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self AddNavtion];
    WS(ws);
    BaseLabel * leftlabel = [[BaseLabel alloc] initWithTxteColor:RGB(3, 3, 3) LabelFont:TextFontCu(18) TextAlignment:NSTextAlignmentCenter Text:@"订单记录"];
    [self.view addSubview:leftlabel];
    [leftlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws.navtive.mas_bottom).with.offset(LENGTH(15));
        make.centerX.mas_equalTo(ws.view).with.offset(-LENGTH(70));
    }];
    
    UIView * xian = [UIView new];
    xian.backgroundColor = RGB(82,199,198);
    xian.layer.cornerRadius = 1;
    [self.view addSubview:xian];
    [xian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(leftlabel);
        make.top.mas_equalTo(leftlabel.mas_bottom).with.offset(LENGTH(3));
        make.height.mas_equalTo(2);
        make.width.mas_equalTo(LENGTH(42));
    }];
    
    BaseLabel * rightlabel = [[BaseLabel alloc] initWithTxteColor:RGB(3, 3, 3) LabelFont:TextFontCu(18) TextAlignment:NSTextAlignmentCenter Text:@"兑换礼券"];
    [self.view addSubview:rightlabel];
    [rightlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws.navtive.mas_bottom).with.offset(LENGTH(15));
        make.centerX.mas_equalTo(ws.view).with.offset(LENGTH(70));
    }];
    
    MyAccountList = [MyAccountListView new];
    [self.view addSubview:MyAccountList];
    [MyAccountList mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(xian.mas_bottom).with.offset(LENGTH(14));
        make.bottom.mas_equalTo(ws.view).with.offset(-30);
        make.left.mas_equalTo(ws.view).with.offset(LENGTH(17));
        make.right.mas_equalTo(ws.view).with.offset(-LENGTH(17));
    }];
    MyAccountList.hidden = YES;
    
    NoView = [MyNoAccountListView new];
    [self.view addSubview:NoView];
    [NoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(xian.mas_bottom).with.offset(LENGTH(14));
        make.left.and.right.and.bottom.mas_equalTo(ws.view);
    }];
    
    rightlabel.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click)];
    [rightlabel addGestureRecognizer:tap];
    [self LoadData];
    // Do any additional setup after loading the view.
}
#pragma mark --------------------  导航栏以及代理
- (void)AddNavtion{
    [super AddNavtion];
    WS(ws);
    self.navtive = [[NativeView alloc] initWithLeftImage:@"backhei" Title:@"我的账户" RightTitle:@"" NativeStyle:NavStyleGeneral];
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


- (void)click{
    MyAccountCashcouponView * view = [MyAccountCashcouponView new];
    [[UIApplication sharedApplication].delegate.window addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo([UIApplication sharedApplication].delegate.window);
    }];
}


- (void)LoadData{
    
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_MYZHANGHU];
    NSDictionary * dic = @{@"studentid":Me.ssid};
    
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            BuyorderModel * model = [BuyorderModel mj_objectWithKeyValues:responseObject];
            if ([model.code isEqual:@200]) {
                [self UpData:model];
            }else if ([model.code isEqual:@Notloggedin]){
                [self UpDengLu];
            }
        }else{
            
        }
    }];
}

- (void)UpData:(BuyorderModel *)model{
    if ([BaseObject ArratClass:model.myOrder]) {
        if (model.myOrder.count == 0) {
            MyAccountList.hidden = YES;
            NoView.hidden = NO;
        }else{
            MyAccountList.hidden = NO;
            NoView.hidden = YES;
            MyAccountList.itemarray = model.myOrder;
        }
    }
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
