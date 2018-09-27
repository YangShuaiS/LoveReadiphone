//
//  YouXiuSPTableViewCell.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/13.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseTableViewCell.h"
typedef void(^ClickBlock)(void);//

@interface YouXiuSPTableViewCell : BaseTableViewCell
@property (nonatomic, strong) BookXQBookReview* model;
@property(nonatomic,strong)ClickBlock block;

@end
