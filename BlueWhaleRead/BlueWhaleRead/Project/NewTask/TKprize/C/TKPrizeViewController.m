//
//  TKPrizeViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/29.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "TKPrizeViewController.h"
#import "TKPTableView.h"
@interface TKPrizeViewController ()<NavDelegate>
@property (strong, nonatomic) TKPTableView *tableView;

@end

@implementation TKPrizeViewController
#pragma mark --------------------  导航栏以及代理
- (void)AddNavtion{
    [super AddNavtion];
    WS(ws);
    self.navtive = [[NativeView alloc] initWithLeftImage:@"backhei" Title:@"奖品列表" RightTitle:@"" NativeStyle:NavStyleGeneral];
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
    WS(ws);
    _tableView = [TKPTableView new];
    _tableView.nav = self.navigationController;
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws.navtive.mas_bottom);
        make.left.mas_equalTo(ws.view);
        make.right.mas_equalTo(ws.view);
        make.bottom.mas_equalTo(ws.view);
    }];
    [self LoadData];

    // Do any additional setup after loading the view.
}

- (void)LoadData{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_JPLIST];
    NSDictionary * dic = @{@"studentid":Me.ssid,@"missionid":@"1"};
//    NSDictionary * dic = @{@"studentid":@"12",@"missionid":@"1"};
    
    
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            TKPrizeModel * model = [TKPrizeModel mj_objectWithKeyValues:responseObject];
            if ([model.code isEqual:@200]) {
                [self UpData:model];
            }else if ([model.code isEqual:@Notloggedin]){
                [self UpDengLu];
            }
        }else{
        }
    }];
}
- (void)UpData:(TKPrizeModel *)model{
    NSMutableArray * itemarray = model.oldPrizeList;
    TKPListModel * tkmodel = [TKPListModel new];
    tkmodel.periodsNum = @"本期奖品";
    tkmodel.prizeList = model.prizeList;
    [itemarray insertObject:tkmodel atIndex:0]; 
    _tableView.itemArray = itemarray;
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
