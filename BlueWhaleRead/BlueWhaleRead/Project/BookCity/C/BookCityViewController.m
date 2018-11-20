//
//  BookCityViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/11.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BookCityViewController.h"
//#import "BookHeadView.h"
#import "BooStyleView.h"
#import "SearchView.h"
@interface BookCityViewController ()<NavDelegate,BooStyleViewDelegate>
@property (strong, nonatomic) BooStyleView *menu;

@end

@implementation BookCityViewController{
//    BookHeadView *headView;
    NSInteger page;
    NSArray  * arr;
    NSInteger allpage;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self AddView];
    [self AddNavtion];
}
#pragma mark --------------------  导航栏以及代理
- (void)AddNavtion{
    [super AddNavtion];
    WS(ws);
    self.navtive = [[NativeView alloc] initWithLeftImage:@"icon_返回_粗" Title:@"请输入书籍名称" RightTitle:@"" NativeStyle:NacStyleBookCity];
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
    SearchView * view = [SearchView new];
    view.nav = self.navigationController;
    view.frame = self.view.window.frame;
    [self.view.window addSubview:view];
}


- (void)NavRightClick {
    
}


- (void)AddView{
    WS(ws);
    self.view.backgroundColor = BEIJINGCOLOR;
    
//    headView = [BookHeadView new];
//    headView.nav = self.navigationController;
//    headView.layer.shadowOpacity = 0.2;
//    headView.layer.shadowColor = [UIColor blackColor].CGColor;
//    headView.layer.shadowOffset = CGSizeMake(0,0);//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
//    headView.layer.shadowRadius = 4.f;
//    [self.view addSubview:headView];
//    [headView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(ws.view).with.offset(NavHeight+LENGTH(17));
//        make.left.equalTo(ws.view).with.offset(LENGTH(25));
//        make.right.equalTo(ws.view).with.offset(-LENGTH(25));
//        make.height.mas_equalTo(LENGTH(250));
//    }];
//
    _menu = [BooStyleView new];
    _menu.delegete = self;
    _menu.nav = self.navigationController;
    [self.view addSubview:_menu];
    [_menu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.view).with.offset(NavHeight);
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.bottom.equalTo(ws.view).with.offset(0);
    }];
    arr = [NSArray array];
    arr = @[_cata,@"0",@"0"];
    [self chushihua];
    typeof(self) __weak weakSelf = self;
    _menu.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf headRefresh];
    }];
    [_menu.tableView.mj_header beginRefreshing];

    _menu.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        // 进入刷新状态后会自动调用这个 block
        [weakSelf footerRefresh];
    }];
}
#pragma mark - 下拉刷新
- (void)headRefresh{
    [self LoadData:self->arr[0] Leve:self->arr[1] Sort:self->arr[2]];
}
#pragma mark - 上拉加载
- (void)footerRefresh{
    if (allpage >=page) {
        [self LoadData:self->arr[0] Leve:self->arr[1] Sort:self->arr[2]];
    }else{
        [_menu.tableView.mj_footer endRefreshing];
    }
}
- (void)chushihua{
    _menu.inter = 1;
    page = 1;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark -------------------- 上移动画，暂时取消
- (void)scrollFloat:(CGFloat)flo{
//    WS(ws);
//    if (headView != nil) {
//        CGFloat headerViewY;
//
//        if (flo>0) {
//            headerViewY = -flo + 64;
//            if (flo > headView.frame.size.height) {
//                headerViewY = -headView.frame.size.height + 64;
//            }
//        }else{
//            headerViewY = NavHeight+LENGTH(17);
//        }
//        [headView mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(ws.view).with.offset(headerViewY);
//
//        }];
//        [headView layoutIfNeeded];
//
//    }
//    [_menu mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.bottom.equalTo(ws.view).with.offset(-TabBarHeight);
//    }];
//    [_menu layoutIfNeeded];
}
- (void)backbodys:(NSArray *)array{
    arr= array;
    [self chushihua];
    [self LoadData:array[0] Leve:array[1] Sort:array[2]];

}
- (void)LoadData:(NSString *)catalogid Leve:(NSString *)levelid Sort:(NSString *)sort{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,BOOKCITY];
    //studentid 学生id
    if ([catalogid isEqualToString:@""]) {
        catalogid = _cata;
    }

    if ([levelid isEqualToString:@""]) {
        levelid = @"0";
    }

    if ([sort isEqualToString:@""]) {
        sort = @"0";
    }

    NSDictionary * dic = @{@"studentid":Me.ssid,@"catalogid":catalogid,@"levelid":levelid,@"sort":sort,@"page":[NSString stringWithFormat:@"%ld",(long)page]};
    typeof(self) __weak weakSelf = self;

    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            [weakSelf UpresponseObject:responseObject];
   
        }else{

        }
        [weakSelf.menu.tableView.mj_header endRefreshing];
        [weakSelf.menu.tableView.mj_footer endRefreshing];
    }];
    
}
- (void)UpresponseObject:(id)responseObject{
    BookCityModel * model = [BookCityModel mj_objectWithKeyValues:responseObject];
    if ([model.code isEqual:@200]) {
        [self UpData:model];
        self->page++;
    }
}
- (void)UpData:(BookCityModel *)model{
    [_menu.tableView.mj_header endRefreshing];
    [_menu.tableView.mj_footer endRefreshing];
//    if (model.readBalance.studentBalance.count == 0||model.readBalance.myReadNum<5) {
//            WS(ws);
////            [headView removeFromSuperview];
//            [_menu mas_updateConstraints:^(MASConstraintMaker *make) {
//                make.top.equalTo(ws.navtive.mas_bottom);
//            }];
//    }else{
////        headView.readBalance = model.readBalance;
//    }
    _menu.inpath = _inpath;
    _menu.model = model;
    allpage = model.totalCount;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)dealloc{
}
@end
