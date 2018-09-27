//
//  MedalListViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/13.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "MedalListViewController.h"
#import "MedalListTableView.h"

#import "DTJieGuoViewController.h"
#import "ChaKanCuoTiViewController.h"
#import "DTALLiewController.h"

@interface MedalListViewController ()<NavDelegate>
@property (strong, nonatomic) MedalListTableView *tableView;

@end

@implementation MedalListViewController{
    NSString * title;
}
- (void)UPDATA{
    switch (_style) {
        case ViewControllerStyleXZXQ:
            title = @"全部勋章";
            [self LoadData:1];
            break;
        case ViewControllerStyleXQAH:
            title = @"兴趣小组";
            break;
        default:
            break;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = BEIJINGCOLOR;
    
    //确保书架前面控制器不会出现查看错题，答题结果,答题也
    NSMutableArray *marr = [[NSMutableArray alloc]initWithArray:self.navigationController.viewControllers];
    //删除完再从新赋值，防止崩溃
    NSMutableArray * navarr = [NSMutableArray array];
    [navarr addObjectsFromArray:marr];
    for (UIViewController *vc in marr) {
        if ([vc isKindOfClass:[DTJieGuoViewController class]]) {
            [navarr removeObject:vc];
        }
        if ([vc isKindOfClass:[ChaKanCuoTiViewController class]]) {
            [navarr removeObject:vc];
        }
        if ([vc isKindOfClass:[DTALLiewController class]]) {
            [navarr removeObject:vc];
        }
    }
    self.navigationController.viewControllers = navarr;
    
    [self UPDATA];
    [self AddNavtion];
    WS(ws);
    _tableView = [MedalListTableView new];
    _tableView.nav = self.navigationController;
    _tableView.viewstyle = _style;
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.navtive.mas_bottom).with.offset(0);
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.bottom.equalTo(ws.view).with.offset(0);
    }];
}
#pragma mark --------------------  导航栏以及代理
- (void)AddNavtion{
    [super AddNavtion];
    
    WS(ws);
    self.navtive = [[NativeView alloc] initWithLeftImage:@"icon_返回_粗" Title:title RightTitle:@"" NativeStyle:NavStyleGeneral];
    self.navtive.delegate = self;
    [self.view addSubview:self.navtive];
    [ws.navtive mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.top.equalTo(ws.view).with.offset(0);
        make.height.mas_equalTo(NavHeight);
    }];
    
}
- (void)NavLeftClick{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)NavCenterClick {
}


- (void)NavRightClick {
}

- (void)LoadData:(NSInteger)page{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_XUNZHANGLIST];
    NSDictionary * dic = @{@"studentid":Me.ssid};
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            MedalListModel * model = [MedalListModel mj_objectWithKeyValues:responseObject];
            if ([model.code isEqual:@200]) {
                [self UpData:model];
            }
        }else{
            
        }
    }];
}
- (void)UpData:(MedalListModel *)model{
    _tableView.itemarray = model.badgeList;
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
