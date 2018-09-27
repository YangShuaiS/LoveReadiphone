//
//  MyMessageViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/7.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "MyMessageViewController.h"
#import "MyMessageTableView.h"
@interface MyMessageViewController ()<NavDelegate>{
    MyMessageTableView * tableView;
}

@end

@implementation MyMessageViewController
#pragma mark --------------------  导航栏以及代理
- (void)AddNavtion{
    [super AddNavtion];
    WS(ws);
    self.navtive = [[NativeView alloc] initWithLeftImage:@"icon_返回_粗" Title:@"消息" RightTitle:@"home-Click" NativeStyle:NavStyleGeneral];
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

- (void)viewDidLoad {
    [super viewDidLoad];
    [self AddNavtion];
    WS(ws);
    self.view.backgroundColor = BEIJINGCOLOR;
    tableView = [MyMessageTableView new];
    tableView.nav = self.navigationController;
    [self.view addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws.navtive.mas_bottom);
        make.left.mas_equalTo(ws.view);
        make.right.mas_equalTo(ws.view);
        make.bottom.mas_equalTo(ws.view);
    }];
    [self LoadData];
}
- (void)LoadData{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_MessageLIST];
    NSDictionary * dic = @{@"studentid":Me.ssid};
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            MyMessageListModel * model = [MyMessageListModel mj_objectWithKeyValues:responseObject];
            if ([model.code isEqual:@200]) {
                [self updata:model];
            }
        }else{
            
        }
    }];
    
}
- (void)updata:(MyMessageListModel *)model{
    tableView.itemarray = model.studentMessageList;
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
