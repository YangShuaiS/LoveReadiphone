//
//  HAllTaskCollectionViewCell.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/1.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseCollectionViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface HAllTaskCollectionViewCell : BaseCollectionViewCell
@property(nonatomic,strong)NHmissionListModel * model;
@property(nonatomic,assign)NSInteger inter;

@end

NS_ASSUME_NONNULL_END
