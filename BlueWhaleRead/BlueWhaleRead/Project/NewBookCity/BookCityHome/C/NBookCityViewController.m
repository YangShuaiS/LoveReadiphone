//
//  NBookCityViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/6.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "NBookCityViewController.h"
#import "SearchView.h"

#import "NBCchannelView.h"
#import "NBCGoodBoookListTabView.h"
#import "NBCweekReadingView.h"
#import "NBClistAllView.h"
#import "NBCclassificationView.h"
@interface NBookCityViewController ()<NavDelegate,UIScrollViewDelegate>

@end

@implementation NBookCityViewController{
    UIScrollView * scrollView;
    NSMutableArray *  viewarray;
    
    NBCchannelView * channel;
    NBCGoodBoookListTabView * goodbook;
    NBCweekReadingView * cweek;
    NBClistAllView * List;
    NBCclassificationView * classification;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self AddNavtion];
    [self Addview];
}
#pragma mark --------------------  导航栏以及代理
- (void)AddNavtion{
    [super AddNavtion];
    WS(ws);
    self.navtive = [[NativeView alloc] initWithLeftImage:@"" Title:@"书城" RightTitle:@"搜索-深色" NativeStyle:nacStyleCengterAndRight];
     self.navtive.titcolor = RGB(0, 0, 0);
    self.navtive.delegate = self;
    [self.view addSubview:self.navtive];
    [ws.navtive mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.top.equalTo(ws.view).with.offset(0);
        make.height.mas_equalTo(NavHeight);
    }];
    self.navtive.backgroundColor = [UIColor whiteColor];
    self.navtive.layer.shadowColor = RGB(0, 0, 0).CGColor;
    self.navtive.layer.shadowOffset = CGSizeMake(0,2);//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
    self.navtive.layer.shadowRadius = LENGTH(4);
    self.navtive.layer.shadowOpacity = 0.04;
    
}
- (void)NavLeftClick{
    
}

- (void)NavCenterClick {

}


- (void)NavRightClick {
    SearchView * view = [SearchView new];
    view.nav = self.navigationController;
    view.frame = self.view.window.frame;
    [self.view.window addSubview:view];
}


- (void)Addview{
    WS(ws);
    self.automaticallyAdjustsScrollViewInsets = NO;
    viewarray = [NSMutableArray array];
    scrollView = [UIScrollView new];
    scrollView.delegate = self;
    [self.view addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.navtive.mas_bottom).with.offset(LENGTH(4));
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.bottom.equalTo(ws.view).with.offset(-TabBarHeight);
    }];
    scrollView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headRefresh)];

    
    channel = [NBCchannelView new];
    channel.nav = self.navigationController;
    [viewarray addObject:channel];
    
    goodbook = [NBCGoodBoookListTabView new];
    goodbook.nav = self.navigationController;
    [viewarray addObject:goodbook];
    
    cweek = [NBCweekReadingView new];
    cweek.nav = self.navigationController;
    [viewarray addObject:cweek];
    
    List = [NBClistAllView new];
    List.nav = self.navigationController;
    [viewarray addObject:List];
    
    classification = [NBCclassificationView new];
    classification.nav = self.navigationController;
    [viewarray addObject:classification];
    
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
                if (i == 1) {
                    make.top.equalTo(lastview.mas_bottom).with.offset(LENGTH(0));
                }else{
                    make.top.equalTo(lastview.mas_bottom).with.offset(LENGTH(0));
                }
            }];
        }
        if (i == viewarray.count-1) {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.bottom.equalTo(self->scrollView.mas_bottom).with.offset(0);
            }];
        }
        lastview = view;
    }
    [self LoadData];
}
#pragma mark - 下拉刷新
- (void)headRefresh{
    [self LoadData];
}
- (void)LoadData{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_NBCHOME];
    NSDictionary * dic = @{@"studentid":Me.ssid};
    
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            NBCALLModel * model = [NBCALLModel mj_objectWithKeyValues:responseObject];
            if ([model.code isEqual:@200]) {
                [self UpData:model];
            }
            [self->scrollView.mj_header endRefreshing];
        }else{
            [self->scrollView.mj_header endRefreshing];
        }
    }];
}
- (void)UpData:(NBCALLModel *)model{
    channel.model = model;
    goodbook.model = model;
    cweek.model = model;
    List.model = model;
    classification.model = model;
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
