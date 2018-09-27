//
//  BageLeveListModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/24.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"

@interface BageLeveListModel : BaseModel
@property (nonatomic, assign) NSInteger level;
@property (nonatomic, strong) NSMutableArray * levelbadgeList;//勋章列表

@end
