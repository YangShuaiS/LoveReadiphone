//
//  SearchMyHistoryViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/2/21.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "SearchMyHistoryViewController.h"
//#define itemWidth LENGTH(162)
#define itemHeight LENGTH(163)*0.552147+LENGTH(10)+LENGTH(14)
#define itemHeightone LENGTH(163)*0.552147+LENGTH(10)+LENGTH(14)+LENGTH(3)+LENGTH(12)
#define itemHeighttwo LENGTH(163)*1.423312+LENGTH(10)+LENGTH(14)+LENGTH(3)+LENGTH(12)
#import "SearchFlowLayout.h"
#import "NKRArmPBLCollectionView.h"

@interface SearchMyHistoryViewController ()<NavDelegate,LMHWaterFallLayoutDeleaget>

@end

@implementation SearchMyHistoryViewController{
    NKRArmPBLCollectionView * collectView;
    SearchFlowLayout * flowLayout;
    NSMutableArray * itemarray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self AddNavtion];
    WS(ws);
    flowLayout = [[SearchFlowLayout alloc] init];
//    if (_style == 2) {
//        flowLayout.itemSize = CGSizeMake(itemWidth,itemHeight);
//    }else{
//        flowLayout.itemSize = CGSizeMake(itemWidth,itemHeightone);
//
//    }
//    flowLayout.estimatedItemSize = CGSizeMake(20, 60);  // layout约束这边必须要用estimatedItemSize才能实现自适应,使用itemSzie无效

    //    //定义每个UICollectionView 横向的间距
    flowLayout.LMHDefaultColunmCount = 2;
    flowLayout.LMHDefaultColunmMargin = LENGTH(15);
    flowLayout.LMHDefaultRowMargin = LENGTH(10);
    flowLayout.LMHDefaultEdgeInsets =UIEdgeInsetsMake(0, LENGTH(17), TabBarHeight+LENGTH(100), LENGTH(17));//上左下右
//    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    flowLayout.delegate = self;
//    collectView = [[NKRArmPBLCollectionView alloc] initWithFrame:CGRectMake(0, 0, 0,0) collectionViewLayout:flowLayout];
    collectView = [[NKRArmPBLCollectionView alloc]initWithFrame:CGRectMake(0, NavHeight, WIDTH, HEIGHT) collectionViewLayout:flowLayout];

    collectView.style = _style;
    collectView.sfsj = 1;
    [self.view addSubview:collectView];
//    [collectView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(ws.view).with.offset(LENGTH(0));
//        make.top.equalTo(ws.navtive.mas_bottom).with.offset(LENGTH(6));
//        make.right.equalTo(ws.view).with.offset(LENGTH(0));
//        make.bottom.equalTo(ws.view);
//    }];
    if (_style == 2) {
        [self LoadData];
    }else if (_style == 3){
        [self LoadDataXGTj];
    }else if (_style == 4){
        [self LoadDataBookXqXGTj];
    }else if (_style == 5){
        [self LoadDataHot];
    }
}
#pragma mark --------------------  导航栏以及代理
- (void)AddNavtion{
    [super AddNavtion];
    WS(ws);
    self.navtive = [[NativeView alloc] initWithLeftImage:@"backhei" Title:_titles RightTitle:@"" NativeStyle:NavStyleGeneral];
    self.navtive.delegate = self;
    self.navtive.titcolor = RGB(31, 31, 31);
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
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_ZHISHIMYHISTORY];
    NSDictionary * dic = @{@"studentid":Me.ssid};
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            NewKnowledgeModel * model = [NewKnowledgeModel mj_objectWithKeyValues:responseObject];
            if ([model.code isEqual:@200]) {
                [self UpData:model];
            }else if ([model.code isEqual:@Notloggedin]){
                [self UpDengLu];
            }
        }else{

        }
    }];
}

- (void)LoadDataXGTj{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_ZHISHIXGTJ];
    NSDictionary * dic = @{@"studentid":Me.ssid};
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            NewKnowledgeModel * model = [NewKnowledgeModel mj_objectWithKeyValues:responseObject];
            if ([model.code isEqual:@200]) {
                [self UpData:model];
            }else if ([model.code isEqual:@Notloggedin]){
                [self UpDengLu];
            }
        }else{
            
        }
    }];
}

- (void)LoadDataBookXqXGTj{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_BOOKXQZSWTUIJIAN];
    NSDictionary * dic = @{@"studentid":Me.ssid,@"bookid":_ssid};
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            NewKnowledgeModel * model = [NewKnowledgeModel mj_objectWithKeyValues:responseObject];
            if ([model.code isEqual:@200]) {
                [self UpData:model];
            }else if ([model.code isEqual:@Notloggedin]){
                [self UpDengLu];
            }
        }else{
            
        }
    }];
}

- (void)LoadDataHot{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_ALLHOTZST];
    NSDictionary * dic = @{@"studentid":Me.ssid};
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            NewKnowledgeModel * model = [NewKnowledgeModel mj_objectWithKeyValues:responseObject];
//            if ([model.code isEqual:@200]) {
                [self UpData:model];
//            }else if ([model.code isEqual:@Notloggedin]){
//                [self UpDengLu];
//            }
        }else{
            
        }
    }];
}
- (void)UpData:(NewKnowledgeModel *)model{
    if (_style == 2) {
        for (NKRKnowledgeModel * mo in model.myHistory) {
            NSInteger inter = arc4random()%2;
            if (inter == 1) {
                mo.inter = 1;
                mo.style = 1;
            }else{
//                if (_style == 3) {
//                    mo.style = 3;
//                }else{
                    mo.style = _style;
//                }
            }
        }
        itemarray = model.myHistory;
        collectView.itemarray = model.myHistory;
    }else if (_style == 3){
        for (NKRKnowledgeModel * mo in model.relatedRecommendations) {
            NSInteger inter = arc4random()%2;
            if (inter == 1) {
                mo.inter = 1;
                mo.style = 1;
            }else{
//                if (_style == 3) {
//                    mo.style = 3;
//                }else{
                    mo.style = _style;
//                }
            }
        }
        itemarray = model.relatedRecommendations;
        collectView.itemarray = model.relatedRecommendations;
    }else if (_style == 4){
        for (NKRKnowledgeModel * mo in model.bannerknowledgeList) {
            mo.style = 3;
        }
        itemarray = model.bannerknowledgeList;
        collectView.itemarray = model.bannerknowledgeList;
    }else if (_style == 5){
        for (NKRKnowledgeModel * mo in model.hotKnowledge) {
            NSInteger inter = arc4random()%2;
            if (inter == 1) {
                mo.inter = 1;
                mo.style = 1;
            }else{
                mo.style = 3;
//
//                if (_style == 5) {
//                    mo.style = 3;
//                }else{
//                    mo.style = _style;
//                }
            }
        }
        itemarray = model.hotKnowledge;
        collectView.itemarray = model.hotKnowledge;
    }

}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark  - <LMHWaterFallLayoutDeleaget>
- (CGFloat)waterFallLayout:(SearchFlowLayout *)waterFallLayout heightForItemAtIndexPath:(NSUInteger)indexPath itemWidth:(CGFloat)itemWidth{
    NKRKnowledgeModel * mo = itemarray[indexPath];
    if (mo.style == 1) {
        return itemHeighttwo;
    }else if (mo.style == 2){
        return itemHeight;
    }else if (mo.style == 3){
        return itemHeightone;
    }else{
        return itemHeightone;
    }
}
- (CGFloat)rowMarginInWaterFallLayout:(SearchFlowLayout *)waterFallLayout{
    
    return LENGTH(15);
    
}

- (NSUInteger)columnCountInWaterFallLayout:(SearchFlowLayout *)waterFallLayout{
    
    return 2;
    
}
@end
