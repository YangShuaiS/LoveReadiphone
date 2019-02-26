//
//  SearchAllViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/2/14.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "SearchAllViewController.h"
#import "SearchAllTableView.h"
@interface SearchAllViewController ()

@end

@implementation SearchAllViewController{
    SearchAllTableView * tableview;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    WS(ws);
    tableview = [SearchAllTableView new];
    [self.view addSubview:tableview];
    [tableview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws.view);
    }];
    ALLSearchModel * mo = [ALLSearchModel new];
    mo.bannerdata = [NSMutableArray array];
    mo.bookdata = [NSMutableArray array];
    mo.knowledgedata = [NSMutableArray array];
    tableview.model = mo;
    [tableview setBlock:^(NSString * _Nonnull string) {
        ws.block(string);
    }];
    [tableview setPushblock:^(NSInteger inter) {
        ws.pushblock(inter);
    }];
    
}
- (void)setModel:(ALLSearchModel *)model{
    _model = model;
    tableview.model = _model;
}
@end
