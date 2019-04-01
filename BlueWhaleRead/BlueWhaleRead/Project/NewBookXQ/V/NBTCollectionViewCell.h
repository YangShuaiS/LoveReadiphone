//
//  NBTCollectionViewCell.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/3/18.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "BaseCollectionViewCell.h"
#import "NewBookTopClickModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface NBTCollectionViewCell : BaseCollectionViewCell
@property(nonatomic,strong)NewBookTopClickModel * model;
@end

NS_ASSUME_NONNULL_END
