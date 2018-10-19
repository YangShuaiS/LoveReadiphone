//
//  ZhiShiShuShuViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/9/29.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "ZhiShiShuShuViewController.h"
#import "ZhiShiShuScroVuew.h"

@interface ZhiShiShuShuViewController (){
    ZhiShiShuScroVuew * scroview;
}

@end

@implementation ZhiShiShuShuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    WS(ws);
    @autoreleasepool {
    scroview = [ZhiShiShuScroVuew new];
    scroview.nav = self.navigationController;
    [self.view addSubview:scroview];
    [scroview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws.view);
    }];
    }
    scroview.itemid = _itemid;

    // Do any additional setup after loading the view.
}
- (void)dealloc{
    [self.view.superview removeFromSuperview];
    [self.view removeFromSuperview];
    [scroview removeFromSuperview];
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
