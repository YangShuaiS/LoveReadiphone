//
//  MingShiDDViewController.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/12.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseViewController.h"
typedef void(^CgfloatBlock)(CGFloat flo);
@interface MingShiDDViewController : BaseViewController
@property (nonatomic, strong) NSMutableArray* itemarray;
@property(nonatomic,copy)CgfloatBlock block;

@end
