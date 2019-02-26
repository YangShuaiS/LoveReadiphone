//
//  SearchBookJiViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/2/15.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "SearchBookJiViewController.h"
#import "SearchXGBookTableView.h"
@interface SearchBookJiViewController ()

@end

@implementation SearchBookJiViewController{
    SearchXGBookTableView * tableview;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    WS(ws);
    tableview = [SearchXGBookTableView new];
    [self.view addSubview:tableview];
    [tableview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws.view);
    }];
}
-(void)setModel:(ALLSearchModel *)model{
    _model = model;
    tableview.itemarray = model.bookdata;
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
