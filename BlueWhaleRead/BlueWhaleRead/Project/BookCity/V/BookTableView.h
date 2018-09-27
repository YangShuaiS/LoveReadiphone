//
//  BookTableView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/11.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseTableView.h"
typedef void(^BlockFloat)(CGFloat flo);

@interface BookTableView : BaseTableView
@property (nonatomic, strong) NSMutableArray* itemarray;
@property (nonatomic,copy)BlockFloat block;//定义一个MyBlock属性

@property(nonatomic,assign)NSInteger inter;
@end
