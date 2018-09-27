//
//  MingShiDDTableView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/12.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseTableView.h"
typedef void(^CgfloatBlock)(CGFloat flo);

@interface MingShiDDTableView : BaseTableView
@property (nonatomic, strong) NSMutableArray* itemarray;
@property(nonatomic,copy)CgfloatBlock block;

@end
