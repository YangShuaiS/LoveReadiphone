//
//  TKXQRLCollectionViewCell.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/5.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseCollectionViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface TKXQRLCollectionViewCell : BaseCollectionViewCell
@property(nonatomic,strong)TKXQRLModel * model;
@property(nonatomic,strong)NSMutableArray * colorarray;

@end

NS_ASSUME_NONNULL_END
