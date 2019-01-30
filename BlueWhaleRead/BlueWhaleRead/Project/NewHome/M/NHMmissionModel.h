//
//  NHMmissionModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/3.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface NHMmissionModel : BaseModel
@property (nonatomic, copy) NSString * completed_num;
@property (nonatomic, copy) NSString * mission_background;
@property (nonatomic, copy) NSString * mission_check_background;
@property (nonatomic, copy) NSString * mission_content_img;
@property (nonatomic, copy) NSString * mission_name;
@property (nonatomic, copy) NSString * mission_type;//1 新手 3 自建 5   初阶    6   中阶    7   高阶
@property (nonatomic, copy) NSString * periods_num;

@property (nonatomic, copy) NSString * next_mission;
@property (nonatomic, copy) NSString * next_mission_name;
@property (nonatomic, copy) NSString * score;

@property (nonatomic, copy) NSString * ssid;

@end

NS_ASSUME_NONNULL_END
