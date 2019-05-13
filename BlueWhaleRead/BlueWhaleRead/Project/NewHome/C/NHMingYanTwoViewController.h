//
//  NHMingYanTwoViewController.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/4/15.
//  Copyright © 2019 YS. All rights reserved.
//

#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN
typedef void(^ClickInter)(NSInteger now);

@interface NHMingYanTwoViewController : BaseViewController
@property(nonatomic,strong)NSMutableArray * itemarray;
@property(nonatomic,copy)ClickInter blocks;

@end

NS_ASSUME_NONNULL_END
