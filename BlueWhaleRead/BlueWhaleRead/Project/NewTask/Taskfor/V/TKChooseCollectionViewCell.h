//
//  TKChooseCollectionViewCell.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/4.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseCollectionViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface TKChooseCollectionViewCell : BaseCollectionViewCell
@property(nonatomic,strong)NSString * string;
@property(nonatomic,strong)TKbuiltModel * model;


- (void)xz;
- (void)wxz;
@end

NS_ASSUME_NONNULL_END
