//
//  HTaskView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/1.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "HTaskView.h"
#import "NBCmenuView.h"
#import "HGetthetaskView.h"
#import "HTaskAllView.h"


#import "HTprogressView.h"
#import "HTWeekProCollectionView.h"
#import "HTProLasDatView.h"
#import "HorizontalcalendarView.h"

#import "TKAlltaskViewController.h"
#import "TAskForViewController.h"
#import "NewTKPrizeViewController.h"
#import "BookListViewController.h"
@implementation HTaskView{
    NBCmenuView * navMenu;//
    HGetthetaskView * gettaskview;//未领取任务视图
    HTaskAllView * taskallView;//任务
    
    UIImageView * backiamgeview;
    
    BaseLabel * day;//日期
    BaseLabel * ydl;//阅读量
    BaseLabel * taskname;//任务名
    BaseLabel * taskxq;//任务详情
    HTprogressView * progress;//进度条
    HTprogressView * wcprogress;//wc进度条

    HTWeekProCollectionView * weekpro;//周任务
    HTProLasDatView * prolast;//对比
    HorizontalcalendarView * calend;//g横划日历
    BaseLabel * ckjp ;
    BaseLabel * goubookcity;
    UIView * backview;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addview];
    }
    return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    WS(ws);
    navMenu = [NBCmenuView new];
//    navMenu.styles = NBCmenuViewStyleimage;
    navMenu.label.text = @"读书任务";
    [self addSubview:navMenu];
    [navMenu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(0);
        make.top.equalTo(ws).with.offset(LENGTH(14));
        make.right.equalTo(ws).with.offset(0);
    }];
//    WS(ws);
//    [backiamgeview mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.height.mas_equalTo(ws.frame.size.height);
//    }];
}
- (void)addview{
//    WS(ws);
//    backiamgeview = [UIImageView new];
//    backiamgeview.userInteractionEnabled = YES;
//    backiamgeview.contentMode = UIViewContentModeScaleAspectFill;
//    backiamgeview.layer.masksToBounds = YES;
//    backiamgeview.backgroundColor = RGB(160,231,228);
//    [self addSubview:backiamgeview];
//
//
//    day = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255, 255, 255) LabelFont:TextFont(17) TextAlignment:NSTextAlignmentLeft Text:@"第16期"];
//    [self addSubview:day];
//    [day mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(ws).with.offset(LENGTH(20));
//        make.top.mas_equalTo(ws).with.offset(LENGTH(19));
//    }];
//
//    ydl = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255, 255, 255) LabelFont:TextFont(13) TextAlignment:NSTextAlignmentLeft Text:@"298736人已完成"];
//    [backiamgeview addSubview:ydl];
//    [ydl mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.mas_equalTo(ws).with.offset(-LENGTH(20));
//        make.centerY.mas_equalTo(self->day);
//    }];
//
//    taskname = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255, 255, 255) LabelFont:TextFont(22) TextAlignment:NSTextAlignmentLeft Text:@"新手任务(有奖)"];
//    [backiamgeview addSubview:taskname];
//    [taskname mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(ws).with.offset(LENGTH(20));
//        make.top.mas_equalTo(self->day.mas_bottom).with.offset(LENGTH(15));
//    }];
//
//    taskxq = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255, 255, 255) LabelFont:TextFont(16) TextAlignment:NSTextAlignmentLeft Text:@"查看任务详情>"];
//    [backiamgeview addSubview:taskxq];
//    [taskxq mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.mas_equalTo(ws).with.offset(-LENGTH(20));
//        make.centerY.mas_equalTo(self->taskname);
//    }];
//
//    progress = [HTprogressView new];
//    [backiamgeview addSubview:progress];
//    [progress mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(self->taskname.mas_bottom).with.offset(LENGTH(24));
//        make.left.mas_equalTo(ws).with.offset(LENGTH(45));
//        make.right.mas_equalTo(ws).with.offset(-LENGTH(45));
//    }];
//
//    wcprogress = [HTprogressView new];
//    [progress addSubview:wcprogress];
//    [wcprogress mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.mas_equalTo(self->progress);
//    }];
//
//    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
//    flowLayout.itemSize = CGSizeMake((WIDTH-LENGTH(40))/2,LENGTH(16));
//    //定义每个UICollectionView 横向的间距
//    flowLayout.minimumLineSpacing = LENGTH(12);
//    //定义每个UICollectionView 纵向的间距
//    flowLayout.minimumInteritemSpacing = LENGTH(0);
//    //定义每个UICollectionView 的边距距
//    flowLayout.sectionInset = UIEdgeInsetsMake(LENGTH(0), LENGTH(20), 0, LENGTH(20));//上左下右
//    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
//
//    weekpro = [[HTWeekProCollectionView alloc] initWithFrame:CGRectMake(0, 0, 0,0) collectionViewLayout:flowLayout];
//    weekpro.inter = 0;
//    [backiamgeview addSubview:weekpro];
//    [weekpro mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(self->progress.mas_bottom).with.offset(LENGTH(24));
//        make.left.and.right.mas_equalTo(ws);
//        make.height.mas_equalTo(LENGTH(10));
//    }];
//
//    prolast = [HTProLasDatView new];
//    [backiamgeview addSubview:prolast];
//    [prolast mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(self->weekpro.mas_bottom).with.offset(LENGTH(20));
//        make.left.mas_equalTo(ws).with.offset(LENGTH(0));
//        make.right.mas_equalTo(ws).with.offset(-LENGTH(0));
//    }];
//
//    ckjp = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255, 255, 255) LabelFont:TextFont(18) TextAlignment:NSTextAlignmentCenter Text:@"查看奖品"];
//    ckjp.backgroundColor = RGB(124,165,232);
//    [backiamgeview addSubview:ckjp];
//    [ckjp mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(self->prolast.mas_bottom).with.offset(LENGTH(30));
//        make.centerX.mas_equalTo(ws).with.offset(-LENGTH(14)-LENGTH(65));
//        make.width.mas_equalTo(LENGTH(130));
//    }];
//
//    goubookcity = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255, 255, 255) LabelFont:TextFont(18) TextAlignment:NSTextAlignmentCenter Text:@"去书架"];
//    goubookcity.backgroundColor = RGB(124,165,232);
//    [backiamgeview addSubview:goubookcity];
//    [goubookcity mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(self->prolast.mas_bottom).with.offset(LENGTH(30));
//        make.centerX.mas_equalTo(ws).with.offset(LENGTH(14)+LENGTH(65));
//        make.width.mas_equalTo(LENGTH(130));
//
//    }];
//
//    calend = [HorizontalcalendarView new];
//    [backiamgeview addSubview:calend];
//    [calend mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(self->goubookcity.mas_bottom).with.offset(LENGTH(30));
//        make.left.and.right.mas_equalTo(ws);
//        make.height.mas_equalTo(LENGTH(88));
//        make.bottom.mas_equalTo(ws);
//
//    }];
//
//    taskxq.userInteractionEnabled = YES;
//    UITapGestureRecognizer * taskxqtap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(taskxqclick)];
//    //将手势添加到需要相应的view中去
//    [taskxq addGestureRecognizer:taskxqtap];
//
//    ckjp.userInteractionEnabled = YES;
//    goubookcity.userInteractionEnabled = YES;
//    UITapGestureRecognizer * ckjptap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ckjpclick)];
//    //将手势添加到需要相应的view中去
//    [ckjp addGestureRecognizer:ckjptap];
//
//    UITapGestureRecognizer * goubookcitytap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(goubookcityclick)];
//    //将手势添加到需要相应的view中去
//    [goubookcity addGestureRecognizer:goubookcitytap];
//    [self addbackview];
//
//    [backiamgeview mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.and.right.mas_equalTo(ws);
//        make.top.mas_equalTo(ws);
//        make.height.mas_equalTo(200);
//    }];
}
- (void)addbackview{
//    WS(ws);
//    backview = [UIView new];
//    backview.backgroundColor = RGBA(255, 255, 255, 0.8);
//    [self addSubview:backview];
//    [backview mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.mas_equalTo(ws);
//    }];
//    BaseLabel * dsrw = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(26,110,105) LabelFont:TextFont(26) TextAlignment:NSTextAlignmentCenter Text:@"制定你的读书任务"];
//    dsrw.backgroundColor = RGB(147,219,215);
//    [backview addSubview:dsrw];
//    [dsrw mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.mas_equalTo(self->backview);
//        make.centerY.mas_equalTo(self->backview).with.offset(-LENGTH(60));
//        make.width.mas_equalTo(LENGTH(280));
//        make.height.mas_equalTo(LENGTH(60));
//    }];
//
//    BaseLabel * sm = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(26,110,105) LabelFont:TextFont(19) TextAlignment:NSTextAlignmentCenter Text:@"读书使人明智，读书使人博识"];
//    sm.backgroundColor = RGB(147,219,215);
//    [backview addSubview:sm];
//    [sm mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.mas_equalTo(self->backview);
//        make.top.mas_equalTo(dsrw.mas_bottom).with.offset(LENGTH(20));
//        make.width.mas_equalTo(LENGTH(280));
//        make.height.mas_equalTo(LENGTH(44));
//    }];
//
//    backview.userInteractionEnabled = YES;
//    UITapGestureRecognizer * goubookcitytap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(rwlistclick)];
//    //将手势添加到需要相应的view中去
//    [backview addGestureRecognizer:goubookcitytap];
//    backview.hidden = YES;
}

- (void)rwlistclick{
    TKAlltaskViewController * vc = [TKAlltaskViewController new];
    [[self viewController].navigationController pushViewController:vc animated:YES];
}

- (void)taskxqclick{
    TAskForViewController * vc = [TAskForViewController new];
    vc.type = @"1";
    vc.missionid = [NSString stringWithFormat:@"%@",_model.mission.ssid];
    vc.navtitle = _model.mission.mission_name;
    [[self viewController].navigationController pushViewController:vc animated:YES];
}

- (void)ckjpclick{
    NewTKPrizeViewController * vc = [NewTKPrizeViewController new];
    [[self viewController].navigationController pushViewController:vc animated:YES];
}

- (void)goubookcityclick{
    BookListViewController * vc = [BookListViewController new];
    [[self viewController].navigationController pushViewController:vc animated:YES];
}


- (void)setModel:(NHMissionModel *)model{
    _model = model;
    WS(ws);

    if (model.userRatio.length == 0) {
        if (taskallView) {
//            [taskallView.superview removeFromSuperview];
            [taskallView removeFromSuperview];
            taskallView = nil;
        }
        [gettaskview removeFromSuperview];
        gettaskview = nil;
        if (!gettaskview) {
            gettaskview = [HGetthetaskView new];
            [self addSubview:gettaskview];
            [gettaskview mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(self->navMenu.mas_bottom);
                make.left.and.right.bottom.mas_equalTo(ws);
            }];
            gettaskview.userInteractionEnabled = YES;
            UITapGestureRecognizer * goubookcitytap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(rwlistclick)];
            //将手势添加到需要相应的view中去
            [gettaskview addGestureRecognizer:goubookcitytap];
        }
    }else{
        if (gettaskview) {
//            [gettaskview.superview removeFromSuperview];
            [gettaskview removeFromSuperview];
            gettaskview = nil;
        }
        if (!taskallView) {
            taskallView = [HTaskAllView new];
            [self addSubview:taskallView];
            [taskallView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(self->navMenu.mas_bottom);
                make.left.and.right.bottom.mas_equalTo(ws);
            }];
        }
        
        if ([_model.mission.mission_type isEqualToString:taskallView.model.mission.mission_type]) {
            taskallView.model = _model;
        }else{
            [taskallView removeFromSuperview];
            taskallView = nil;
            if (!taskallView) {
                taskallView = [HTaskAllView new];
                [self addSubview:taskallView];
                [taskallView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.mas_equalTo(self->navMenu.mas_bottom);
                    make.left.and.right.bottom.mas_equalTo(ws);
                }];
            }
            taskallView.model = _model;
        }

//
//        if (model.mission.periods_num.length == 0 || [model.mission.periods_num isEqualToString:@"0"]) {
//            day.text =@"";
//            ckjp.hidden = YES;
//            [goubookcity mas_updateConstraints:^(MASConstraintMaker *make) {
//                make.centerX.mas_equalTo(ws);
//            }];
//            backiamgeview.backgroundColor = RGB(142,191,232);
//        }else{
//            backiamgeview.backgroundColor = RGB(160,231,228);
//            day.text = [NSString stringWithFormat:@"第%@期",model.mission.periods_num];
//            ckjp.hidden = NO;
//            [goubookcity mas_updateConstraints:^(MASConstraintMaker *make) {
//                make.centerX.mas_equalTo(ws).with.offset(LENGTH(14)+LENGTH(65));
//            }];
//        }
//    ydl.text = [NSString stringWithFormat:@"%@人已完成",model.mission.completed_num];
//    taskname.text = model.mission.mission_name;
//    wcprogress.jindu = [model.userRatio integerValue];
//    prolast.zt = model.thisWeekInfo.rankinfo;
//    calend.model = model;
//
//    NSMutableArray * szarray = [NSMutableArray array];
//    NHTimeListModel * szmodel = [NHTimeListModel new];
//    szmodel.name = @"识字量测试";
//    szmodel.literacy_is_completed = model.thisWeekInfo.literacy_is_completed;
//
//    NHTimeListModel * scmodel = [NHTimeListModel new];
//    scmodel.name = @"识词量测试";
//    scmodel.glossary_is_completed = model.thisWeekInfo.glossary_is_completed;
//
//    [szarray addObject:szmodel];
//    [szarray addObject:scmodel];
//
//    NSMutableArray * rwuarray = [NSMutableArray array];
//    NHTimeListModel * reedbook = [NHTimeListModel new];
//    reedbook.name = [NSString stringWithFormat:@"阅读完成%@本书",model.missionRole.week_book_num];
//    reedbook.book_is_completed = model.thisWeekInfo.book_is_completed;
//
//    NHTimeListModel * share = [NHTimeListModel new];
//    share.name = @"分享";
//    share.share_is_completed = model.thisWeekInfo.share_is_completed;
//
//    [rwuarray addObject:reedbook];
//    [rwuarray addObject:share];
//
//    NSMutableArray * allarray = [NSMutableArray array];
//    [allarray addObject:szarray];
//    [allarray addObject:rwuarray];
//
//    weekpro.itemArray = allarray;
//
    }
}
@end
