//
//  SearchHistoryCollectionView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/2/15.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "BaseCollectionView.h"

NS_ASSUME_NONNULL_BEGIN
typedef void(^click)(NSString * string);

@interface SearchHistoryCollectionView : BaseCollectionView
@property(nonatomic,strong)NSMutableArray * itemarray;
@property(nonatomic,copy)click block;

@end

NS_ASSUME_NONNULL_END
