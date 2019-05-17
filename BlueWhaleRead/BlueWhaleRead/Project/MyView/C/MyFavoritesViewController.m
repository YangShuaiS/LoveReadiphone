//
//  MyFavoritesViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/3/21.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "MyFavoritesViewController.h"
#import "NKRRecommendedCollectionView.h"
#import "MyFavoritesDownView.h"
#import "ShouCangMenuView.h"
#define itemWidth LENGTH(162)
#define itemHeight1 LENGTH(162*0.610561)+LENGTH(14)+LENGTH(14)+LENGTH(3)+LENGTH(14)

#import "ShouCangTableView.h"
@interface MyFavoritesViewController ()<NavDelegate>

@end
@implementation MyFavoritesViewController{
    NKRRecommendedCollectionView * collectView1;
    BaseLabel * quxiao;
    MyFavoritesDownView * downview;
    
    ShouCangMenuView * menu;
    ShouCangTableView * tableview;
    NSInteger nowInter;
    NSInteger bjzt;
}

#pragma mark --------------------  导航栏以及代理
- (void)AddNavtion{
    [super AddNavtion];
    nowInter = 0;
    bjzt = 0;
    WS(ws);
    self.navtive = [[NativeView alloc] initWithLeftImage:@"backhei" Title:@"收藏夹" RightTitle:@"" NativeStyle:NavStyleGeneral];
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
    
    quxiao = [[BaseLabel alloc] initWithTxteColor:RGB(31, 31, 31) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentRight Text:@"管理"];
    [self.navtive addSubview:quxiao];
    [quxiao mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws.navtive).with.offset(StatusBar);
        make.right.mas_equalTo(ws.navtive).with.offset(-LENGTH(16));
        make.bottom.mas_equalTo(ws.navtive);
        make.width.mas_equalTo(LENGTH(50));
    }];
    quxiao.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(guanli)];
    [quxiao addGestureRecognizer:tap];
}

- (void)NavLeftClick{
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)NavCenterClick {
    
}


- (void)NavRightClick {
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    WS(ws);
    self.view.backgroundColor = [UIColor whiteColor];
    [self AddNavtion];
    menu = [ShouCangMenuView new];
    [self.view addSubview:menu];
    [menu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws.navtive.mas_bottom).with.offset(0);
        make.left.and.right.and.bottom.mas_equalTo(ws.view);
    }];
    [menu setBlocks:^(NSInteger inter) {
        [ws upNowWeozhi:inter];
    }];
    
    menu.titarray = @[@"知识图",@"每日格言"];
    
    UICollectionViewFlowLayout *flowLayout1 = [[UICollectionViewFlowLayout alloc] init];
    flowLayout1.itemSize = CGSizeMake(itemWidth,itemHeight1);
    //    //定义每个UICollectionView 横向的间距
    flowLayout1.minimumLineSpacing = LENGTH(15);
    //    //定义每个UICollectionView 纵向的间距
    flowLayout1.minimumInteritemSpacing = 0;
    //    //定义每个UICollectionView 的边距距
    flowLayout1.sectionInset = UIEdgeInsetsMake(0, LENGTH(17), 0, LENGTH(17));//上左下右
    flowLayout1.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    collectView1 = [[NKRRecommendedCollectionView alloc] initWithFrame:CGRectMake(0, 0, 0,0) collectionViewLayout:flowLayout1];
    collectView1.style = 2;
//    [self.view addSubview:collectView1];
//    [collectView1 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(ws.view);
//        make.top.equalTo(ws.navtive.mas_bottom).with.offset(LENGTH(5));
//        make.right.equalTo(ws.view);
//        make.bottom.equalTo(ws.view);
//    }];
//
    __weak MyFavoritesViewController * blockSelf = self;
    downview = [MyFavoritesDownView new];
    [self.view addSubview:downview];
    [downview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws.view.mas_bottom);
        make.left.and.right.mas_equalTo(ws.view);
        make.height.mas_equalTo(LENGTH(TabBarHeight));
    }];
    [downview setBlock:^{
        [blockSelf quanxuan];
    }];
    [downview setBlocks:^{
        [blockSelf quanshanshanchu];
    }];
    [self yichushooucang];
    
    tableview = [ShouCangTableView new];
    [tableview setBlocks:^(NSInteger now) {
        
    }];
    menu.controllerArray = @[collectView1,tableview];


}
- (void)quanshanshanchu{
    [self yichushooucang];
}
- (void)quanxuan{
    if (nowInter == 0) {
        if (collectView1.itemarray.count >0) {
            for (NKRKnowledgeModel * model in collectView1.itemarray) {
                if (downview.qxzt == 1) {
                    model.duigou = 1;
                }else{
                    model.duigou = 0;
                }
            }
        }
        [collectView1 reloadData];
    }else{
        if (tableview.itemarray.count >0) {
            for (NHProverbModel * model in tableview.itemarray) {
                if (downview.qxzt == 1) {
                    model.clicksatatus = 1;
                }else{
                    model.clicksatatus = 0;
                }
            }
        }
        [tableview reloadData];
    }

}
- (void)yichushooucang{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_MYSHOUCANG];
    NSDictionary * dic = @{@"studentid":Me.ssid};
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            MyFavoritesModel * model = [MyFavoritesModel mj_objectWithKeyValues:responseObject];
            if ([model.code isEqual:@200]) {
                [self upview:model];
            }
        }else{
            
        }
    }];
}
- (void)upview:(MyFavoritesModel*)model{
    collectView1.itemarray = model.collectionList;
    for (NHProverbModel * promodel in model.proverbList) {
        NSCalendarUnit dayInfoUnits  = NSCalendarUnitEra | NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
        NSCalendar *gregorian = [[NSCalendar alloc]
                                 initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        promodel.timedate = [gregorian components:dayInfoUnits fromDate:[BaseObject TimeStringForDate:promodel.show_time]];
    }
    tableview.itemarray = model.proverbList;
    downview.model = model;
}
- (void)guanli{
    WS(ws);
    if (bjzt == 0) {
        bjzt = 1;
        [UIView animateWithDuration:0.5 animations:^{
            [self->downview mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(ws.view.mas_bottom).with.offset(-LENGTH(TabBarHeight));
            }];
            [self.view.superview layoutIfNeeded];
        } completion:^(BOOL finished) {
            
        }];

    }else{
        bjzt = 0;
        [UIView animateWithDuration:0.5 animations:^{
            [self->downview mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(ws.view.mas_bottom);
            }];
            [self.view.superview layoutIfNeeded];
//            [ws.view.superview layoutIfNeeded];
        } completion:^(BOOL finished) {
            
        }];
    }
    quxiao.text = bjzt==1?@"取消":@"管理";
    if (bjzt == 1) {
        if (nowInter == 0 ) {
            collectView1.bkzt  = 1;
        }else{
            tableview.intertype = 1;
        }
    }else{
        collectView1.bkzt  = 0;
        tableview.intertype = 0;
        [self chushihua];
    }
}


- (void)upNowWeozhi:(NSInteger)inter{
    if (nowInter!=inter) {
        WS(ws);
        nowInter = inter;
        bjzt = 0;
        [UIView animateWithDuration:0.5 animations:^{
            [self->downview mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(ws.view.mas_bottom);
            }];
            [self.view.superview layoutIfNeeded];
            //            [ws.view.superview layoutIfNeeded];
        } completion:^(BOOL finished) {
            
        }];
        quxiao.text = bjzt==1?@"取消":@"管理";
        collectView1.bkzt  = 0;
        tableview.intertype = 0;
        downview.nowinter = inter;
        [self chushihua];
    }
}

- (void)chushihua{
    if (collectView1.itemarray.count >0) {
        for (NKRKnowledgeModel * model in collectView1.itemarray) {
            model.duigou = 0;
        }
        [collectView1 reloadData];
    }
    
    if (tableview.itemarray.count >0) {
        for (NHProverbModel * model in tableview.itemarray) {
            model.clicksatatus = 0;
        }
        [tableview reloadData];
    }
    downview.qxzt = 0;
}
@end
