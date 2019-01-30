//
//  MMyCollectionView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/1/16.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "BaseCollectionView.h"

NS_ASSUME_NONNULL_BEGIN
typedef void(^GenBlock)(NSInteger inter);
@interface MMyCollectionView : BaseCollectionView
@property(nonatomic,copy)GenBlock block;

@end

NS_ASSUME_NONNULL_END
