//
//  TPHBTableViewCell.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/30.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface TPHBTableViewCell : BaseTableViewCell
@property(nonatomic,assign)NSInteger inter;
@property(nonatomic,strong)TFVUserModel * model;

@property(nonatomic,strong)NSString * bianse;
@end

NS_ASSUME_NONNULL_END
