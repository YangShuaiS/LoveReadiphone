//
//  SearchMyHistoryViewController.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/2/21.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface SearchMyHistoryViewController : BaseViewController
@property(nonatomic,strong)NSString * titles;
@property(nonatomic,assign)NSInteger style; // 2 我的视野  3  相关推荐  4 书详情相关

@property(nonatomic,strong)NSString * ssid;

@end

NS_ASSUME_NONNULL_END
