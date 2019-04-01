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
#define itemWidth LENGTH(162)
#define itemHeight1 LENGTH(162*0.610561)+LENGTH(15)+LENGTH(20)+LENGTH(5)+LENGTH(16)
@interface MyFavoritesViewController ()<NavDelegate>

@end
@implementation MyFavoritesViewController{
    NKRRecommendedCollectionView * collectView1;
    BaseLabel * quxiao;
    MyFavoritesDownView * downview;
    NSInteger inter;
}

#pragma mark --------------------  导航栏以及代理
- (void)AddNavtion{
    [super AddNavtion];
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
    self.view.backgroundColor = [UIColor whiteColor];
    [self AddNavtion];
    WS(ws);
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
    [self.view addSubview:collectView1];
    [collectView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view);
        make.top.equalTo(ws.navtive.mas_bottom).with.offset(LENGTH(5));
        make.right.equalTo(ws.view);
        make.bottom.equalTo(ws.view);
    }];
    
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

}
- (void)quanshanshanchu{
    inter = 0;
    [self yichushooucang];
}
- (void)quanxuan{
    if (collectView1.itemarray.count >0) {
        for (NKRKnowledgeModel * model in collectView1.itemarray) {
            if (inter == 0) {
                model.duigou = 1;
            }else{
                model.duigou = 0;
            }
        }
    }
    inter = inter == 0 ?1 : 0;
    [collectView1 reloadData];
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
    downview.itemarray = model.collectionList;
}
- (void)guanli{
    collectView1.bkzt = collectView1.bkzt==1?0:1;
    quxiao.text = collectView1.bkzt==1?@"取消":@"管理";
    WS(ws);
    if (collectView1.bkzt==1) {
        [UIView animateWithDuration:1 animations:^{
            [self->downview mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(ws.view.mas_bottom).with.offset(-LENGTH(TabBarHeight));
            }];
            [self->downview layoutIfNeeded];
//            [ws.view.superview layoutIfNeeded];

        } completion:^(BOOL finished) {
            
        }];

    }else{
        [UIView animateWithDuration:1 animations:^{
            [self->downview mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(ws.view.mas_bottom);
            }];
            [self->downview layoutIfNeeded];
//            [ws.view.superview layoutIfNeeded];
        } completion:^(BOOL finished) {
            
        }];
    }
}
@end
