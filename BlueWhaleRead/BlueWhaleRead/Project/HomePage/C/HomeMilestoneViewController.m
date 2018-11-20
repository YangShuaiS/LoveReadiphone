//
//  HomeMilestoneViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/11.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "HomeMilestoneViewController.h"
#import "HomeMilestBackView.h"
#import "BeiJingView.h"
#import "FenXiangView.h"
#import "HaiBaoView.h"
@interface HomeMilestoneViewController ()<NavDelegate,UIScrollViewDelegate>

@end

@implementation HomeMilestoneViewController{
    UIScrollView * scrollView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self AddNavtion];
    [self addview];
    [self.view addSubview:self.navtive];
}
#pragma mark --------------------  导航栏以及代理
- (void)AddNavtion{
    [super AddNavtion];
    WS(ws);
    self.navtive = [[NativeView alloc] initWithLeftImage:@"icon_返回_粗" Title:@"我的里程碑" RightTitle:@"" NativeStyle:NavStyleGeneral];
    self.navtive.delegate = self;
    [self.view addSubview:self.navtive];
    [ws.navtive mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.top.equalTo(ws.view).with.offset(0);
        make.height.mas_equalTo(NavHeight);
    }];
    
}
- (void)FenXiang{
    FenXiangView * fenxiang = [FenXiangView new];
    fenxiang.sharestyle = ShareStyleTag1;
    [self.view addSubview:fenxiang];
    WS(ws);
    [fenxiang mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws.view);
    }];
    [fenxiang setBlock:^(FenXiangModel *model, ShareStyle sharestyle) {
        [self addhabai:model Style:sharestyle];
    }];
}
- (void)addhabai:(FenXiangModel *)model Style:(ShareStyle)style{
    HaiBaoView * haibao = [HaiBaoView new];
    haibao.sharestyle = style;
    haibao.modes = model;
    [self.view addSubview:haibao];
    WS(ws);
    [haibao mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws.view);
    }];
}

- (void)NavLeftClick{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)addview{
    WS(ws);
    BeiJingView * backImageView = [BeiJingView new];
    [self.view addSubview:backImageView];
    [backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws.view);
    }];
    
    scrollView = [UIScrollView new];
    scrollView.backgroundColor = [UIColor clearColor];
    scrollView.delegate = self;
    scrollView.userInteractionEnabled = YES;
    [self.view addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws.view);
        make.right.mas_equalTo(ws.view);
        make.bottom.mas_equalTo(ws.view);
        make.top.mas_equalTo(ws.navtive.mas_bottom);
    }];
    [self LoadData];
}

- (void)LoadData{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_LICHENGBEI];
    NSDictionary * dic = @{@"studentid":Me.ssid};
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            LCBMilestone * model = [LCBMilestone mj_objectWithKeyValues:responseObject];
            [self UpData:model];
        }else{
            double delayInSeconds = 5.0;
            dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
            dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                [self LoadData];
            });
        }
    }];
    
}
- (void)UpData:(LCBMilestone *)model{
    WS(ws);
    
    if (model.milestone.count > 0) {
        FLAnimatedImageView * imageview = [FLAnimatedImageView new];
        imageview.image = UIIMAGE(@"告诉朋友");
        [self.navtive addSubview:imageview];
        [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(ws.navtive.mas_top).with.offset(StatusBar);
            make.right.mas_equalTo(ws.navtive.mas_right).with.offset(-20);
            make.size.mas_equalTo(imageview.image.size);
        }];
        imageview.userInteractionEnabled = YES;
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(FenXiang)];
        [imageview addGestureRecognizer:tap];
    }
    
    
    HomeMilestBackView * view = [HomeMilestBackView new];
    view.model = model;
    [scrollView addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self->scrollView.mas_bottom);
            make.left.mas_equalTo(ws.view);
            make.right.mas_equalTo(ws.view);
            make.top.equalTo(self->scrollView.mas_top);
        }];
        [scrollView layoutIfNeeded];
        [scrollView setContentOffset:CGPointMake(0,scrollView.contentSize.height-scrollView.frame.size.height) animated:YES];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
