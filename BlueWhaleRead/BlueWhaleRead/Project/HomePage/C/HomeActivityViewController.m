//
//  HomeActivityViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/25.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "HomeActivityViewController.h"
#import "HomeActivityTableView.h"
#import "FenXiangView.h"
#import "HaiBaoView.h"
@interface HomeActivityViewController ()<NavDelegate>

@end

@implementation HomeActivityViewController{
    HomeActivityTableView *tableView;
    GeneraNoDataView * wdView;
    
    NSInteger page;
    NSMutableArray * itemarray;
    
    FLAnimatedImageView * sharefriend;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self AddNavtion];
    WS(ws);
    tableView = [HomeActivityTableView new];
    tableView.nav = self.navigationController;
    tableView.hiden = _hiden;
    [self.view addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.navtive.mas_bottom).with.offset(LENGTH(6));
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
    for (int i = 0; i < 12; i++) {
//        BookSDModel * sdmodel = [BookSDModel new];
//        if (i == 0) {
//            sdmodel.name = @"一年级必读书目";
//        }else if (i == 1){
//            sdmodel.name = @"二年级必读书目";
//        }else if (i == 2){
//            sdmodel.name = @"三年级必读书目";
//        }else if (i == 3){
//            sdmodel.name = @"四年级必读书目";
//        }else if (i == 4){
//            sdmodel.name = @"五年级必读书目";
//        }else if (i == 5){
//            sdmodel.name = @"六年级必读书目";
//        }
//        sdmodel.booklist = [NSMutableArray array];
        NSMutableArray * array  = [NSMutableArray array];
        [itemarray addObject:array];
    }
}
- (void)LoadData{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_ZHUTIPAGE];
//    NSDictionary * dic = @{@"studentid":Me.ssid,@"tagid":_itemid,@"page":[NSString stringWithFormat:@"%ld",page]};
    NSDictionary * dic = @{@"studentid":Me.ssid,@"tagid":_itemid,@"page":[NSString stringWithFormat:@"%ld",page]};

    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            ZHUTIMODEL * model = [ZHUTIMODEL mj_objectWithKeyValues:responseObject];
            if ([model.code isEqual:@200]) {
                [self UpData:model];
                self->page++;
            }else if ([model.code isEqual:@Notloggedin]){
                [self UpDengLu];
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
- (NSInteger)SchoolClass:(NSString *)lv{
    NSInteger schoolclass = 0;
    NSArray * array = [BaseObject TiemArray:lv String:@","];
    NSString * lvs = array[0];
    if ([lvs isEqualToString:@"Lv1"]) {
        schoolclass = 0;
    }else if ([lvs isEqualToString:@"Lv2"]){
        schoolclass = 1;
    }else if ([lvs isEqualToString:@"Lv3"]){
        schoolclass = 2;
    }else if ([lvs isEqualToString:@"Lv4"]){
        schoolclass = 3;
    }else if ([lvs isEqualToString:@"Lv5"]){
        schoolclass = 4;
    }else if ([lvs isEqualToString:@"Lv6"]){
        schoolclass = 5;
    }
    return schoolclass;
}
- (void)UpData:(ZHUTIMODEL *)model{

        if (wdView != nil) {
            [wdView removeFromSuperview];
        }
    tableView.model = model;
    for (CityBookListModel * mo in model.tag.booklist) {
        NSString * lv = mo.levels;
        NSInteger inter = [self SchoolClass:lv];
        NSMutableArray * array = itemarray[inter];
        [array addObject:mo];
    }
    if (model.tag.booklist.count == 0) {
        
    }else{
        tableView.itemarray =itemarray;
    }
    self.navtive.title = model.tag.name;
    
    WS(ws);
    if (sharefriend == nil) {
        sharefriend = [FLAnimatedImageView new];
        sharefriend.image = UIIMAGE(@"组 928");
        sharefriend.contentMode = UIViewContentModeScaleAspectFit;
        [self.navtive addSubview:sharefriend];
        [sharefriend mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(ws.navtive.mas_top).with.offset(StatusBar+10);
            make.right.mas_equalTo(ws.navtive.mas_right).with.offset(-20);
            //        make.size.mas_equalTo(sharefriend.image.size);
            make.width.and.height.mas_equalTo(24);
        }];
        sharefriend.userInteractionEnabled = YES;
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(FenXiang)];
        [sharefriend addGestureRecognizer:tap];
    }
}
- (void)FenXiang{
    FenXiangView * fenxiangs = [FenXiangView new];
    fenxiangs.vc = self;
    fenxiangs.imageurl = tableView.model.tag.theme_img;
    fenxiangs.wzbt = tableView.model.tag.descriptions;
    fenxiangs.sdm = tableView.model.tag.name;
    fenxiangs.textid = _itemid;
    fenxiangs.sharestyle = ShareStyleTag10;
    [self.view addSubview:fenxiangs];
    WS(ws);
    [fenxiangs mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws.view);
    }];
    [fenxiangs setBlock:^(FenXiangModel *model, ShareStyle sharestyle) {
        [self addhabai:model Style:sharestyle];
    }];
    
}

- (void)addhabai:(FenXiangModel *)model Style:(ShareStyle)style{
    HaiBaoView * haibao = [HaiBaoView new];
    haibao.textid = _itemid;
    haibao.sharestyle = style;
    haibao.modes = model;
    [self.view addSubview:haibao];
    WS(ws);
    [haibao mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws.view);
    }];
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
    self.navtive = [[NativeView alloc] initWithLeftImage:@"backhei" Title:@"" RightTitle:@"" NativeStyle:NavStyleGeneral];
    self.navtive.delegate = self;
    self.navtive.titcolor = RGB(0, 0, 0);
    [self.view addSubview:self.navtive];
    self.navtive.backgroundColor = [UIColor whiteColor];
    self.navtive.layer.shadowColor = RGB(0, 0, 0).CGColor;
    self.navtive.layer.shadowOffset = CGSizeMake(0,2);//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
    self.navtive.layer.shadowRadius = LENGTH(4);
    self.navtive.layer.shadowOpacity = 0.04;
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
