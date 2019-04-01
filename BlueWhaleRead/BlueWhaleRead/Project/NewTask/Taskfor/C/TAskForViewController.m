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
#import "TAKLQGZView.h"
#import "TAKGZView.h"
#import "TakSZView.h"
#import "BookCityViewController.h"

#import "TKNewXQNavView.h"
#import "TKNewXQTopView.h"
#import "TKPGAndReadView.h"
#import "TKWeeKCSView.h"
#import "TKXQAllRiLiView.h"

#import "TKXQTopView.h"
#import "TKXQRLView.h"
#import "TKXQGZView.h"
#import "TKXQOtherView.h"

#import "TKAwardViewController.h"
#import "TKATextFileModel.h"
@interface TAskForViewController ()<NavDelegate,UIScrollViewDelegate>
@property(nonatomic,assign)TaxkXqStyele style;

@end

@implementation TAskForViewController{
    BaseLabel * goreadbook;//去读书
    TAKALLModel * allmodel;
    UIScrollView * scrollView;
    NSMutableArray *  viewarray;
    
    TAKTopVIew * topview;
    
    UIImageView * topimageview;

    TakTaskJSView * TKJS;
    TAKprizeView * jp;//奖品
    TAKGZView * gz;//规则
    TAKLQGZView * lqgz;//领取规则
    TakSZView * sz;//设置

    TKXQTopView * topxqview;
    UIImageView * backImage;
    TKXQGZView * downview;
    TKXQOtherView * dowboolview;
    
    NSMutableArray * colorarray;
    TKNewXQNavView * navs;
    TKNewXQTopView * newxqtopview;
    TKPGAndReadView * pgandradweek;
    TKWeeKCSView * weekcsview;
    TKXQAllRiLiView * rlview;//日历
    
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
    WS(ws);
    //    NSDictionary * dic = @{@"studentid":@"12"};
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            TAKALLModel * model = [TAKALLModel mj_objectWithKeyValues:responseObject];
            if ([model.code isEqual:@200]) {
                [ws UpData:model];
            }else if ([model.code isEqual:@Notloggedin]){
                [ws UpDengLu];
            }
        }else{
            
        }
    }];
}
- (void)UpData:(TAKALLModel *)model{
    colorarray = [BaseObject TaskColorArray:[model.mission.mission_type integerValue]];
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
    topimageview.layer.masksToBounds = YES;
//    topimageview.backgroundColor = RANDOMCOLOR;
    topimageview.contentMode = UIViewContentModeScaleAspectFill;
    [scrollView addSubview:topimageview];
    [viewarray addObject:topimageview];
    
    TKJS = [TakTaskJSView new];
    TKJS.colorarray = colorarray;
    [scrollView addSubview:TKJS];
    [viewarray addObject:TKJS];
    TKJS.model = model;
    
    if ([model.mission.mission_type isEqualToString:@"1"]) {
        jp = [TAKprizeView new];
        [scrollView addSubview:jp];
        [viewarray addObject:jp];
        jp.model = model;
    }

    lqgz = [TAKLQGZView new];
    lqgz.colorarray = colorarray;
    [scrollView addSubview:lqgz];
    [viewarray addObject:lqgz];
    lqgz.model = model;
    
    sz = [TakSZView new];
    sz.vc = self;
    sz.colorarray = colorarray;
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
                make.height.mas_equalTo(LENGTH(222));
            }];
        }else{
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(ws.view).with.offset(0);
                make.right.equalTo(ws.view).with.offset(0);
                if (i == 1) {
                    make.top.equalTo(lastview.mas_bottom).with.offset(-LENGTH(60));
                }else if (i == 3){
                    if (self->jp!=nil) {
                        make.top.equalTo(lastview.mas_bottom).with.offset(-LENGTH(300));
                    }else{
                        make.top.equalTo(lastview.mas_bottom).with.offset(LENGTH(0));
                    }
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

    [topimageview sd_setImageWithURL:URLIMAGE(model.mission.mission_content_img)];
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
    allmodel = model;
    WS(ws);
    scrollView = [UIScrollView new];
    scrollView.delegate = self;
    [self.view addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws.view).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    navs = [TKNewXQNavView new];
    [self.view addSubview:navs];
    [navs mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.and.right.mas_equalTo(ws.view);
        make.height.mas_equalTo(NavHeight);
    }];
    navs.hidden = YES;
    
    newxqtopview = [TKNewXQTopView new];
    [scrollView addSubview:newxqtopview];
    [viewarray addObject:newxqtopview];
    
    pgandradweek = [TKPGAndReadView new];
    [scrollView addSubview:pgandradweek];
    [viewarray addObject:pgandradweek];
    
    weekcsview = [TKWeeKCSView new];
    [scrollView addSubview:weekcsview];
    [viewarray addObject:weekcsview];
    
    
    if ([_friendid isEqualToString:@""]) {
        pgandradweek.frien = 0;
        weekcsview.frien = 0;
    }else{
        pgandradweek.frien = 1;
        weekcsview.frien = 0;
    }
    if ([model.missionStatus isEqualToString:@"1"]){
        pgandradweek.ing = 1;
        weekcsview.ing = 1;
    }else{
        pgandradweek.ing = 0;
        weekcsview.ing = 0;
    }
    
    rlview = [TKXQAllRiLiView new];
    [scrollView addSubview:rlview];
    [viewarray addObject:rlview];


//    topxqview = [TKXQTopView new];
//    [scrollView addSubview:topxqview];
//    [viewarray addObject:topxqview];
//

    
    if ([_friendid isEqualToString:@""]) {
        downview = [TKXQGZView new];
        [scrollView addSubview:downview];
        [viewarray addObject:downview];
        downview.colorarray = colorarray;
        downview.style = _style;
        downview.model = model;

    }else{
        dowboolview = [TKXQOtherView new];
        [scrollView addSubview:dowboolview];
        [viewarray addObject:dowboolview];
        dowboolview.style = _style;
        dowboolview.model = model;
    }
    navs.style = _style;
    navs.model = model;
    
    newxqtopview.colorarray = colorarray;
    newxqtopview.style = _style;
    newxqtopview.model = model;
    
    pgandradweek.colorarray = colorarray;
    pgandradweek.model = model;
    
    weekcsview.colorarray = colorarray;
    weekcsview.model = model;
    
    rlview.colorarray = colorarray;
    rlview.style = _style;
    rlview.model = model;
    
    topxqview.style = _style;
    topxqview.model = model;
//    rlview.style = _style;
//    rlview.model = model;
//    [self backImage];
    [self layoutviews];
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
                    make.top.equalTo(lastview.mas_bottom).with.offset(-LENGTH(30));
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

    if ([allmodel.mission.mission_type isEqualToString:@"1"]&&[allmodel.missionStatus isEqualToString:@"2"]&&[_friendid isEqualToString:@""]) {
        UIView * clickview = [UIView new];
        clickview.backgroundColor = RGB(255,91,40);
        clickview.layer.cornerRadius = LENGTH(22);
        clickview.layer.masksToBounds = YES;
        [self.view addSubview:clickview];
        [clickview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(ws.view).with.offset(-LENGTH(30));
            make.centerX.mas_equalTo(ws.view);
            make.height.mas_equalTo(LENGTH(44));
        }];
        
        BaseLabel * ck = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255, 255, 255) LabelFont:TextFont(19) TextAlignment:NSTextAlignmentLeft Text:@"去领奖"];
        [clickview addSubview:ck];
        [ck mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.and.bottom.mas_equalTo(clickview);
            make.left.mas_equalTo(clickview).with.offset(LENGTH(29));
        }];
        
        UIImageView * jiantou = [UIImageView new];
        jiantou.contentMode = UIViewContentModeScaleAspectFit;
        jiantou.image = UIIMAGE(@"组110");
        [clickview addSubview:jiantou];
        [jiantou mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(clickview);
            make.left.mas_equalTo(ck.mas_right).with.offset(LENGTH(5));
            make.right.mas_equalTo(clickview).with.offset(-LENGTH(27));
            make.width.mas_equalTo(LENGTH(21));
            make.height.mas_equalTo(LENGTH(19));
        }];
        clickview.userInteractionEnabled = YES;
        UITapGestureRecognizer * ljtap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ljtap)];
        //将手势添加到需要相应的view中去
        [clickview addGestureRecognizer:ljtap];
    }else{
        goreadbook = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255,255,255) LabelFont:TextFont(18) TextAlignment:NSTextAlignmentCenter Text:@"去读书"];
        goreadbook.backgroundColor = RGB(91,199,198);
        [self.view addSubview:goreadbook];
        [goreadbook mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.right.and.bottom.mas_equalTo(ws.view);
            make.height.mas_equalTo(TabBarHeight);
        }];
        if (![_friendid isEqualToString:@""]||[allmodel.missionStatus isEqualToString:@"2"]||[allmodel.missionStatus isEqualToString:@"3"]) {
            goreadbook.userInteractionEnabled = NO;
            goreadbook.backgroundColor = RGB(240, 240, 240);
            goreadbook.textColor = RGB(204, 204, 204);
   
        }else{
            goreadbook.backgroundColor = RGB(91,199,198);
            goreadbook.textColor = RGB(255,255,255) ;
            goreadbook.userInteractionEnabled = YES;
            UITapGestureRecognizer * tapviewtap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(reedbook)];
            //将手势添加到需要相应的view中去
            [goreadbook addGestureRecognizer:tapviewtap];
        }
    }
}
- (void)reedbook{
    BookCityViewController * vc = [BookCityViewController new];
    NSIndexPath * indpath = [NSIndexPath indexPathForRow:0 inSection:0];
    vc.inpath = indpath;
    vc.cata = [NSString stringWithFormat:@"100"];
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self LoadData];
}
- (void)ljtap{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_RWLJ];
    NSDictionary * dic = @{@"studentid":Me.ssid};
    //    NSDictionary * dic = @{@"studentid":@"12"};
    
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            TKATextFileModel * model = [TKATextFileModel mj_objectWithKeyValues:responseObject];
            if ([model.code isEqual:@200]) {
                [self UpDate:model];
            }else if ([model.code isEqual:@Notloggedin]){
                [self UpDengLu];
            }else{
                [[MBProgressHUDYS SharedMBProgressHUDYS] addview:self.view.window];
                [[MBProgressHUDYS SharedMBProgressHUDYS] shoumessage:model.message];
                [[MBProgressHUDYS SharedMBProgressHUDYS] hideAnimated:YES afterDelay:1];
            }
        }else{
        }
    }];
    
}
- (void)UpDate:(TKATextFileModel*)model{
    TKAwardViewController * vc = [TKAwardViewController new];
    vc.model = model;
    [self.navigationController pushViewController: vc animated:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView.contentOffset.y<NavHeight) {
        navs.hidden = YES;
    }else{
        navs.hidden = NO;
    }
}
- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    if (jp!=nil) {
        [jp xiaohui];
        [jp removeFromSuperview];
    }
}
- (void)dealloc{

}
@end
