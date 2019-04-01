//
//  NewTFameViewTableViewCell.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/3/28.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "BaseTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface NewTFameViewTableViewCell : BaseTableViewCell
@property(nonatomic,assign)NSInteger inter;
@property(nonatomic,strong)TFVUserModel * model;

@property(nonatomic,strong)NSString * type;
@end

NS_ASSUME_NONNULL_END
