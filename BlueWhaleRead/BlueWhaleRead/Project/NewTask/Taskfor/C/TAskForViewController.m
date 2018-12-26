//
//  TAskForViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/4.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "TAskForViewController.h"
#import "TAKTopVIew.h"

#import "TakTaskJSView.h"
#import "TAKprizeView.h"
#import "TAKGZView.h"
#import "TakSZView.h"

#import "TKXQTopView.h"
#import "TKXQRLView.h"
#import "TKXQGZView.h"
#import "TKXQOtherView.h"
@interface TAskForViewController ()<NavDelegate>
@property(nonatomic,assign)TaxkXqStyele style;

@end

@implementation TAskForViewController{
    UIScrollView * scrollView;
    NSMutableArray *  viewarray;
    
    TAKTopVIew * topview;
    
    UIImageView * topimageview;
    UIView * baskview;

    TakTaskJSView * TKJS;
    TAKprizeView * jp;//奖品
    TAKGZView * gz;//规则
    TakSZView * sz;//设置

    UIImageView * bakimageview;
    TKXQTopView * topxqview;
    UIImageView * backImage;
    TKXQRLView * rlview;//日历
    TKXQGZView * downview;
    TKXQOtherView * dowboolview;

}
#pragma mark --------------------  导航栏以及代理
- (void)AddNavtion{
    [super AddNavtion];
    WS(ws);
    if (_navtitle == nil) {
        _navtitle = @"";
    }
    self.navtive = [[NativeView alloc] initWithLeftImage:@"backhei" Title:_navtitle RightTitle:@"" NativeStyle:NavStyleGeneral];
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

- (void)LoadData{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_TASKXQ];
    if (_friendid == nil) {
        _friendid = @"";
    }
    NSDictionary * dic = [NSDictionary dictionary];
    if ([_weizhi isEqualToString:@"1"]) {
        dic = @{@"studentid":Me.ssid,@"type":_type,@"missionid":_missionid,@"friendid":_friendid,@"type":@"3",@"studentMissionid":@""};
        
    }else{
        dic = @{@"studentid":Me.ssid,@"type":_type,@"missionid":_missionid,@"friendid":_friendid};
    }
    //    NSDictionary * dic = @{@"studentid":@"12"};
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            TAKALLModel * model = [TAKALLModel mj_objectWithKeyValues:responseObject];
            if ([model.code isEqual:@200]) {
                [self UpData:model];
            }else if ([model.code isEqual:@Notloggedin]){
                [self UpDengLu];
            }
        }else{
            
        }
    }];
}
- (void)UpData:(TAKALLModel *)model{
    [self cshtype:model];
    if ([_weizhi isEqualToString:@"1"]) {
        [self lingqu:model];
    }else{
        if ([_friendid isEqualToString:@""]) {
            if (model.is_receive == 1) {
                if ([model.missionStatus isEqualToString:@"3"]) {
                    if ([model.mission.mission_type isEqualToString:@"1"]) {
                        [self lingqu:model];
                    }else{
                        [self weilingqu:model];
                    }
                }else{
                    [self lingqu:model];
                }
            }else{
                [self weilingqu:model];
            }
        }else{
            [self lingqu:model];
        }
    }
    
    

    

}
- (void)cshtype:(TAKALLModel * )model{
    if ([_weizhi isEqualToString:@"1"]) {
        if ([model.mission.mission_type isEqualToString:@"1"]) {
            if ([model.missionStatus isEqualToString:@"1"]) {
                _style = TaxkXqStyelenoviceingStyle;
            }else if ([model.missionStatus isEqualToString:@"2"]){
                _style = TaxkXqStyelenoviceendStyle;
            }else if ([model.missionStatus isEqualToString:@"3"]){
                _style = TaxkXqStyelenovicefqStyle;
            }
        }else{
            if ([model.missionStatus isEqualToString:@"1"]) {
                _style = TaxkXqStyeUserOthering;
            }else if ([model.missionStatus isEqualToString:@"2"]){
                _style = TaxkXqStyeUserOtherend;
            }else if ([model.missionStatus isEqualToString:@"3"]){
                _style = TaxkXqStyeUserOtherfq;
            }
        }
    }else{
        if ([_friendid isEqualToString:@""]) {
            if ([model.mission.mission_type isEqualToString:@"1"]) {
                if ([model.missionStatus isEqualToString:@"1"]) {
                    _style = TaxkXqStyelenoviceingStyle;
                }else if ([model.missionStatus isEqualToString:@"2"]){
                    _style = TaxkXqStyelenoviceendStyle;
                }else if ([model.missionStatus isEqualToString:@"3"]){
                    _style = TaxkXqStyelenovicefqStyle;
                }
            }else{
                if ([model.missionStatus isEqualToString:@"1"]) {
                    _style = TaxkXqStyeUserOthering;
                }else if ([model.missionStatus isEqualToString:@"2"]){
                    _style = TaxkXqStyeUserOtherend;
                }else if ([model.missionStatus isEqualToString:@"3"]){
                    _style = TaxkXqStyeUserOtherfq;
                }
            }
        }else{
            if ([model.missionStatus isEqualToString:@"1"]) {
                _style = TaxkXqStyeOtherPeopleing;
            }else if ([model.missionStatus isEqualToString:@"2"]){
                _style = TaxkXqStyeOtherPeopleend;
            }else if ([model.missionStatus isEqualToString:@"3"]){
                _style = TaxkXqStyeOtherPeoplefa;
            }
        }
    }
    
    

}
- (void)weilingqu:(TAKALLModel *)model{
    [self AddNavtion];
    WS(ws);
    viewarray = [NSMutableArray array];
    scrollView = [UIScrollView new];
    [self.view addSubview:scrollView];
    
    
    
    topimageview = [UIImageView new];
    topimageview.backgroundColor = RANDOMCOLOR;
    topimageview.contentMode = UIViewContentModeScaleAspectFill;
    [scrollView addSubview:topimageview];
    [viewarray addObject:topimageview];

    bakimageview = [UIImageView new];
    bakimageview.backgroundColor = RANDOMCOLOR;
    bakimageview.contentMode = UIViewContentModeScaleAspectFit;
    [scrollView addSubview:bakimageview];

    
    
    TKJS = [TakTaskJSView new];
    [scrollView addSubview:TKJS];
    [viewarray addObject:TKJS];
    TKJS.model = model;
    
    if ([model.mission.mission_type isEqualToString:@"1"]) {
        jp = [TAKprizeView new];
        [scrollView addSubview:jp];
        [viewarray addObject:jp];
        jp.model = model;
    }

    gz = [TAKGZView new];
    [scrollView addSubview:gz];
    [viewarray addObject:gz];
    gz.model = model;
    
    sz = [TakSZView new];
    sz.missionid = _missionid;
    [scrollView addSubview:sz];
    [viewarray addObject:sz];
    sz.model = model;
    
    
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.navtive.mas_bottom);
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.bottom.equalTo(ws.view).with.offset(0);
    }];
    
    BaseView * lastview;
    for (int i = 0; i < viewarray.count; i++) {
        BaseView * view = viewarray[i];
        [scrollView addSubview:view];
        if (!lastview) {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self->scrollView.mas_top).with.offset(0);
                make.left.equalTo(ws.view).with.offset(0);
                make.right.equalTo(ws.view).with.offset(0);
                make.height.mas_equalTo(LENGTH(115));
            }];
        }else{
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(ws.view).with.offset(0);
                make.right.equalTo(ws.view).with.offset(0);
                if (i == 1) {
                    make.top.equalTo(lastview.mas_bottom).with.offset(LENGTH(16));
                }else{
                    make.top.equalTo(lastview.mas_bottom).with.offset(LENGTH(20));
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
        make.bottom.equalTo(self->scrollView.mas_bottom).with.offset(0);
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.height.mas_equalTo(LENGTH(480));
    }];
    NSURL * sss = URLIMAGE(model.mission.mission_content_img);
    [topimageview sd_setImageWithURL:URLIMAGE(model.mission.mission_content_img)];
    [bakimageview sd_setImageWithURL:URLIMAGE(model.mission.mission_background)];

    self.navtive.title = model.mission.mission_name;
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
    UITapGestureRecognizer * tapviewtap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(NavLeftClick)];
    //将手势添加到需要相应的view中去
    [tapview addGestureRecognizer:tapviewtap];
    
}

- (void)lingqu:(TAKALLModel *)model{
    viewarray = [NSMutableArray array];
    WS(ws);
    scrollView = [UIScrollView new];
    [self.view addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws.view).with.insets(UIEdgeInsetsMake(-StatusBar, 0, 0, 0));
    }];
    bakimageview = [UIImageView new];
    bakimageview.userInteractionEnabled = YES;
    bakimageview.contentMode = UIViewContentModeScaleAspectFill;
    bakimageview.backgroundColor = RANDOMCOLOR;
    [scrollView addSubview:bakimageview];
    
    baskview = [UIView new];
    [bakimageview addSubview:baskview];
    
    topxqview = [TKXQTopView new];
    [scrollView addSubview:topxqview];
    [viewarray addObject:topxqview];
    
    rlview = [TKXQRLView new];
    [scrollView addSubview:rlview];
    [viewarray addObject:rlview];
    
    if ([_friendid isEqualToString:@""]) {
        downview = [TKXQGZView new];
        [scrollView addSubview:downview];
        [viewarray addObject:downview];
        downview.style = _style;
        downview.model = model;

    }else{
        dowboolview = [TKXQOtherView new];
        [scrollView addSubview:dowboolview];
        [viewarray addObject:dowboolview];
        dowboolview.style = _style;
        dowboolview.model = model;
    }
    topxqview.style = _style;
    topxqview.model = model;
    rlview.style = _style;
    rlview.model = model;
    [self backImage];
    [self layoutviews];
    [bakimageview sd_setImageWithURL:URLIMAGE(model.mission.mission_background)];
    if ([model.mission.mission_type isEqualToString:@"1"]) {
        baskview.backgroundColor = RGBA(160, 231, 228, 0.8);
    }else{
        baskview.backgroundColor = RGBA(142, 191, 232, 0.8);
    }

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
    [scrollView layoutIfNeeded];
    [bakimageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->scrollView);
        make.left.and.right.mas_equalTo(ws.view);
        make.height.mas_equalTo(self->scrollView.contentSize.height);
    }];
    [baskview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self->bakimageview);
    }];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self LoadData];
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
