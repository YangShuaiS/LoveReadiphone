//
//  HomeLBTView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/7.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseView.h"
@interface HomeLBTView : BaseView<SDCycleScrollViewDelegate>
@property(nonatomic,strong)NSMutableArray * itemArray;

@end
