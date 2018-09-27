//
//  UnderTabView.h
//  BoWanJuanForPad
//
//  Created by 杨帅 on 2018/6/1.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseTableView.h"
typedef void(^BlockModel)(NSIndexPath * indexpath);

@interface UnderTabView : BaseTableView
@property (nonatomic,copy)BlockModel block;//定义一个MyBlock属性
@property (nonatomic, strong) NSMutableArray* itemarray;
- (void)xianshi;
@end
