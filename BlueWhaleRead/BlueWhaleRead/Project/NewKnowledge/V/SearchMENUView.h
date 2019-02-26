//
//  SearchMENUView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/2/15.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN
typedef void(^GenBlockInter)(NSInteger inter);
@interface SearchMENUView : BaseView
@property (nonatomic, strong) NSArray *controllerArray;
@property (nonatomic, strong) NSArray *titarray;
@property (nonatomic, assign) NSInteger initer;
@property (nonatomic, assign) NSInteger styles;//2不能滑动

@property(nonatomic,copy)GenBlockInter block;

@end

NS_ASSUME_NONNULL_END
