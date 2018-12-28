//
//  TKAlltaskViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/29.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "TKAlltaskViewController.h"
#import "TKAlltaskTableView.h"
#import "GuideTaskOneView.h"
#import "GuideTaskTwoView.h"
#import "GuideTaskThreeView.h"
#import "GuideTaskFourView.h"

#import "NewHpViewModel.h"
@interface TKAlltaskViewController ()<NavDelegate>
@property (strong, nonatomic) TKAlltaskTableView *tableView;

@end

@implementation TKAlltaskViewController
#pragma mark --------------------  导航栏以及代理
- (void)AddNavtion{
    [super AddNavtion];
    WS(ws);
    self.navtive = [[NativeView alloc] initWithLeftImage:@"backhei" Title:@"全部任务" RightTitle:@"" NativeStyle:NavStyleGeneral];
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
    [self LoadData];
    WS(ws);
    _tableView = [TKAlltaskTableView new];
    _tableView.nav = self.navigationController;
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws.navtive.mas_bottom);
        make.left.mas_equalTo(ws.view);
        make.right.mas_equalTo(ws.view);
        make.bottom.mas_equalTo(ws.view);
    }];
    // Do any additional setup after loading the view.
}

- (void)LoadData{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_ALLTASK];
    NSDictionary * dic = @{@"studentid":Me.ssid};
    //    NSDictionary * dic = @{@"studentid":@"12"};
    
    
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            TKAllTaskModel * model = [TKAllTaskModel mj_objectWithKeyValues:responseObject];
            if ([model.code isEqual:@200]) {
                [self UpData:model];
            }else if ([model.code isEqual:@Notloggedin]){
                [self UpDengLu];
            }
        }else{

        }
    }];
}
- (void)UpData:(TKAllTaskModel *)model{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
         [self addGuideTaskOneView];
    });
    _tableView.itemArray = model.missionList;
}
- (void)addGuideTaskOneView{
    NSString *filePatch = [BaseObject AddPathName:[NSString stringWithFormat:@"%@.plist",@"bendixinxi"]];
    NSMutableDictionary *dataDictionary = [BaseObject BenDiXinXi];
    NewHpViewModel * model = [NewHpViewModel mj_objectWithKeyValues:dataDictionary];
    if ([model.ydylqrw isEqualToString:@"0"]) {
        if ([model.ydyqbrw integerValue]<3) {
            WS(ws);
            GuideTaskOneView * view = [GuideTaskOneView new];
            [self.view.window addSubview:view];
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.mas_equalTo(ws.view.window);
            }];
            [view setBlock:^{
                [ws addGuideTaskTwoView];
            }];
            
            NSString * str = [NSString stringWithFormat:@"%ld",[model.ydyqbrw integerValue]+1];
            [dataDictionary setValue:str forKey:@"ydyqbrw"];
            [dataDictionary writeToFile:filePatch atomically:YES];
        }
    }else{
    }
}
- (void)addGuideTaskTwoView{
    WS(ws);
    GuideTaskTwoView * view = [GuideTaskTwoView new];
    [self.view.window addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws.view.window);
    }];
    [view setBlock:^{
        [ws addGuideTaskThreeView];
    }];
}
- (void)addGuideTaskThreeView{
    WS(ws);
    GuideTaskThreeView * view = [GuideTaskThreeView new];
    [self.view.window addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws.view.window);
    }];
    [view setBlock:^{
        [ws addGuideTaskFourView];
    }];
}

- (void)addGuideTaskFourView{
    WS(ws);
    GuideTaskFourView * view = [GuideTaskFourView new];
    [self.view.window addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws.view.window);
    }];
    [view setBlock:^{
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
