//
//  MedalLQXSViewController.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/13.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseViewController.h"
typedef void(^CgfloatBlock)(CGFloat flo);

@interface MedalLQXSViewController : BaseViewController
@property (nonatomic, strong) NSMutableArray* itemarray;
@property (nonatomic, assign) NSInteger Booknumber;
@property(nonatomic,copy)CgfloatBlock block;

@end
