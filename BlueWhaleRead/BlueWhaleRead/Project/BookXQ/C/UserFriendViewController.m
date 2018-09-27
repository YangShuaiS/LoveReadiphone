//
//  UserFriendViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/12.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "UserFriendViewController.h"
#import "UserFriendTabView.h"
@interface UserFriendViewController ()
@property (strong, nonatomic) UserFriendTabView *tableView;

@end

@implementation UserFriendViewController{
    GeneraNoDataView * wdView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    WS(ws);
    self.view.backgroundColor = [UIColor clearColor];    
    BaseView * backView = [BaseView new];
    backView.backgroundColor = RGB(255, 255, 255);
    backView.layer.masksToBounds = YES;
    backView.layer.cornerRadius = LENGTH(5);
    [self.view addSubview:backView];
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.view).with.offset(LENGTH(0));
        make.left.equalTo(ws.view).with.offset(LENGTH(8));
        make.right.equalTo(ws.view).with.offset(-LENGTH(8));
        make.bottom.equalTo(ws.view).with.offset(-LENGTH(12));
    }];
    
    
    _tableView = [UserFriendTabView new];
    //因为是先请求的数据后创建视图
    _tableView.nav = self.navigationController;
    _tableView.itemarray = _itemarray;
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(backView).with.offset(LENGTH(12));
        make.left.equalTo(backView).with.offset(LENGTH(0));
        make.right.equalTo(backView).with.offset(-LENGTH(0));
        make.bottom.equalTo(backView).with.offset(LENGTH(0));
    }];
    [_tableView setBlock:^(CGFloat flo) {
        ws.block(flo);
    }];
    
}
- (void)setItemarray:(NSMutableArray *)itemarray{
    _itemarray = itemarray;
    if (itemarray.count == 0) {
        if (wdView == nil) {
            [self addShaFa];
        }
    }else{
        if (wdView != nil) {
            [wdView removeFromSuperview];
        }
    }
}

- (void)addShaFa{
    WS(ws);
    wdView = [GeneraNoDataView new];
    //    wdView.backgroundColor = WhitColor;
    wdView.image = @"icon_没有同学";
    wdView.titlename = @"目前还没有同学读这本书哦";
    wdView.style = NoDtaaViewStyleImageLabel;
    wdView.layer.masksToBounds = YES;
    [self.view addSubview:wdView];
    [wdView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.mas_equalTo(ws.view);
        make.top.equalTo(ws.view).with.offset(LENGTH(12));
        make.left.equalTo(ws.view).with.offset(LENGTH(8));
        make.right.equalTo(ws.view).with.offset(-LENGTH(8));
        make.bottom.equalTo(ws.view).with.offset(-LENGTH(12));
    }];
    
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
