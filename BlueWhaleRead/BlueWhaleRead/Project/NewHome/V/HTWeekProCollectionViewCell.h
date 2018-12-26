//
//  HTWeekProCollectionViewCell.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/1.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseCollectionViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface HTWeekProCollectionViewCell : BaseCollectionViewCell
@property(nonatomic,strong)NSIndexPath * indexPath;
@property(nonatomic,strong)NHTimeListModel * model;

@end

NS_ASSUME_NONNULL_END
