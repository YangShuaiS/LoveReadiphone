//
//  TPHBViewController.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/30.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN
typedef void(^click)(void);
@interface TPHBViewController : BaseViewController
@property (nonatomic, strong) NSString * type;
@property (nonatomic, strong) NSString * missionid;
@property (nonatomic, strong) NSMutableArray * itemarray;

@property(nonatomic,strong)NSString * bianse;

@property (nonatomic,strong) UINavigationController * nav;

@property(nonatomic,copy)click block;

@end

NS_ASSUME_NONNULL_END
