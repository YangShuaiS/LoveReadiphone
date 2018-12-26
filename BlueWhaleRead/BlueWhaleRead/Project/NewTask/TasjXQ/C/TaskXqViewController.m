//
//  TaskXqViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/4.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "TaskXqViewController.h"
#import "TKXQTopView.h"
#import "TKXQRLView.h"
#import "TKXQGZView.h"
#import "TKXQOtherView.h"
@interface TaskXqViewController (){
    NSMutableArray *  viewarray;
    UIScrollView * scrollView;
    UIImageView * bakimageview;
    TKXQTopView * topview;
    UIImageView * backImage;
    TKXQRLView * rlview;//日历
    TKXQGZView * downview;
    TKXQOtherView * dowboolview;
}

@end

@implementation TaskXqViewController
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}
- (void)LoadData{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_NEWHOME];
    NSDictionary * dic = @{@"studentid":Me.ssid};
//        NSDictionary * dic = @{@"studentid":@"12"};
    
    
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            NewHomeModel * model = [NewHomeModel mj_objectWithKeyValues:responseObject];
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
- (void)UpData:(NewHomeModel *)model{
    
    _style = TaxkXqStyelenoviceingStyle;
//    _style = TaxkXqStyelenoviceendStyle;
//    _style = TaxkXqStyelenoviceendStyle;
//    _style = TaxkXqStyeUserOthering;
//    _style = TaxkXqStyeUserOtherend;
//    _style = TaxkXqStyeUserOtherfq;
//    _style = TaxkXqStyeOtherPeopleing;
//    _style = TaxkXqStyeOtherPeopleend;
//    _style = TaxkXqStyeOtherPeoplefa;
    
    if (_style == TaxkXqStyeOtherPeopleing || _style == TaxkXqStyeOtherPeopleend || _style ==TaxkXqStyeOtherPeoplefa) {
        [viewarray removeObject:downview];
    }else{
        [viewarray removeObject:dowboolview];
    }
    topview.style = _style;
    rlview.style = _style;
    downview.style = _style;
    [self layoutviews];
}
- (void)backImage{
    WS(ws);
    backImage = [UIImageView new];
    backImage.contentMode = UIViewContentModeScaleAspectFit;
    backImage.image = UIIMAGE(@"icon_返回_粗");
    [self.view addSubview:backImage];
    [backImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws.view).with.offset(StatusBar+13);
        make.left.mas_equalTo(ws.view).with.offset(LENGTH(12));
        make.width.mas_equalTo(12);
        make.height.mas_equalTo(22);
    }];
    
    UIView * tapview = [UIView new];
    [self.view addSubview:tapview];
    [tapview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.mas_equalTo(ws.view);
        make.height.mas_equalTo(NavHeight);
        make.width.mas_equalTo(LENGTH(50));
    }];
    tapview.userInteractionEnabled = YES;
    UITapGestureRecognizer * tapviewtap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backview)];
    //将手势添加到需要相应的view中去
    [tapview addGestureRecognizer:tapviewtap];
    
}
- (void)backview{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self LoadData];
    

    // Do any additional setup after loading the view.
}
- (void)layoutviews{
    WS(ws);
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
    [bakimageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.bottom.mas_equalTo(self->scrollView);
        make.left.and.right.mas_equalTo(ws.view);
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
