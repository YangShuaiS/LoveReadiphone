//
//  MedalLQXSViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/13.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "MedalLQXSViewController.h"
#import "MedalXQLQXSTableView.h"
@interface MedalLQXSViewController ()
@property (strong, nonatomic) MedalXQLQXSTableView *tableView;

@end

@implementation MedalLQXSViewController{
    GeneraNoDataView * wdView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    WS(ws);
    _tableView = [MedalXQLQXSTableView new];
    _tableView.nav = self.navigationController;
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.view).with.offset(LENGTH(0));
        make.left.equalTo(ws.view).with.offset(LENGTH(8));
        make.right.equalTo(ws.view).with.offset(-LENGTH(8));
        make.bottom.equalTo(ws.view).with.offset(-LENGTH(15));
    }];
    [_tableView setBlock:^(CGFloat flo) {
        ws.block(flo);
    }];
}

- (void)setBooknumber:(NSInteger)Booknumber{
    _Booknumber = Booknumber;
    _tableView.Booknumber = Booknumber;
}
- (void)setItemarray:(NSMutableArray *)itemarray{
    _itemarray = itemarray;
    if (_itemarray.count == 0) {
        if (wdView == nil) {
            [self addShaFa];
        }
    }else{
        if (wdView != nil) {
            [wdView removeFromSuperview];
        }
        _tableView.itemarray = itemarray;
    }
}
- (void)addShaFa{
    WS(ws);
    wdView = [GeneraNoDataView new];
    wdView.backgroundColor = WhitColor;
    wdView.image = @"icon_没有同学";
    wdView.titlename = @"快来成为第一个点亮勋章的同学吧！";
    wdView.style = NoDtaaViewStyleImageLabel;
    [self.view addSubview:wdView];
    [wdView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws.view);
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
