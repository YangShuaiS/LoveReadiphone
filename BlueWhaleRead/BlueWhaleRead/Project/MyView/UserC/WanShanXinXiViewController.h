//
//  WanShanXinXiViewController.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/10/22.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseViewController.h"
typedef NS_ENUM(NSInteger, WanShanXinXiStyle) {
    WanShanXinXiStyleScholl = 0,//
    WanShanXinXiStyleClass = 1,//班级
};
typedef void(^GenBlock)(void);
@interface WanShanXinXiViewController : BaseViewController
@property(nonatomic,assign)WanShanXinXiStyle style;
@property(nonatomic,copy)GenBlock block;

@end

