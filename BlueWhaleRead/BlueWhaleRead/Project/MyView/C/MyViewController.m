//
//  MyViewController.m
//  BoWanJuanForPad
//
//  Created by 杨帅 on 2018/5/28.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "MyViewController.h"

#import "MyTopView.h"
#import "MyXunZhangView.h"
#import "MyQingKuangView.h"
#import "MyJoinInterestGroupView.h"

@interface MyViewController ()<UIScrollViewDelegate,NavDelegate>{
    NSMutableArray *  viewarray;
    UIScrollView * scrollView;
    
    MyTopView * topView;
    MyDeModel * model;
    MyQingKuangView * myqingkuang;
    
    MyZiLiaoModel * userModel;
}

@end

@implementation MyViewController
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self LoadData];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self AddNavtion];
    [self Addview];
    [self ViewLaout];

//    [self LoadData];
}
- (void)LoadData{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_MYDE];
    NSDictionary * dic = @{@"studentid":Me.ssid};
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            self->model = [MyDeModel mj_objectWithKeyValues:responseObject];
            if ([self->model.code isEqual:@200]) {
                [self UpData];
            }else if ([self->model.code isEqual:@Notloggedin]){
                [self UpDengLu];
            }
        }else{

        }
    }];
    
}
- (void)UpData{
    topView.model = model.userinfo;
    myqingkuang.model = model;
}
#pragma mark --------------------  导航栏以及代理
- (void)AddNavtion{
    [super AddNavtion];
    WS(ws);
    self.navtive = [[NativeView alloc] initWithLeftImage:@"home-Click" Title:@"" RightTitle:@"home-Click" NativeStyle:NavStyleHome];
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
}

- (void)NavCenterClick {
    
}


- (void)NavRightClick {
    
}

#pragma mark -------------------- 所有底视图
- (void)Addview{
    WS(ws);
    viewarray = [NSMutableArray array];

    scrollView = [UIScrollView new];
    scrollView.backgroundColor = BEIJINGCOLOR;
    scrollView.delegate = self;
    scrollView.userInteractionEnabled = YES;
    [self.view addSubview:scrollView];
    
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.navtive.mas_bottom).with.offset(-44);
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.bottom.equalTo(ws.view).with.offset(-TabBarHeight);
        
    }];
    
    topView = [MyTopView new];
    topView.nav = self.navigationController;
    [viewarray addObject:topView];

    
    myqingkuang = [MyQingKuangView new];
    myqingkuang.nav = self.navigationController;
    [viewarray addObject:myqingkuang];
    
//    MyJoinInterestGroupView * join = [MyJoinInterestGroupView new];
//    join.itemarray = itemarray;
//    [viewarray addObject:join];
}

- (void)ViewLaout{
    WS(ws);
    BaseView * lastview;
    for (int i = 0; i < viewarray.count; i++) {
        BaseView * view = viewarray[i];
        [scrollView addSubview:view];
        if (!lastview) {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self->scrollView.mas_top).with.offset(0);
                make.left.equalTo(ws.view).with.offset(0);
                make.right.equalTo(ws.view).with.offset(0);
            }];
        }else{
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(ws.view).with.offset(0);
                make.right.equalTo(ws.view).with.offset(0);
                make.top.equalTo(lastview.mas_bottom).with.offset(LENGTH(10));
            }];
        }
        if (i == viewarray.count-1) {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.bottom.equalTo(self->scrollView.mas_bottom).with.offset(0);
            }];
        }
        lastview = view;
    }
    

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
