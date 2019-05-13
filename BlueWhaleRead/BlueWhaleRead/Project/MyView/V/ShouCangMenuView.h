//
//  ShouCangMenuView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/4/14.
//  Copyright © 2019 YS. All rights reserved.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN
typedef void(^clickallNow)(NSInteger inter);

@interface ShouCangMenuView : BaseView
@property (nonatomic, strong) NSArray *controllerArray;
@property (nonatomic, strong) NSArray *titarray;
@property(nonatomic,copy)clickallNow blocks;

@end

NS_ASSUME_NONNULL_END
