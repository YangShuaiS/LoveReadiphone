//
//  SearchAllTableView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/2/20.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "BaseTableView.h"

NS_ASSUME_NONNULL_BEGIN
typedef void(^titleblock)(NSString * string);
typedef void(^push)(NSInteger inter);
@interface SearchAllTableView : BaseTableView
@property (nonatomic , strong)ALLSearchModel * model;
@property(nonatomic,copy)titleblock block;
@property(nonatomic,copy)push pushblock;

@end

NS_ASSUME_NONNULL_END
