//
//  MyMessageXQViewController.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/7.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseViewController.h"
typedef void(^Remove)(void);

@interface MyMessageXQViewController : BaseViewController
@property(nonatomic,strong)Remove block;
@property(nonatomic,strong)MyMessageModel * model;
@end
