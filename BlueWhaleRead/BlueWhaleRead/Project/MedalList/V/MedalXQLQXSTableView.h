//
//  MedalXQLQXSTableView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/13.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseTableView.h"
typedef void(^BlockFloat)(CGFloat flo);

@interface MedalXQLQXSTableView : BaseTableView
@property (nonatomic,copy)BlockFloat block;//定义一个MyBlock属性
@property (nonatomic,strong) NSMutableArray* itemarray;
@property (nonatomic, assign) NSInteger Booknumber;

@end
