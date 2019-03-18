//
//  ClassroomViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/3/8.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "ClassroomViewController.h"
#import "ClassroomView.h"
@interface ClassroomViewController ()

@end

@implementation ClassroomViewController{
    ClassroomView * dlview;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    WS(ws);
    BaseLabel * label = [[BaseLabel alloc] initWithTxteColor:RGB(51, 51, 51) LabelFont:TextFont(18) TextAlignment:NSTextAlignmentCenter Text:@"尚未布置作业"];
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(ws.view);
    }];
    
    dlview = [ClassroomView new];
    [self.view addSubview:dlview];
    [dlview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws.view);
    }];
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
