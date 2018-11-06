//
//  ReadBookListViewController.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/19.
//  Copyright © 2018年 YS. All rights reserved.
//  已读书籍列表

#import "BaseViewController.h"
typedef void(^ReadGenBlock)(NSMutableArray *array);
@interface ReadBookListViewController : BaseViewController
@property(nonatomic,strong)NSString * bookName;
@property(nonatomic,copy)ReadGenBlock block;

@end
