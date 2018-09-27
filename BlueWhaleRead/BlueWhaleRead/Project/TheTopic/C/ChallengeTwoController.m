//
//  ChallengeTwoController.m
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/5/7.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "ChallengeTwoController.h"
#import "BookCityViewController.h"
#import "ReadTheArticle.h"
#import "DaTiClick.h"
#import "DTALLiewController.h"
#import "YDWZTimeView.h"

@interface ChallengeTwoController ()<NavDelegate,UIScrollViewDelegate>

@end

@implementation ChallengeTwoController{
    UIScrollView * scrollView;
    TXXunZhangModel * xunzhangmodel;
    YDWZTimeView * time;
    ReadTheArticle * read;
}
- (void)LoadData{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_TZXUNZHANG];
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:nil andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            xunzhangmodel = [TXXunZhangModel mj_objectWithKeyValues:responseObject];
            if ([xunzhangmodel.code isEqual:@200]) {
                [self UpData:xunzhangmodel];
            }
        }else{
            
        }
    }];
}
- (void)UpData:(TXXunZhangModel *)model{
    time.inter = model.article.use_time;
    read.model = model.article;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self AddNavtion];
    [self AddView];
    [self LoadData];
    // Do any additional setup after loading the view.
}
#pragma mark --------------------  导航栏以及代理
- (void)AddNavtion{
    [super AddNavtion];
    WS(ws);
    self.navtive = [[NativeView alloc] initWithLeftImage:@"home-Click" Title:@"阅读文章" RightTitle:@"" NativeStyle:NavStyleGeneral];
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
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    }
    UIViewController *controller = self.navigationController.viewControllers[self.navigationController.viewControllers.count-1-1];
    [self.navigationController popToViewController:controller animated:YES];

}

- (void)NavCenterClick {
    
}


- (void)NavRightClick {
    
}



- (void)AddView{
    WS(ws);
    scrollView = [UIScrollView new];
    scrollView.backgroundColor = BEIJINGCOLOR;
    scrollView.delegate = self;
    scrollView.userInteractionEnabled = YES;
    scrollView.bounces = NO;
    [self.view addSubview:scrollView];
    
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.navtive.mas_bottom).with.offset(0);
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.bottom.equalTo(ws.view).with.offset(0);
        
    }];
    
    FLAnimatedImageView * backImage = [FLAnimatedImageView new];
    backImage.backgroundColor = RANDOMCOLOR;
    [scrollView addSubview:backImage];

    time = [YDWZTimeView new];
    [self.view addSubview:time];
    [time mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.navtive.mas_bottom).with.offset(LENGTH(30));
        make.right.equalTo(ws.view).with.offset(-LENGTH(26));
        make.width.mas_equalTo(LENGTH(144));
    }];
    
    
    
    read = [ReadTheArticle new];
    [scrollView addSubview:read];
    [read mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.top.equalTo(self->scrollView.mas_top).with.offset(0);
    }];
    
    DaTiClick * click = [DaTiClick new];
    click.userInteractionEnabled = YES;
    [scrollView addSubview:click];
    [click mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->read.mas_bottom).with.offset(20);
        make.centerX.mas_equalTo(ws.view);
        make.bottom.equalTo(self->scrollView.mas_bottom).with.offset(0);
        make.width.mas_equalTo(LENGTH(207));
    }];
    [click.button addTarget:self action:@selector(button) forControlEvents:UIControlEventTouchUpInside];

    [backImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(ws.view).with.offset(0);
            make.right.equalTo(ws.view).with.offset(0);
            make.top.equalTo(self->scrollView.mas_top).with.offset(0);
            make.bottom.equalTo(self->scrollView.mas_bottom).with.offset(0);
    }];
    
}
- (void)button{
    [time EndTime];
    DTALLiewController * vc = [DTALLiewController new];
    vc.style = DTXunZhangStyle;
    vc.titles = @"挑战答题";
    vc.itemarray = xunzhangmodel.article.questionList;
    [self.navigationController pushViewController:vc animated:YES];
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
