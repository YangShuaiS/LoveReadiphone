//
//  SearchMyHistoryViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/2/21.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "SearchMyHistoryViewController.h"
#define itemWidth LENGTH(162)
#define itemHeight LENGTH(162)*0.610561+LENGTH(15)+LENGTH(14)
#define itemHeightone LENGTH(162*0.610561)+LENGTH(15)+LENGTH(20)+LENGTH(5)+LENGTH(16)

#import "NKRRecommendedCollectionView.h"

@interface SearchMyHistoryViewController ()<NavDelegate>

@end

@implementation SearchMyHistoryViewController{
    NKRRecommendedCollectionView * collectView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self AddNavtion];
    WS(ws);
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    if (_style == 2) {
        flowLayout.itemSize = CGSizeMake(itemWidth,itemHeight);
    }else{
        flowLayout.itemSize = CGSizeMake(itemWidth,itemHeightone);

    }
    //    //定义每个UICollectionView 横向的间距
    flowLayout.minimumLineSpacing = LENGTH(15);
    //    //定义每个UICollectionView 纵向的间距
    flowLayout.minimumInteritemSpacing = 0;
    //    //定义每个UICollectionView 的边距距
    flowLayout.sectionInset = UIEdgeInsetsMake(0, LENGTH(17), TabBarHeight, LENGTH(17));//上左下右
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    collectView = [[NKRRecommendedCollectionView alloc] initWithFrame:CGRectMake(0, 0, 0,0) collectionViewLayout:flowLayout];
    collectView.style = _style;
    [self.view addSubview:collectView];
    [collectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(LENGTH(0));
        make.top.equalTo(ws.navtive.mas_bottom).with.offset(LENGTH(6));
        make.right.equalTo(ws.view).with.offset(LENGTH(0));
        make.bottom.equalTo(ws.view);
    }];
    if (_style == 2) {
        [self LoadData];
    }else{
        [self LoadDataXGTj];
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
- (void)UpData:(NewKnowledgeModel *)model{
    if (_style == 2) {
        collectView.itemarray = model.myHistory;
    }else{
        collectView.itemarray = model.relatedRecommendations;
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

@end
