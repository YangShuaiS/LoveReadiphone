//
//  HomeActivityViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/25.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "HomeActivityViewController.h"
#import "HomeActivityTableView.h"
@interface HomeActivityViewController ()<NavDelegate>

@end

@implementation HomeActivityViewController{
    HomeActivityTableView *tableView;
    GeneraNoDataView * wdView;
    
    NSInteger page;
    NSMutableArray * itemarray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = BEIJINGCOLOR;
    [self AddNavtion];
    
    WS(ws);
    tableView = [HomeActivityTableView new];
    tableView.nav = self.navigationController;
    tableView.hiden = _hiden;
    [self.view addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.navtive.mas_bottom).with.offset(0);
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.bottom.equalTo(ws.view).with.offset(0);
    }];
    
    tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self chushihua];
        [self LoadData];
    }];
    [tableView.mj_header beginRefreshing];
    
    tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self LoadData];
    }];

}

- (void)chushihua{
    page = 1;
    itemarray = [NSMutableArray array];
}
- (void)LoadData{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_ZHUTIPAGE];
    NSDictionary * dic = @{@"studentid":Me.ssid,@"tagid":_itemid,@"page":[NSString stringWithFormat:@"%ld",page]};
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            ZHUTIMODEL * model = [ZHUTIMODEL mj_objectWithKeyValues:responseObject];
            if ([model.code isEqual:@200]) {
                [self UpData:model];
                self->page++;
            }
            
        }else{
            if (self->wdView == nil) {
                [self addShaFa];
            }
        }
        [self->tableView.mj_header endRefreshing];
        [self->tableView.mj_footer endRefreshing];

    }];
    
}
- (void)UpData:(ZHUTIMODEL *)model{

        if (wdView != nil) {
            [wdView removeFromSuperview];
        }
    tableView.model = model;
    [itemarray addObjectsFromArray:model.tag.booklist];
    tableView.itemarray =itemarray; 
    self.navtive.title = model.tag.name;
}

- (void)addShaFa{
    WS(ws);
    wdView = [GeneraNoDataView new];
    wdView.image = @"icon_无网";
    wdView.titlename = @"哎呀，网断了，刷新一下试试吧！";
    wdView.clickName = @"点击刷新";
    wdView.style = NoDtaaViewStyleUpData;
    [self.view addSubview:wdView];
    [wdView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws.navtive.mas_bottom);
        make.left.mas_equalTo(ws.view);
        make.right.mas_equalTo(ws.view);
        make.bottom.mas_equalTo(ws.view);
    }];
    [wdView setBlock:^{
        [ws LoadData];
    }];
    
}
#pragma mark --------------------  导航栏以及代理
- (void)AddNavtion{
    [super AddNavtion];
    WS(ws);
    self.navtive = [[NativeView alloc] initWithLeftImage:@"icon_返回_粗" Title:@"" RightTitle:@"home-Click" NativeStyle:NavStyleGeneral];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
