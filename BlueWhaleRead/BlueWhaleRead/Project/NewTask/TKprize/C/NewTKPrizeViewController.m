//
//  NewTKPrizeViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/3/28.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "NewTKPrizeViewController.h"
#import "TKPMenuView.h"

#import "NewTKPrizeLeftOneTableView.h"
#import "NewTKPrizeRightOneTableView.h"

@interface NewTKPrizeViewController ()<NavDelegate>
@property (strong, nonatomic) NewTKPrizeLeftOneTableView *tableView;
@property (strong, nonatomic) NewTKPrizeRightOneTableView *tableView1;

@end

@implementation NewTKPrizeViewController{
    UIImageView * imageview;
    TKPMenuView * menu;
    NSInteger weizhi;
}
#pragma mark --------------------  导航栏以及代理
- (void)AddNavtion{
    [super AddNavtion];
    WS(ws);
    self.navtive = [[NativeView alloc] initWithLeftImage:@"icon_返回_粗" Title:@"奖品列表" RightTitle:@"" NativeStyle:NavStyleGeneral];
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
    weizhi = 0;
    WS(ws);
    self.view.backgroundColor = [UIColor whiteColor];
    imageview = [UIImageView new];
    imageview.contentMode = UIViewContentModeScaleAspectFit;
    imageview.image = UIIMAGE(@"奖品列表");
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
    menu.titarray = @[@"本期奖品",@"往期奖品"];
    
    _tableView = [NewTKPrizeLeftOneTableView new];
    
    _tableView1 = [NewTKPrizeRightOneTableView new];
    menu.controllerArray = @[_tableView,_tableView1];
    [_tableView setBlocks:^(CGFloat floa) {
        [ws uoview:floa];
    }];
    [_tableView1 setBlocks:^(CGFloat floa) {
        [ws uoview:floa];
    }];
    [self LoadData];
}
- (void)LoadData{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_JPLIST];
    NSDictionary * dic = @{@"studentid":Me.ssid,@"missionid":@"1"};
    //    NSDictionary * dic = @{@"studentid":@"12",@"missionid":@"1"};
    
    
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            TKPrizeModel * model = [TKPrizeModel mj_objectWithKeyValues:responseObject];
            if ([model.code isEqual:@200]) {
                [self UpData:model];
            }else if ([model.code isEqual:@Notloggedin]){
                [self UpDengLu];
            }
        }else{
        }
    }];
}
- (void)UpData:(TKPrizeModel *)model{
    NSMutableArray * itemarray = model.oldPrizeList;
    _tableView.itemArray = model.prizeList;
    _tableView1.itemArray = itemarray;

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
