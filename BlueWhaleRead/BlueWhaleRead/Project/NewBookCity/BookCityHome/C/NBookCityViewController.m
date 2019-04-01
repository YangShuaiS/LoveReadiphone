//
//  NBookCityViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/6.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "NBookCityViewController.h"
#import "NBCchannelLBTView.h"
#import "NBCchannelView.h"
#import "NBCGoodBoookListTabView.h"
#import "NBCweekReadingView.h"
#import "NBClistAllView.h"
#import "NBCclassificationView.h"

#import "GuideBookCityOneView.h"
#import "GuideBookCityTwoView.h"
#import "GuideBookCityThreeView.h"

#import "NewHpViewModel.h"
@interface NBookCityViewController ()<UIScrollViewDelegate>

@end

@implementation NBookCityViewController{
    UIScrollView * scrollView;
    NSMutableArray *  viewarray;
    
    NBCchannelLBTView * channel;
    NBCGoodBoookListTabView * goodbook;
    NBCweekReadingView * cweek;
    NBClistAllView * List;
    NBCclassificationView * classification;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self Addview];
}

- (void)Addview{
    WS(ws);
    viewarray = [NSMutableArray array];
    scrollView = [UIScrollView new];
    scrollView.delegate = self;
    [self.view addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.view).with.offset(0);
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.bottom.equalTo(ws.view).with.offset(0);
    }];
    scrollView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headRefresh)];

    
    channel = [NBCchannelLBTView new];
    [viewarray addObject:channel];
    
    classification = [NBCclassificationView new];
    classification.nav = self.navigationController;
    [viewarray addObject:classification];
    
    cweek = [NBCweekReadingView new];
    cweek.nav = self.navigationController;
    [viewarray addObject:cweek];
    
    List = [NBClistAllView new];
    List.nav = self.navigationController;
    [viewarray addObject:List];
    
    goodbook = [NBCGoodBoookListTabView new];
    goodbook.nav = self.navigationController;
    [viewarray addObject:goodbook];
    

    BaseView * lastview;
    for (int i = 0; i < viewarray.count; i++) {
        BaseView * view = viewarray[i];
        [scrollView addSubview:view];
        if (!lastview) {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self->scrollView.mas_top).with.offset(0);
                make.left.equalTo(ws.view).with.offset(0);
                make.right.equalTo(ws.view).with.offset(0);
            }];
        }else{
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(ws.view).with.offset(0);
                make.right.equalTo(ws.view).with.offset(0);
                if (i == 1) {
                    make.top.equalTo(lastview.mas_bottom).with.offset(LENGTH(0));
                }else{
                    make.top.equalTo(lastview.mas_bottom).with.offset(LENGTH(0));
                }
            }];
        }
        if (i == viewarray.count-1) {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.bottom.equalTo(self->scrollView.mas_bottom).with.offset(0);
            }];
        }
        lastview = view;
    }
    [self LoadData];
}
#pragma mark - 下拉刷新
- (void)headRefresh{
    [self LoadData];
}
- (void)LoadData{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_NBCHOME];
    NSDictionary * dic = @{@"studentid":Me.ssid};
    
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            NBCALLModel * model = [NBCALLModel mj_objectWithKeyValues:responseObject];
            if ([model.code isEqual:@200]) {
                [self UpData:model];
            }else if ([model.code isEqual:@Notloggedin]){
                [self UpDengLu];
            }
            [self->scrollView.mj_header endRefreshing];
        }else{
            [self->scrollView.mj_header endRefreshing];
        }
    }];
}
- (void)UpData:(NBCALLModel *)model{
    channel.model = model;
    goodbook.model = model;
    cweek.model = model;
    List.model = model;
    classification.model = model;
    [self.view.superview layoutIfNeeded];
    if ([[[BaseObject jsd_getCurrentViewController] class] isEqual:[self class]]) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            [self addGuideBookCityOneView];
        });
    }
}
- (void)addGuideBookCityOneView{
    NSString *filePatch = [BaseObject AddPathName:[NSString stringWithFormat:@"%@.plist",BENDIXINXI]];
    NSMutableDictionary *dataDictionary = [BaseObject BenDiXinXi];
    NewHpViewModel * model = [NewHpViewModel mj_objectWithKeyValues:dataDictionary];
    if ([model.ydybookcity integerValue]<3) {
        WS(ws);
        GuideBookCityOneView * view = [GuideBookCityOneView new];
         [[[[UIApplication sharedApplication] delegate] window] addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo([[[UIApplication sharedApplication] delegate] window]);
        }];
        [view setBlock:^{
            [ws addGuideBookCityTwoView];
        }];
        
        NSString * str = [NSString stringWithFormat:@"%ld",[model.ydybookcity integerValue]+1];
        [dataDictionary setValue:str forKey:@"ydybookcity"];
        [dataDictionary writeToFile:filePatch atomically:YES];
    }
}
- (void)addGuideBookCityTwoView{
    WS(ws);
    GuideBookCityTwoView * view = [GuideBookCityTwoView new];
    view.frames = channel.frame;
    [[[[UIApplication sharedApplication] delegate] window] addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo([[[UIApplication sharedApplication] delegate] window]);
    }];
    [view setBlock:^{
        [ws addGuideBookCityThreeView];
    }];
}

- (void)addGuideBookCityThreeView{
    
    [scrollView setContentOffset:CGPointMake(0, (cweek.frame.origin.y+cweek.frame.size.height)-scrollView.frame.size.height) animated:YES];
    GuideBookCityThreeView * view = [GuideBookCityThreeView new];
    view.frames = cweek.frame;
    [[[[UIApplication sharedApplication] delegate] window] addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo([[[UIApplication sharedApplication] delegate] window]);
    }];
    [view setBlock:^{
    }];
}


@end
