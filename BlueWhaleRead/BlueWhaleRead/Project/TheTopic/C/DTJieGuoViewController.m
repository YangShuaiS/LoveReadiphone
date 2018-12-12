//
//  DTJieGuoViewController.m
//  BoWanJuanForPad
//
//  Created by 杨帅 on 2018/5/25.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "DTJieGuoViewController.h"
#import "TiaoZHanJieGuoView.h"
#import "ChaKanCuoTiViewController.h"
#import "BookCityViewController.h"
#import "BookListViewController.h"
#import "DtJieGuoTopView.h"//答题结果上面

@interface DTJieGuoViewController ()
@end

@implementation DTJieGuoViewController{
    DtJieGuoTopView * TopView;
    FLAnimatedImageView * topImageView;
    
    
    BaseLabel * AllTime;
    BaseLabel * AllJiFen;
    TiaoZHanJieGuoView * TZJG;
    BaseLabel * OneLabel;
    BaseLabel * TwoLabel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGB(255, 255, 255);
    [self AddView];
//    [self LoadData];

    // Do any additional setup after loading the view.
}
//- (void)LoadData{
//    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_TJTIDAAN];
//    [[BaseAppRequestManager manager] getNormaldataURL:url dic:nil andBlock:^(id responseObject, NSError *error) {
//        if (responseObject) {
//            TKJIEGUOMODEL * model = [TKJIEGUOMODEL mj_objectWithKeyValues:responseObject];
//            if ([model.code isEqual:@200]) {
//                [self UpData:model];
//            }
//
//
//        }else{
//
//        }
//    }];
//}

//- (void)UpData:(TKJIEGUOMODEL *)model{
//
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)NavLeftClick {
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }

}
#pragma mark --------------------  导航栏以及代理
- (void)addtitle{
    
    WS(ws);
    BaseLabel * title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255, 255, 255) LabelFont:TextFont(20) TextAlignment:NSTextAlignmentCenter Text:@"答题结果"];
    [self.view addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(ws.view);
        make.top.mas_equalTo(ws.view).with.offset(StatusBar+8);
    }];

}
#pragma mark --------------------  添加视图
- (void)AddView{
    WS(ws);
//    DTJieGuoModel * model = [DTJieGuoModel new];
//    model.have = _model.challengeTime;
//    model.style = _model.isPassed;
    TopView = [DtJieGuoTopView new];
    TopView.nav = self.navigationController;
    TopView.bookfenshu = _bookfenshu;
    TopView.secont = _secont;
    TopView.cuotiarray = _timuarray;
    TopView.nav = self.navigationController;
    TopView.models = _model;
    [self.view addSubview:TopView];
    [TopView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws.view);
    }];
    
    [self addtitle];
    
   
}
- (void)tapGesture1{
    ChaKanCuoTiViewController * vc = [ChaKanCuoTiViewController new];
    vc.style = _style;
    vc.cuotiarray = _timuarray;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)setTimuarray:(NSMutableArray *)timuarray{
    _timuarray = timuarray;
}
- (void)setModel:(TKJIEGUOMODEL *)model{
    _model = model;
}

//-(void)viewDidAppear:(BOOL)animated {
//    [super viewDidAppear:animated];
//    if([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
//        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
//    }
//}
@end
