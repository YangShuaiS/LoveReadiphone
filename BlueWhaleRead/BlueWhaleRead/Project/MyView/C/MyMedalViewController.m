//
//  MyMedalViewController.m
//  BoWanJuanForPad
//
//  Created by 杨帅 on 2018/5/29.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "MyMedalViewController.h"
#import "MyMedalTableView.h"
#import "MedalListViewController.h"
@interface MyMedalViewController ()<NavDelegate>
@property (strong, nonatomic) MyMedalTableView *tableView;

@end

@implementation MyMedalViewController{
    GeneraNoDataView * wdView;
}
- (void)loadUpData{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_MyBadge];
    NSDictionary * dic = @{@"studentid":Me.ssid};
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            MyBadgeListModel * model = [MyBadgeListModel mj_objectWithKeyValues:responseObject];
            if ([model.code isEqual:@200]) {
                [self UpData:model];
            }
        }else{
            
        }
    }];
}

- (void)UpData:(MyBadgeListModel *)model{
    _tableView.model = model;
    if (model.myBadge.count == 0) {
        _tableView.hidden = YES;
        if (wdView == nil) {
            [self addWdView];
        }else{
            [wdView removeFromSuperview];
        }
    }else{
        if (wdView == nil) {
//            [self addWdView];
        }else{
            [wdView removeFromSuperview];
        }
        _tableView.hidden = NO;
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    WS(ws);
    FLAnimatedImageView * bacImageView = [FLAnimatedImageView new];
    bacImageView.contentMode = UIViewContentModeScaleAspectFill;
    bacImageView.image = UIIMAGE(@"bg_书架_书籍详情大背景");
    [self.view addSubview:bacImageView];
    [bacImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws.view);
    }];
    [self AddNavtion];
    _tableView = [MyMedalTableView new];
    _tableView.nav = self.navigationController;
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.navtive.mas_bottom).with.offset(0);
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.bottom.equalTo(ws.view).with.offset(0);
    }];
    [self loadUpData];
}

#pragma mark --------------------  导航栏以及代理
- (void)AddNavtion{
    [super AddNavtion];
    WS(ws);
    self.navtive = [[NativeView alloc] initWithLeftImage:@"icon_返回_粗" Title:@"我的勋章" RightTitle:@"home-Click" NativeStyle:NavStyleGeneral];
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



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addWdView{
    WS(ws);
    wdView = [GeneraNoDataView new];
    wdView.backgroundColor = [UIColor clearColor];
    wdView.titlename = @"你还没有点亮勋章哦，去点亮吧！";
    wdView.clickName = @"去点亮勋章";
    wdView.style = NoDtaaViewStyleLabelClick;
//    wdView.nav = self.navigationController;
    [self.view addSubview:wdView];
    [wdView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws.view);
    }];
    [self.view addSubview:self.navtive];

    [wdView setBlock:^{
        MedalListViewController * vc = [MedalListViewController new];
        vc.style = ViewControllerStyleXZXQ;
        [ws.navigationController pushViewController:vc animated:YES];
    }];
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
