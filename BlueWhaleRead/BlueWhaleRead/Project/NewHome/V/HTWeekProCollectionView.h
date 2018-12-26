//
//  HTWeekProCollectionView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/1.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseCollectionView.h"

NS_ASSUME_NONNULL_BEGIN

@interface HTWeekProCollectionView : BaseCollectionView
@property(nonatomic,strong)NSMutableArray * itemArray;
@property(nonatomic,assign)NSInteger inter;

@property (nonatomic , strong)UIFont * fount;


@end

NS_ASSUME_NONNULL_END
