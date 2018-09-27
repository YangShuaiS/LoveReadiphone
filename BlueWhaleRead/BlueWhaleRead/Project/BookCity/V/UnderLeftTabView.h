//
//  UnderLeftTabView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/3.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseTableView.h"
typedef void(^BlockModel)(NSIndexPath * indexpath);
@interface UnderLeftTabView : BaseTableView
@property (nonatomic, strong) NSMutableArray* itemarray;
@property (nonatomic,copy)BlockModel block;//定义一个MyBlock属性

@end
