//
//  NBCFreeBookViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/4/15.
//  Copyright © 2019 YS. All rights reserved.
//

#import "NBCFreeBookViewController.h"
#import "BookTableView.h"
@interface NBCFreeBookViewController ()<NavDelegate>
@property (strong, nonatomic) BookTableView *tableView;

@end

@implementation NBCFreeBookViewController
#pragma mark --------------------  导航栏以及代理
- (void)AddNavtion{
    [super AddNavtion];
    WS(ws);
    self.navtive = [[NativeView alloc] initWithLeftImage:@"backhei" Title:@"本周可免费阅读图书" RightTitle:@"" NativeStyle:NavStyleGeneral];
    self.navtive.titcolor = RGB(0, 0, 0);
    self.navtive.delegate = self;
    [self.view addSubview:self.navtive];
    [ws.navtive mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.top.equalTo(ws.view).with.offset(0);
        make.height.mas_equalTo(NavHeight);
    }];
    self.navtive.downlayer = YES;
}

- (void)NavLeftClick{
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)NavCenterClick {
    
}


- (void)NavRightClick {
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self AddNavtion];
    self.view.backgroundColor = [UIColor whiteColor];
    WS(ws);
    _tableView = [BookTableView new];
    _tableView.nav = self.navigationController;
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.navtive.mas_bottom).with.offset(1);
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.bottom.equalTo(ws.view);
    }];
    [_tableView setBlock:^(CGFloat flo) {
    }];
    _tableView.itemarray = _itemArray;
}
- (void)setItemArray:(NSMutableArray *)itemArray{
    _itemArray = itemArray;
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
