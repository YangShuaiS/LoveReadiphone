//
//  SearchRelatedView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/2/15.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN
typedef void(^push)(NSInteger inter);
@interface SearchRelatedView : BaseView
@property (nonatomic , strong)NSMutableArray * itemarray;
@property(nonatomic,copy)push pushblock;

@end

NS_ASSUME_NONNULL_END
