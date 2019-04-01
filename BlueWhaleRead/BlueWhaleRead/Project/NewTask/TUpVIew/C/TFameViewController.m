//
//  TFameViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/30.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "TFameViewController.h"
#import "TKPMenuView.h"
#import "TPHBViewController.h"
#import "NewTFameTableView.h"
@interface TFameViewController ()<NavDelegate>

@end

@implementation TFameViewController{
    UIImageView * imageview;
    TKPMenuView * menu;
    NSInteger weizhi;
}
#pragma mark --------------------  导航栏以及代理
- (void)AddNavtion{
    [super AddNavtion];
    WS(ws);
    self.navtive = [[NativeView alloc] initWithLeftImage:@"icon_返回_粗" Title:@"名人堂" RightTitle:@"" NativeStyle:NavStyleGeneral];
    self.navtive.titcolor = RGB(255, 255, 255);
    self.navtive.delegate = self;
    [self.view addSubview:self.navtive];
    [ws.navtive mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.top.equalTo(ws.view).with.offset(0);
        make.height.mas_equalTo(NavHeight);
    }];
    self.navtive.backgroundColor = [UIColor clearColor];
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
    self.view.backgroundColor = [UIColor whiteColor];
    weizhi = 0;
    WS(ws);
    self.view.backgroundColor = [UIColor whiteColor];
    imageview = [UIImageView new];
    imageview.contentMode = UIViewContentModeScaleAspectFit;
    imageview.image = UIIMAGE(@"名人堂-头图");
    [self.view addSubview:imageview];
    [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.and.right.mas_equalTo(ws.view);
        make.height.mas_equalTo(LENGTH(343));
    }];
    [self AddNavtion];
    
    menu = [TKPMenuView new];
    menu.layer.masksToBounds = YES;
    menu.layer.cornerRadius = LENGTH(10);
    [self.view addSubview:menu];
    [menu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws.view).with.offset(LENGTH(335));
        make.left.and.right.and.bottom.mas_equalTo(ws.view);
    }];
    
    menu.titarray = @[@"实时",@"往期"];
    NewTFameTableView * tableview1 = [NewTFameTableView new];
    tableview1.missionid = _missionid;
    tableview1.type = @"1";
    NewTFameTableView * tableview2 = [NewTFameTableView new];
    tableview2.missionid = _missionid;
    tableview2.type = @"2";
    menu.controllerArray = @[tableview1,tableview2];
    [tableview1 setBlocks:^(CGFloat floa) {
        [ws uoview:floa];
    }];
    [tableview2 setBlocks:^(CGFloat floa) {
        [ws uoview:floa];
    }];
}
-(void)uoview:(CGFloat)flo{
    WS(ws);
    if (flo<0 && weizhi == 1) {
        weizhi = 0;
        [UIView animateWithDuration:0.5 animations:^{
            [self->menu mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(ws.view).with.offset(LENGTH(335));
            }];
            [ws.view.superview layoutIfNeeded];
        } completion:^(BOOL finished) {
            
        }];
        
    }else if (flo>0 && weizhi == 0){
        weizhi = 1;
        [UIView animateWithDuration:0.5 animations:^{
            [self->menu mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(ws.view).with.offset(NavHeight);
            }];
            [ws.view.superview layoutIfNeeded];
        } completion:^(BOOL finished) {
            
        }];
        
    }
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
