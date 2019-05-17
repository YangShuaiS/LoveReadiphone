//
//  NKRRecommendedCollectionViewCell.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/2/14.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "BaseCollectionViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface NKRRecommendedCollectionViewCell : BaseCollectionViewCell
@property (nonatomic,assign)  NSInteger style;
@property(nonatomic,strong)NKRKnowledgeModel * model;
@property (nonatomic , assign)NSInteger bkzt;//编辑状态
@property (nonatomic , assign)NSInteger sfsj;//是否是随机数


@end

NS_ASSUME_NONNULL_END
