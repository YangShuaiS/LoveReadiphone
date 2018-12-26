//
//  TKIssueCollectionView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/30.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseCollectionView.h"

NS_ASSUME_NONNULL_BEGIN
@interface TKIssueCollectionView : BaseCollectionView
@property(nonatomic,strong)NSMutableArray * itemArray;
@property(nonatomic,strong)TKPWQpastLottery1InfoModel * model;

@property(nonatomic,strong)UIViewController* vc;

@end

NS_ASSUME_NONNULL_END
