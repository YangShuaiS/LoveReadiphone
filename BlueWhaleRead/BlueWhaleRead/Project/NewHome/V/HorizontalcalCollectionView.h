//
//  HorizontalcalCollectionView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/3.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseCollectionView.h"

NS_ASSUME_NONNULL_BEGIN

@interface HorizontalcalCollectionView : BaseCollectionView
@property(nonatomic,strong)NSMutableArray * itemArray;
@property(nonatomic,strong)NSDate * lastdate;
@property(nonatomic,strong)NSString * djq;
@property(nonatomic,assign)NSInteger qishi;
@property(nonatomic,assign)NSInteger indext;

@end

NS_ASSUME_NONNULL_END
