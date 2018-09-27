//
//  FoundViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/8.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "FoundViewController.h"
#import "FoundBanjiView.h"
#import "FoundYouClassView.h"
#import "FoundClassRankingView.h"
#import "FoundClassLoveView.h"
#import "FoundOliverView.h"
@interface FoundViewController ()<UIScrollViewDelegate,NavDelegate>{
    UIScrollView * scrollView;
    NSMutableArray *  viewarray;
    
    FoundBanjiView * banJiview;
    FoundYouClassView * youClass;
    FoundClassRankingView * classRanking;
    FoundClassLoveView * classlove;
    FoundOliverView * oliver;
}

@end

@implementation FoundViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self AddNavtion];
    [self Addview];

    [self loadUpData];
}
- (void)loadUpData{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_FOUND];
    NSDictionary * dic = @{@"studentid":Me.ssid};
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            FoundModel * model = [FoundModel mj_objectWithKeyValues:responseObject];
            if ([model.code isEqual:@200]) {
                [self UpData:model];
            }
        }else{

        }
    }];
}

- (void)UpData:(FoundModel *)model{

    banJiview.itemarray = model.studentFriendList;
    if (model.myFriendBookList.count == 0) {
        [viewarray removeObject:youClass];
    }else{
        youClass.itemarray = model.myFriendBookList;
    }
    if (model.monthBadgeList.studentList.count == 0) {
        [viewarray removeObject:classRanking];
    }else{
        classRanking.monthBadgeList = model.monthBadgeList;
    }
    if (model.classBookList.count==0) {
        [viewarray removeObject:classlove];
    }else{
        classlove.itemarray = model.classBookList;
    }
    oliver.itemarray = model.bookThoughtList;
    
    [self ViewLaout];
    [self.view.superview layoutIfNeeded];

//    [self ViewLaout];

}
#pragma mark --------------------  导航栏以及代理
- (void)AddNavtion{
    [super AddNavtion];
    WS(ws);
    self.navtive = [[NativeView alloc] initWithLeftImage:@"home-Click" Title:@"发现" RightTitle:@"home-Click" NativeStyle:NacStyleFound];
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
}

- (void)NavCenterClick {
    
}


- (void)NavRightClick {
    
}

- (void)Addview{
    self.automaticallyAdjustsScrollViewInsets = NO;
    scrollView = [UIScrollView new];
    scrollView.backgroundColor = BEIJINGCOLOR;
    scrollView.delegate = self;
    scrollView.userInteractionEnabled = YES;
    [self.view addSubview:scrollView];
    
    viewarray = [NSMutableArray array];
    
    banJiview = [FoundBanjiView new];
    banJiview.nav = self.navigationController;
    [viewarray addObject:banJiview];
    
    youClass = [FoundYouClassView new];
    youClass.nav = self.navigationController;
    [viewarray addObject:youClass];
    
    classRanking = [FoundClassRankingView new];
    classRanking.styles = RankingStyleAll;
    classRanking.nav = self.navigationController;
    [viewarray addObject:classRanking];
    
    classlove = [FoundClassLoveView new];
    classlove.nav = self.navigationController;
    [viewarray addObject:classlove];
     
    oliver = [FoundOliverView new];
    oliver.nav = self.navigationController;
    [viewarray addObject:oliver];
}

- (void)ViewLaout{
    WS(ws);
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.navtive.mas_bottom).with.offset(0);
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.bottom.equalTo(ws.view).with.offset(-TabBarHeight);
    }];
    
    BaseView * lastview;
    for (int i = 0; i < viewarray.count; i++) {
        BaseView * view = viewarray[i];
        [scrollView addSubview:view];
        if (!lastview) {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                //                make.left.equalTo(self->scrollView.mas_left).with.offset(0);
                //                make.right.equalTo(self->scrollView.mas_right).with.offset(0);
                make.top.equalTo(self->scrollView.mas_top).with.offset(0);
                //                make.top.equalTo(ws.view).with.offset(0);
                make.left.equalTo(ws.view).with.offset(0);
                make.right.equalTo(ws.view).with.offset(0);
                make.height.mas_equalTo(LENGTH(166));
            }];
        }else{
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(ws.view).with.offset(0);
                make.right.equalTo(ws.view).with.offset(0);
                make.top.equalTo(lastview.mas_bottom).with.offset(LENGTH(10));
            }];
        }
        if (i == viewarray.count-1) {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.bottom.equalTo(self->scrollView.mas_bottom).with.offset(0);
            }];
        }
        lastview = view;
    }

    [classRanking mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(LENGTH(235));
    }];
    
//    classRanking.itemarray = arrs;
//    oliver.itemarray = arrs;
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
