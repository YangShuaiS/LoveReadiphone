//
//  NKRRecommendedCollectionView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/2/14.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "BaseCollectionView.h"

NS_ASSUME_NONNULL_BEGIN

@interface NKRRecommendedCollectionView : BaseCollectionView
@property (nonatomic,assign)  NSInteger style;
@property (nonatomic, strong) NSMutableArray* itemarray;
@property (nonatomic , assign)NSInteger allinter;

@end

NS_ASSUME_NONNULL_END
