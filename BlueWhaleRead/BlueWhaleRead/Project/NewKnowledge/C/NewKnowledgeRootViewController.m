//
//  NewKnowledgeRootViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/2/14.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "NewKnowledgeRootViewController.h"
#import "NKRLbtView.h"
#import "NKRClassificationView.h"
#import "NKRHotKnowledgeView.h"
#import "NKRRecommendedView.h"
#import "NKRRecTowTitleView.h"
#import "NKRBookTJView.h"
#import "NKRWenzhangView.h"
@interface NewKnowledgeRootViewController (){
    UIScrollView * scrollView;
    NSMutableArray *  viewarray;

    NKRLbtView * channel;
    NKRClassificationView *NKRCView;
    NKRHotKnowledgeView * hotkledge;
    NKRRecommendedView * recommended;
    NKRRecTowTitleView * rectowtitle;
    NKRBookTJView * booktj;
    NKRWenzhangView * wztj;
}

@end

@implementation NewKnowledgeRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self Addview];
}
- (void)Addview{
    WS(ws);
    viewarray = [NSMutableArray array];
    scrollView = [UIScrollView new];
    [self.view addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.view).with.offset(0);
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.bottom.equalTo(ws.view).with.offset(0);
    }];
    scrollView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headRefresh)];
    
    channel = [NKRLbtView new];
    [viewarray addObject:channel];
    
    NKRCView = [NKRClassificationView new];
    [viewarray addObject:NKRCView];
    
    hotkledge = [NKRHotKnowledgeView new];
    [viewarray addObject:hotkledge];
    
    recommended = [NKRRecommendedView new];
    [viewarray addObject:recommended];
    
    rectowtitle = [NKRRecTowTitleView new];
    [viewarray addObject:rectowtitle];
    
    booktj = [NKRBookTJView new];
    [viewarray addObject:booktj];

    wztj = [NKRWenzhangView new];
    [viewarray addObject:wztj];

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
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_ZHISHIWANGSHOUYE];
    NSDictionary * dic = @{@"studentid":Me.ssid};
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            NewKnowledgeModel * model = [NewKnowledgeModel mj_objectWithKeyValues:responseObject];
            if ([model.code isEqual:@200]) {
                [self UpData:model];
            }else if ([model.code isEqual:@Notloggedin]){
                [self UpDengLu];
            }
            [self->scrollView.mj_header endRefreshing];
            [self->scrollView.mj_footer endRefreshing];
        }else{
            [self->scrollView.mj_header endRefreshing];
            [self->scrollView.mj_footer endRefreshing];
        }
    }];
}
- (void)UpData:(NewKnowledgeModel *)model{
    channel.itemArray = model.bannerList;
    NKRCView.itemArray = model.knowledgeData;
    hotkledge.allpage = [model.hotKnowledgeNum integerValue];
    hotkledge.itemArray = model.hotKnowledge;
    recommended.itemArray = model.myHistory;
    rectowtitle.itemArray = model.relatedRecommendations;
    booktj.itemarray = model.bookList;
    wztj.itemarray = model.goodBannerList;
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
