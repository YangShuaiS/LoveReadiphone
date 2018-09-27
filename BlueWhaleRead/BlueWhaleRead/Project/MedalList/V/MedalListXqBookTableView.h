//
//  MedalListXqBookTableView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/7.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseTableView.h"
typedef void(^CgfloatBlock)(CGFloat flo);

@interface MedalListXqBookTableView : BaseTableView

@property (nonatomic,strong) NSMutableArray* itemarray;
@property(nonatomic,copy)CgfloatBlock block;
@property(nonatomic,strong)MedalListBadgeInfoModel * model;
@end
