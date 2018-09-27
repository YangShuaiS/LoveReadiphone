//
//  MingShiDDViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/12.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "MingShiDDViewController.h"
#import "MingShiDDTableView.h"
@interface MingShiDDViewController ()
@property (strong, nonatomic) MingShiDDTableView *tableView;

@end

@implementation MingShiDDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    WS(ws);

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
    
    _tableView = [MingShiDDTableView new];
    //因为是先请求的数据后创建视图
//    _tableView.layer.masksToBounds = YES;
//    _tableView.layer.cornerRadius = 15;
    _tableView.itemarray = _itemarray;
    [backView addSubview:_tableView];
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
