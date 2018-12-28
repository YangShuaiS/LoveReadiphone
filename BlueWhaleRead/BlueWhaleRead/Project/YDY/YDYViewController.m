//
//  YDYViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/28.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "YDYViewController.h"
#import "YDYView.h"
@interface YDYViewController ()

@end

@implementation YDYViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    WS(ws);
    YDYView * view = [YDYView new];
    [self.view addSubview:view];
    //    [self.window bringSubviewToFront:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws.view);
    }];

    // Do any additional setup after loading the view.
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
