//
//  NewMyClassViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/3/19.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "NewMyClassViewController.h"
@interface NewMyClassViewController ()

@end

@implementation NewMyClassViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    WS(ws);
    _tableView = [NBXQMyClassTableView new];
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws.view);
    }];
    __weak NewMyClassViewController * blockSelf = self;
    [_tableView setBlocks:^(CGFloat floa, BOOL end) {
        blockSelf.blocks(floa, end);
    }];

    _tableView.itemarray = _itemarray;

}
- (void)setItemarray:(NSMutableArray *)itemarray{
    _itemarray = itemarray;
    
}

- (void)setInter:(NSInteger)inter{
    _inter = inter;
//    _tableView.inter = inter;
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
