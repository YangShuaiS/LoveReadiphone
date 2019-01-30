//
//  HorizontalcalCollectionView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/3.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseCollectionView.h"

NS_ASSUME_NONNULL_BEGIN
typedef void(^click)(NSInteger week);
@interface HorizontalcalCollectionView : BaseCollectionView
@property(nonatomic,strong)NSMutableArray * itemArray;
@property(nonatomic,strong)NSDate * lastdate;
@property(nonatomic,strong)NSString * djq;
@property(nonatomic,assign)NSInteger qishi;
@property(nonatomic,assign)NSInteger indext;
@property(nonatomic,copy)click block;
@property(nonatomic,strong)NSMutableArray * colorarray;

@end

NS_ASSUME_NONNULL_END
