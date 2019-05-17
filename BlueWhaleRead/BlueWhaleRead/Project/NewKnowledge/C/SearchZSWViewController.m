//
//  SearchZSWViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/2/15.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "SearchZSWViewController.h"
#import "NKRRecommendedCollectionView.h"
#define itemWidth LENGTH(163)
#define itemHeight LENGTH(163)*0.552147+LENGTH(10)+LENGTH(14)+LENGTH(3)+LENGTH(12)
@interface SearchZSWViewController ()

@end

@implementation SearchZSWViewController{
    NKRRecommendedCollectionView * collectView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    WS(ws);
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(itemWidth,itemHeight);
    //    //定义每个UICollectionView 横向的间距
    flowLayout.minimumLineSpacing = LENGTH(15);
    //    //定义每个UICollectionView 纵向的间距
    flowLayout.minimumInteritemSpacing = 0;
    //    //定义每个UICollectionView 的边距距
    flowLayout.sectionInset = UIEdgeInsetsMake(0, LENGTH(17), 0, LENGTH(17));//上左下右
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    collectView = [[NKRRecommendedCollectionView alloc] initWithFrame:CGRectMake(0, 0, 0,0) collectionViewLayout:flowLayout];
    collectView.style = 3;
    [self.view addSubview:collectView];
    [collectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws.view);
    }];
}
- (void)setModel:(ALLSearchModel *)model{
    _model = model;
    collectView.itemarray = model.knowledgedata;
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
