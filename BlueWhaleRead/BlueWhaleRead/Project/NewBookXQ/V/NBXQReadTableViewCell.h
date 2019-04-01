//
//  NBXQReadTableViewCell.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/3/19.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "BaseTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN
typedef void(^ClickBlock)(void);//

@interface NBXQReadTableViewCell : BaseTableViewCell
@property (nonatomic, strong) BookXQReadThoughtModel * model;
@property(nonatomic,strong)ClickBlock block;
@property(nonatomic,assign)NSInteger top;
@property(nonatomic,assign)NSInteger styles;

@end

NS_ASSUME_NONNULL_END
