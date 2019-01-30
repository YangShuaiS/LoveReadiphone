//
//  NHmissionListModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/3.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface NHmissionListModel : BaseModel
@property (nonatomic, copy) NSString * completed_num;//完成个数
@property (nonatomic, copy) NSString * mission_background;
@property (nonatomic, copy) NSString * mission_check_background;
@property (nonatomic, copy) NSString * mission_content_img;//?
@property (nonatomic, copy) NSString * mission_img;//?


@property (nonatomic, copy) NSString * mission_info;//?
@property (nonatomic, copy) NSString * mission_name;
@property (nonatomic, copy) NSString * mission_type;
@property (nonatomic, copy) NSString * received_num;//领取
@property (nonatomic, copy) NSString * ssid;


@end

NS_ASSUME_NONNULL_END
