//
//  MedalPaiHangBangViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/5.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "MedalPaiHangBangViewController.h"
#import "MedalPaiHuanTableView.h"
#import "FenXiangView.h"
#import "HaiBaoView.h"
@interface MedalPaiHangBangViewController ()<NavDelegate>

@end

@implementation MedalPaiHangBangViewController{
    MedalPaiHuanTableView *tableView;
    MonthstudentModel * models;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self AddNavtion];
    self.view.backgroundColor = BEIJINGCOLOR;
    
    WS(ws);
    tableView = [MedalPaiHuanTableView new];
    tableView.nav = self.navigationController;
    [self.view addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.navtive.mas_bottom);
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.bottom.equalTo(ws.view).with.offset(0);        
    }];
    [self loadUpData];
}

- (void)loadUpData{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_YUEXUNZHANGPAIMING];
    NSDictionary * dic = @{@"studentid":Me.ssid};
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            MonthPMModel * model = [MonthPMModel mj_objectWithKeyValues:responseObject];
            if ([model.code isEqual:@200]) {
                [self UpData:model];
            }
        }else{
            
        }
    }];
}
- (void)UpData:(MonthPMModel *)model{
    models = model.studentList;
    tableView.monthBadgeList = model.studentList;
}
#pragma mark --------------------  导航栏以及代理
- (void)AddNavtion{
    [super AddNavtion];
    WS(ws);
    self.navtive = [[NativeView alloc] initWithLeftImage:@"icon_返回_粗" Title:@"勋章排行榜" RightTitle:@"" NativeStyle:NavStyleGeneral];
    self.navtive.delegate = self;
    [self.view addSubview:self.navtive];
    [ws.navtive mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.top.equalTo(ws.view).with.offset(0);
        make.height.mas_equalTo(NavHeight);
    }];
    
    FLAnimatedImageView * sharefriend = [FLAnimatedImageView new];
    sharefriend.image = UIIMAGE(@"告诉朋友");
    [self.navtive addSubview:sharefriend];
    [sharefriend mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws.navtive.mas_top).with.offset(StatusBar);
        make.right.mas_equalTo(ws.navtive.mas_right).with.offset(-20);
        make.size.mas_equalTo(sharefriend.image.size);
    }];
    sharefriend.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(FenXiang)];
    [sharefriend addGestureRecognizer:tap];
    
}

- (void)FenXiang{
    NSMutableArray * itemarray = models.studentList;
    MyClassModel * mymodel = itemarray[models.myRank];
    if (itemarray.count != 0) {
        FenXiangView * fenxiangs = [FenXiangView new];
        if (models.myRank == 0) {
            fenxiangs.sharestyle = ShareStyleTag7;
        }else{
            fenxiangs.balistgs = [NSString stringWithFormat:@"%ld",mymodel.studentBadgeList.count];
            fenxiangs.sharestyle = ShareStyleTag8;
        }
        [self.view addSubview:fenxiangs];
        WS(ws);
        [fenxiangs mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(ws.view);
        }];
        [fenxiangs setBlock:^(FenXiangModel *model, ShareStyle sharestyle) {
            [self addhabai:model Style:sharestyle];
        }];
    }
}

- (void)addhabai:(FenXiangModel *)model Style:(ShareStyle)style{
    HaiBaoView * haibao = [HaiBaoView new];
    haibao.sharestyle = style;
    haibao.modes = model;
    [self.view addSubview:haibao];
    WS(ws);
    [haibao mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws.view);
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
