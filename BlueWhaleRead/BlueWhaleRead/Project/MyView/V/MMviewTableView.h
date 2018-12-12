//
//  MMviewTableView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/28.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseTableView.h"

NS_ASSUME_NONNULL_BEGIN
typedef void(^GenBlock)(NSInteger inter);
@interface MMviewTableView : BaseTableView
@property (nonatomic , strong)MyUserInfo * model;
@property(nonatomic,copy)GenBlock block;
@end

NS_ASSUME_NONNULL_END
