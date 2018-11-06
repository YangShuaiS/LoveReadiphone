//
//  ModifyNameViewController.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/1.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseViewController.h"
typedef void(^GenBlock)(void);

@interface ModifyNameViewController : BaseViewController
@property(nonatomic,copy)GenBlock block;

@end

