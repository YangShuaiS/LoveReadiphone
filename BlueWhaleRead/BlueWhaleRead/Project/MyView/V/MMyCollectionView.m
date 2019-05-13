//
//  MMyCollectionView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/1/16.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "MMyCollectionView.h"
#import "MMyViewCenterCollectionViewCell.h"

#import "BookListViewController.h"
#import "HomeMilestoneViewController.h"
#import "AchievementReportViewController.h"
#import "TKMytaskViewController.h"
#import "BaseNavigationViewController.h"
#import "UserLoginViewController.h"
#import "MyFavoritesViewController.h"
@interface MMyCollectionView ()<UICollectionViewDataSource,UICollectionViewDelegate>

@end
@implementation MMyCollectionView{
    NSArray * titarray;
}

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        //注册cell和ReusableView（相当于头部）
        [self registerClass:[MMyViewCenterCollectionViewCell class] forCellWithReuseIdentifier:@"MMyViewCenterCollectionViewCell"];
        
        //设置代理
        self.delegate = self;
        self.dataSource = self;
        // 设置是否允许滚动
        self.scrollEnabled = YES;
        //背景颜色
        self.backgroundColor = [UIColor clearColor];
        //自适应大小
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        self.scrollsToTop = NO;
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
//        titarray = @[@"能力测试",@"我的成就",@"我的书架",@"我的任务",@"我的里程碑",@"收藏夹"];
        titarray = @[@"能力测试",@"收藏夹",@"我的书架",@"我的任务",@"我的成就",@"我的里程碑"];

    }
    return self;
}
#pragma mark *** UICollectionViewDataSource ***
// 设置组数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

// 设置行数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return titarray.count;
}

// 设置单元格
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    MMyViewCenterCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MMyViewCenterCollectionViewCell" forIndexPath:indexPath];
    cell.title = titarray[indexPath.row];
    return cell;
}

-( void )collectionView:( UICollectionView *)collectionView didSelectItemAtIndexPath:( NSIndexPath *)indexPath{
    if ([Me.is_rebot isEqualToString:@"2"]) {
        if (indexPath.row == 0) {
            self.block(0);
        }else if (indexPath.row == 1){
            MyFavoritesViewController * vc = [MyFavoritesViewController new];
            [[self viewController].navigationController pushViewController:vc animated:YES];
        }else if (indexPath.row == 2){
            BookListViewController * vc = [BookListViewController new];
            [[self viewController].navigationController pushViewController:vc animated:YES];
        }else if (indexPath.row == 3){
            TKMytaskViewController * vc = [TKMytaskViewController new];
            [[self viewController].navigationController pushViewController:vc animated:YES];
        }else if (indexPath.row == 4){
            AchievementReportViewController * vc = [AchievementReportViewController new];
            [[self viewController].navigationController pushViewController:vc animated:YES];
        }else if (indexPath.row == 5){
            HomeMilestoneViewController * vc = [HomeMilestoneViewController new];
            [[self viewController].navigationController pushViewController:vc animated:YES];
        }
    }else{
        if (indexPath.row == 2) {
            BookListViewController * vc = [BookListViewController new];
            [[self viewController].navigationController pushViewController:vc animated:YES];
        }else{
            BaseNavigationViewController * homenav = [[BaseNavigationViewController alloc] initWithRootViewController:[UserLoginViewController new]];
            [[self viewController] presentViewController:homenav animated:YES completion:^{
                
            }];
        }
    }
}


- (void)layoutSubviews{
    [super layoutSubviews];
    WS(ws);
    [self mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(ws.contentSize.height);
    }];
}
@end
