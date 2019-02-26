//
//  SearchAllViewController.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/2/14.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN
typedef void(^click)(NSString * string);
typedef void(^push)(NSInteger inter);
@interface SearchAllViewController : BaseViewController
@property(nonatomic,copy)click block;
@property(nonatomic,copy)push pushblock;

@property(nonatomic,strong)ALLSearchModel * model;

@end

NS_ASSUME_NONNULL_END
