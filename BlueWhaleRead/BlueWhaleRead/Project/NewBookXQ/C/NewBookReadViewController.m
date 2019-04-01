//
//  NewBookReadViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/3/19.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "NewBookReadViewController.h"

@interface NewBookReadViewController ()

@end

@implementation NewBookReadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    WS(ws);
    _tableView = [NBXQReadTableView new];
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws.view);
    }];
    [_tableView setBlocks:^(CGFloat floa, BOOL end) {
        ws.blocks(floa, end);
    }];
    _tableView.itemarray = _itemarray;
    
}
- (void)setItemarray:(NSMutableArray *)itemarray{
        _itemarray = itemarray;
//    _itemarray = [NSMutableArray array];
//    for (int i = 0; i < 1000; i++) {
//        [_itemarray addObjectsFromArray:itemarray];
//    }
    
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
