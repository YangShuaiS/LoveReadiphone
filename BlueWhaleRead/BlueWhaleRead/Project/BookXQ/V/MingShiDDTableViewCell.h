//
//  MingShiDDTableViewCell.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/12.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseTableViewCell.h"
typedef void(^ClickBlock)(void);//

@interface MingShiDDTableViewCell : BaseTableViewCell
@property (nonatomic, strong) BookXQReadThoughtModel * model;

@property(nonatomic,strong)ClickBlock block;

@end
