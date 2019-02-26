//
//  NKRClassificationCollectionViewCell.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/2/14.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "BaseCollectionViewCell.h"
#import "NKRClassificationModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface NKRClassificationCollectionViewCell : BaseCollectionViewCell
@property (nonatomic, strong) NKRClassificationModel * model;

@end

NS_ASSUME_NONNULL_END
