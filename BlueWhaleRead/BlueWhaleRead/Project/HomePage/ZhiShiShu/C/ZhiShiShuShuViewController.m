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
    NSInteger stare;
    NSInteger end;
}

@end

@implementation ZhiShiShuShuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    WS(ws);
//    @autoreleasepool {
        self.view.backgroundColor = [UIColor whiteColor];
    scroview = [ZhiShiShuScroVuew new];
    scroview.nav = self.navigationController;
    [self.view addSubview:scroview];
    [scroview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws.view);
    }];
//    }
    scroview.itemid = _itemid;
    [scroview setBlock:^(CGRect frame) {
        
    }];

    // Do any additional setup after loading the view.
}
//- (void)qingchuhuancu:(UIControl*)Controls{
//    for (UIControl * control in Controls.subviews) {
//        if (control.subviews.count>0) {
//            [self qingchuhuancu:control];
//        }
//        [control removeFromSuperview];
//    }
//}
- (void)dealloc{
//    for (UIControl * control in self.view.subviews) {
//        if (control.subviews.count>0&&[control isKindOfClass:[BaseView class]]) {
//            [self qingchuhuancu:control];
//        }
//        [control removeFromSuperview];
//    }
    [self.view.superview removeFromSuperview];
    [self.view removeFromSuperview];
    [scroview.superview removeFromSuperview];
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
