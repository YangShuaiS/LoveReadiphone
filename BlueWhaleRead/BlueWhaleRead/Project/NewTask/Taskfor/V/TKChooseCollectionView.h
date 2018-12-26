//
//  TKChooseCollectionView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/4.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseCollectionView.h"

NS_ASSUME_NONNULL_BEGIN

@interface TKChooseCollectionView : BaseCollectionView
@property(nonatomic,strong)NSMutableArray * itemArray;
@property (assign, nonatomic) CGFloat time;
@property (assign, nonatomic) NSInteger booknum;

@end

NS_ASSUME_NONNULL_END
