//
//  TAskForViewController.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/4.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface TAskForViewController : BaseViewController
@property (strong, nonatomic) NSString *navtitle;

@property (strong, nonatomic) NSString * weizhi;//样式id

@property (strong, nonatomic) NSString * type;//样式id
@property (strong, nonatomic) NSString *missionid;//任务id
@property (strong, nonatomic) NSString *studentMissionid;//任务id


@property (strong, nonatomic) NSString *friendid;//他人id  type=2

@end

NS_ASSUME_NONNULL_END
