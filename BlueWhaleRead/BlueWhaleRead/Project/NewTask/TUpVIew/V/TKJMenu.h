//
//  TKJMenu.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/30.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface TKJMenu : BaseView
@property (nonatomic, strong) NSArray *controllerArray;
@property (nonatomic, strong) NSArray *titarray;
@property (nonatomic, assign) NSInteger indext;
@end

NS_ASSUME_NONNULL_END
