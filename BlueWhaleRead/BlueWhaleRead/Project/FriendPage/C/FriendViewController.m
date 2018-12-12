//
//  FriendViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/20.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "FriendViewController.h"
#import "FriendTopView.h"
#import "FriendHotView.h"
#import "MyViewController.h"
@interface FriendViewController ()<NavDelegate,UIScrollViewDelegate>{
    UIScrollView * scrollView;
    NSMutableArray *  viewarray;
    
    FriendTopView * topview;
    FriendHotView * rmtj;
}

@end

@implementation FriendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self AddNavtion];
}
#pragma mark --------------------  导航栏以及代理
- (void)AddNavtion{
    [super AddNavtion];
    WS(ws);
    self.navtive = [[NativeView alloc] initWithLeftImage:@"icon_返回_粗" Title:@"个人主页" RightTitle:@"" NativeStyle:NavStyleGeneral];
    self.navtive.delegate = self;
    [self.view addSubview:self.navtive];
    [ws.navtive mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.top.equalTo(ws.view).with.offset(0);
        make.height.mas_equalTo(NavHeight);
    }];
    [self LoadData];

}
- (void)AddView{
    viewarray = [NSMutableArray array];
    
    scrollView = [UIScrollView new];
    scrollView.backgroundColor = MAINCOLOR;
    scrollView.delegate = self;
    scrollView.userInteractionEnabled = YES;
    [self.view addSubview:scrollView];
    
    topview = [FriendTopView new];
    topview.nav = self.navigationController;  
    [viewarray addObject:topview];
    
    rmtj = [FriendHotView new];
    rmtj.nav = self.navigationController;
    [viewarray addObject:rmtj];
    
    topview.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
    [topview addGestureRecognizer:tap];
    
}

- (void)tap{
    if (topview.usermodel!=nil) {
        if ([topview.usermodel.ssid isEqualToString:Me.ssid]) {
            if ([self.navigationController.viewControllers[0] isKindOfClass:[MyViewController class]]) {
                [self.navigationController popToRootViewControllerAnimated:YES];
            }else{
                self.navigationController.tabBarController.selectedIndex = 3;
            }
        }
    }
}

#pragma mark -------------------- 视图布局
- (void)ViewLaout{
    WS(ws);
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.navtive.mas_bottom).with.offset(0);
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.bottom.equalTo(ws.view).with.offset(0);
    }];
    
    BaseView * lastview;
    for (int i = 0; i < viewarray.count; i++) {
        BaseView * view = viewarray[i];
        [scrollView addSubview:view];
        if (!lastview) {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                //                make.left.equalTo(self->scrollView.mas_left).with.offset(0);
                //                make.right.equalTo(self->scrollView.mas_right).with.offset(0);
                make.top.equalTo(self->scrollView.mas_top).with.offset(LENGTH(15));
                //                make.top.equalTo(ws.view).with.offset(0);
                make.left.equalTo(ws.view).with.offset(LENGTH(15));
                make.right.equalTo(ws.view).with.offset(-LENGTH(15));
            }];
        }else{
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(ws.view).with.offset(LENGTH(15));
                make.right.equalTo(ws.view).with.offset(-LENGTH(15));
                make.top.equalTo(lastview.mas_bottom).with.offset(LENGTH(11));
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
- (void)NavLeftClick{
    [self.navigationController popViewControllerAnimated:YES];
    //    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)NavCenterClick {
    
}


- (void)NavRightClick {
    
}


- (void)LoadData{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_FRIENDHOME];
    NSDictionary * dic = @{@"studentid":Me.ssid,@"friendid":_itemid};
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            FriendCodeModel * model = [FriendCodeModel mj_objectWithKeyValues:responseObject];
            if ([model.code isEqual:@200]) {
                [self UpData:model];
            }

        }else{

        }
    }];
    
}
- (void)UpData:(FriendCodeModel *)model{
    [self AddView];
    [self ViewLaout];
    topview.usermodel = model.friendInfo;
     rmtj.itemarray = model.friendReadList;
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
