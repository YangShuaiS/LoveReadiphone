//
//  AchievementReportViewController.m
//  BoWanJuanForPad
//
//  Created by 杨帅 on 2018/5/29.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "AchievementReportViewController.h"
#import "AchievementMenu.h"
#import "AchievementTableView.h"
@interface AchievementReportViewController ()<NavDelegate>
@property (strong, nonatomic) AchievementTableView *tableView;

@end

@implementation AchievementReportViewController{
    AchievementMenu * achmenu;
    AchievementModel * model;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = BEIJINGCOLOR;
    [self AddNavtion];
    [self LoadData];

//    [self AddView];
}

#pragma mark --------------------  导航栏以及代理
- (void)AddNavtion{
    [super AddNavtion];
    WS(ws);
    self.navtive = [[NativeView alloc] initWithLeftImage:@"icon_返回_粗" Title:@"我的成就" RightTitle:@"home-Click" NativeStyle:NavStyleGeneral];
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

- (void)NavCenterClick {
    
}


- (void)NavRightClick {
    
}

- (void)LoadData{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_CHENGJIUBAOBIAO];
    NSDictionary * dic = @{@"studentid":Me.ssid};
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            self->model = [AchievementModel mj_objectWithKeyValues:responseObject];
            if ([self->model.code isEqual:@200]) {
                [self AddView];
            }else if ([self->model.code isEqual:@Notloggedin]){
                [self UpDengLu];
            }
        }else{
        }
    }];

}


- (void)AddView{
    WS(ws);
    BaseView * backView = [BaseView new];
    backView.backgroundColor = self.navtive.backgroundColor;
    [self.view addSubview:backView];

    
    achmenu = [AchievementMenu new];
    [self.view addSubview:achmenu];
    [achmenu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws.navtive.mas_bottom).with.offset(LENGTH(23));
        make.left.mas_equalTo(ws.view);
        make.right.mas_equalTo(ws.view);
    }];
    
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws.navtive.mas_bottom);
        make.left.mas_equalTo(ws.view);
        make.right.mas_equalTo(ws.view);
        make.height.mas_equalTo(self->achmenu.mas_height).with.offset(LENGTH(25));
    }];
    
    _tableView = [AchievementTableView new];
    _tableView.nav = self.navigationController;
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->achmenu.mas_bottom).with.offset(0);
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.bottom.equalTo(ws.view).with.offset(0);
    }];
    
    [achmenu setClickTag:^(NSInteger inter) {
        ws.tableView.downinter = inter;
    }];
    [_tableView setClickTag:^(NSInteger inter) {
        [ws clickTag:inter];
    }];
    [_tableView setFloa:^(CGFloat floa) {
        [ws scroller:floa];
    }];
    
    
    
    achmenu.model = model;
    _tableView.model = model;
    [self.view.superview layoutIfNeeded];
    [self->achmenu donghuaxin:_tiao];
    self.tableView.tiao = _tiao;


}
- (void)setTiao:(NSInteger)tiao{
    _tiao = tiao;

}
- (void)clickTag:(NSInteger)inter{
    [self->achmenu donghuaxin:inter];

}
- (void)scroller:(CGFloat)floa{
//    WS(ws);
//    if (floa<=(LENGTH(105)+44) && floa >= 0) {
//        [self.navtive mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.top.mas_equalTo(ws.view).with.offset(-floa);
//        }];
//    }
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
