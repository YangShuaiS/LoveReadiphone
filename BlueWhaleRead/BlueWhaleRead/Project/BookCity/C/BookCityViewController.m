//
//  BookCityViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/11.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BookCityViewController.h"
#import "BooStyleView.h"
#import "SearchOldView.h"
@interface BookCityViewController ()<BooStyleViewDelegate>
@property (strong, nonatomic) BooStyleView *menu;

@end

@implementation BookCityViewController{
    UIView * backview;
    BaseView * view;//搜索
    NSInteger page;
    NSArray  * arr;
    NSInteger allpage;
    CGFloat alph;
    BaseLabel * titleLable;
    BOOL styles;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addnavtion];
    [self AddView];
    [self AddNavtion];
}

- (void)addnavtion{
    WS(ws);
    styles = YES;
    backview = [UIView new];
    backview.backgroundColor = MAINCOLOR;
    [self.view addSubview:backview];
    [backview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.and.right.mas_equalTo(ws.view);
    }];
    UIImage * backImage = UIIMAGE(@"icon_返回_粗");

    FLAnimatedImageView * left = [FLAnimatedImageView new];
    left.image = backImage;
    left.contentMode = UIViewContentModeScaleAspectFit;
    [backview addSubview:left];
    [left mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->backview).with.offset(LENGTH(26));
        make.top.equalTo(self->backview).with.offset(StatusBar+10);
        make.height.mas_equalTo(22);
        make.width.mas_equalTo(12);
    }];
    
    BaseButton * LeftBigButton = [BaseButton buttonWithType:UIButtonTypeCustom];
    [LeftBigButton addTarget:self action:@selector(leftclicks) forControlEvents:UIControlEventTouchUpInside];
    [backview addSubview:LeftBigButton];
    
    [LeftBigButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->backview).with.offset(0);
        make.top.equalTo(self->backview).with.offset(StatusBar);
        make.height.mas_equalTo(@44);
        make.width.mas_equalTo(LENGTH(26)+12+LENGTH(5));
    }];
    
    titleLable = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0xff, 0xfe, 0xfe) LabelFont:TextFont(20) TextAlignment:NSTextAlignmentCenter Text:@"书库"];
    [backview addSubview:titleLable];
    [titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self->backview);
        make.centerY.mas_equalTo(left);
        make.height.mas_equalTo(44);
    }];
    
    
    view = [BaseView new];
    view.backgroundColor = RGBA(255, 255, 255, 0.4);
    view.layer.masksToBounds = YES;
    view.layer.cornerRadius = 15;
    [backview addSubview:view];
    
    FLAnimatedImageView * searchImage = [FLAnimatedImageView new];
    searchImage.image = UIIMAGE(@"搜索图标_白");
    [view addSubview:searchImage];
    
    BaseLabel * titleLables = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255,255,255) LabelFont:TextFont(11) TextAlignment:NSTextAlignmentLeft Text:@"输入书名/作者…"];
    [view addSubview:titleLables];
    
    BaseButton * button = [BaseButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self action:@selector(centerBt) forControlEvents:UIControlEventTouchUpInside];
    [backview addSubview:button];
    
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self->backview).with.offset(-LENGTH(20));
        make.left.equalTo(self->backview).with.offset(LENGTH(20));
        make.top.mas_equalTo(self->backview).with.offset(NavHeight+7);
        make.bottom.mas_equalTo(self->backview).with.offset(-7);
        make.height.mas_equalTo(30);
    }];
    [searchImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self->view).with.offset(-LENGTH(19));
        make.centerY.mas_equalTo(self->view.mas_centerY);
        make.height.mas_equalTo(LENGTH(16));
        make.width.mas_equalTo(LENGTH(16));
    }];
    
    [titleLables mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->view).with.offset(LENGTH(19));
        make.centerY.mas_equalTo(self->view.mas_centerY);
        make.right.mas_equalTo(self->view.mas_right);
    }];
    
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self->view);
    }];
    
}
- (void)leftclicks{
    [self.navigationController popViewControllerAnimated:YES];
    
}
- (void)centerBt {
    SearchOldView * view = [SearchOldView new];
    view.nav = self.navigationController;
    view.frame = self.view.window.frame;
    [self.view.window addSubview:view];
}



- (void)AddView{
    WS(ws);
    self.view.backgroundColor = BEIJINGCOLOR;
    _menu = [BooStyleView new];
    _menu.delegete = self;
    _menu.nav = self.navigationController;
    [self.view addSubview:_menu];
    [_menu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->backview.mas_bottom);
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
    CGFloat y = flo;
    if (y>=(StatusBar+44)) {
        y =StatusBar+44;
        if (styles == NO) {
            styles = YES;
            [UIView animateWithDuration:0.5 animations:^{
                self->titleLable.alpha = 0;
                [self->view mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.left.equalTo(self->backview).with.offset(12+LENGTH(26)+LENGTH(5));
                    make.top.mas_equalTo(self->backview).with.offset(StatusBar + 7);
                }];
                [self.view.superview layoutIfNeeded];
            } completion:^(BOOL finished) {
                
            }];
        }
    }else{
        if (flo>0) {
            if (styles == YES) {
                styles = NO;
                [UIView animateWithDuration:0.5 animations:^{
                    self->titleLable.alpha = 1;
                    [self->view mas_updateConstraints:^(MASConstraintMaker *make) {
                        make.left.equalTo(self->backview).with.offset(LENGTH(20));
                        make.top.mas_equalTo(self->backview).with.offset(NavHeight+7);
                    }];
                    [self.view.superview layoutIfNeeded];
                } completion:^(BOOL finished) {
                    
                }];
               
            }
        }
    }
//    if (y>0) {
//        CGFloat tophei = 44*alph+StatusBar;
//        CGFloat left =(12+LENGTH(6)+LENGTH(5))- (12+LENGTH(6)+LENGTH(5))*alph;
//
//        titleLable.alpha = alph;
//
//        [view mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(self->backview).with.offset(LENGTH(20)+left);
//            make.top.mas_equalTo(self->backview).with.offset(tophei+7);
//            make.bottom.mas_equalTo(self->backview).with.offset(-7);
//            make.height.mas_equalTo(30);
//        }];
//    }
    
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
    }else if ([model.code isEqual:@Notloggedin]){
        [self UpDengLu];
    }
}
- (void)UpData:(BookCityModel *)model{
    [_menu.tableView.mj_header endRefreshing];
    [_menu.tableView.mj_footer endRefreshing];
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
