//
//  MedalXQBookListViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/13.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "MedalXQBookListViewController.h"
#import "MedalListXqBookTableView.h"
@interface MedalXQBookListViewController ()
@property (strong, nonatomic) MedalListXqBookTableView *tableView;

@end

@implementation MedalXQBookListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    WS(ws);
    BaseView * backView = [BaseView new];
    backView.backgroundColor = RGB(255, 255, 255);
    backView.layer.masksToBounds = YES;
    backView.layer.cornerRadius = LENGTH(10);
    [self.view addSubview:backView];
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.view).with.offset(LENGTH(0));
        make.left.equalTo(ws.view).with.offset(LENGTH(10));
        make.right.equalTo(ws.view).with.offset(-LENGTH(10));
        make.bottom.equalTo(ws.view).with.offset(-LENGTH(14));
    }];
    
    _tableView = [MedalListXqBookTableView new];
    _tableView.nav = self.navigationController;
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(ws.view).with.offset(0);
//        make.left.equalTo(ws.view).with.offset(LENGTH(17));
//        make.right.equalTo(ws.view).with.offset(-LENGTH(17));
//        make.bottom.equalTo(ws.view).with.offset(0);
        
        make.top.equalTo(backView).with.offset(LENGTH(0));
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
    _tableView.itemarray = _itemarray;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)setModel:(MedalListBadgeInfoModel *)model{
    _model = model;
    _tableView.model = model;
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
