//
//  ViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/7.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
//初始化位置
- (void)ConfirmTheSize{
    UIView *statusBar = STAUBARHEIGHT;
    StatusBar = statusBar.frame.size.height;
    NavHeight = StatusBar+NAVIGATIONHeight;
    poinw = WIDTH/16;
    TabBarHeight = TABBARHeight;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self ConfirmTheSize];
    self.view.backgroundColor = [UIColor redColor];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
