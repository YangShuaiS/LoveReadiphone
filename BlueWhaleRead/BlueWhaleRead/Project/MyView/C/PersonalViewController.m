//
//  PersonalViewController.m
//  BoWanJuanForPad
//
//  Created by 杨帅 on 2018/6/5.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "PersonalViewController.h"
#import "PersonalTableView.h"
@interface PersonalViewController ()<NavDelegate>
@property (strong, nonatomic) PersonalTableView *tableView;

@end

@implementation PersonalViewController{
    MyDeModel * model;
    MyZiLiaoModel * userModel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self AddNavtion];
    [self LoadData];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(denglu:) name:kNotificationGengHuanPhone object:nil];

}
- (void)denglu:(NSNotification *)text{
    [self LoadData];

}
#pragma mark --------------------  导航栏以及代理
- (void)AddNavtion{
    [super AddNavtion];
    WS(ws);
    self.navtive = [[NativeView alloc] initWithLeftImage:@"backhei" Title:@"个人资料 " RightTitle:@"" NativeStyle:NavStyleGeneral];
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
- (void)LoadData{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_MYDEXINXI];
    NSDictionary * dic = @{@"studentid":Me.ssid};
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            self->model = [MyDeModel mj_objectWithKeyValues:responseObject];
            if ([self->model.code isEqual:@200]) {
                self->userModel = [MyZiLiaoModel mj_objectWithKeyValues:responseObject[@"user"]];
                [self Addview];
            }else if ([self->model.code isEqual:@Notloggedin]){
                [self UpDengLu];
            }
        }else{
            
        }
    }];
}
- (void)Addview{
    WS(ws);
    self.view.backgroundColor = [UIColor whiteColor];
    if (_tableView == nil) {
        _tableView = [PersonalTableView new];
        _tableView.vc = self;
        _tableView.nav = self.navigationController;
        _tableView.baseview = self.view;
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(ws.navtive.mas_bottom).with.offset(1);
            make.left.equalTo(ws.view).with.offset(0);
            make.right.equalTo(ws.view).with.offset(0);
            make.bottom.equalTo(ws.view).with.offset(0);
        }];
    }
    self->_tableView.model = self->userModel;

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
