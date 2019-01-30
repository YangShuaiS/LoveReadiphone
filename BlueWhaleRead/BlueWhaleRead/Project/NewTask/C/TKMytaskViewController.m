//
//  TKMytaskViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/29.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "TKMytaskViewController.h"
#import "TKMytaskCollectionView.h"
#import "TKMytaskTableView.h"
#define itemWidth LENGTH(350)
#define itemHeight LENGTH(120)
@interface TKMytaskViewController ()<NavDelegate>
@property (strong, nonatomic) TKMytaskTableView *tableview;

@end

@implementation TKMytaskViewController
#pragma mark --------------------  导航栏以及代理
- (void)AddNavtion{
    [super AddNavtion];
    WS(ws);
    self.navtive = [[NativeView alloc] initWithLeftImage:@"backhei" Title:@"我的任务" RightTitle:@"" NativeStyle:NavStyleGeneral];
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
    self.view.backgroundColor = [UIColor whiteColor];
    WS(ws);
    _tableview =[TKMytaskTableView new];
    [self.view addSubview:_tableview];
    [_tableview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws.navtive.mas_bottom);
        make.left.mas_equalTo(ws.view);
        make.right.mas_equalTo(ws.view);
        make.bottom.mas_equalTo(ws.view);
    }];
    [self LoadData];
    // Do any additional setup after loading the view.
}

- (void)LoadData{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_WDRW];
    NSDictionary * dic = @{@"studentid":Me.ssid};
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            TKMymissionListModel * model = [TKMymissionListModel mj_objectWithKeyValues:responseObject];
            if ([model.code isEqual:@200]) {
                [self UpData:model];
            }else if ([model.code isEqual:@Notloggedin]){
                [self UpDengLu];
            }
        }else{
        }
    }];
}
- (void)UpData:(TKMymissionListModel *)model{
    _tableview.itemArray = model.missionList;
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
