//
//  TKXQRLCollectionView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/5.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseCollectionView.h"

NS_ASSUME_NONNULL_BEGIN
typedef void(^zhuangtai)(NSInteger inter);

@interface TKXQRLCollectionView : BaseCollectionView
@property(nonatomic,strong)NSMutableArray * itemArray;
@property(nonatomic,assign)NSInteger qishi;
@property(nonatomic,copy)zhuangtai block;

@end

NS_ASSUME_NONNULL_END
