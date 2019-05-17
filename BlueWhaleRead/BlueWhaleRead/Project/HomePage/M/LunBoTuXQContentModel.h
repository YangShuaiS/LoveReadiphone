//
//  LunBoTuXQContentModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/28.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseView.h"

@interface LunBoTuXQContentModel : BaseView
@property (nonatomic, copy) NSString * banner_img;
@property (nonatomic, copy) NSString * content_img;
@property (nonatomic, assign) NSInteger banner_type;

@property (nonatomic, copy) NSString * content;
@property (nonatomic, copy) NSString * ssid;
@property (nonatomic, copy) NSString * status;
@property (nonatomic, copy) NSString * title;
//@property (nonatomic, strong) CreatetimeModel * create_time;
@property(nonatomic,copy) NSString * create_time;

@property (nonatomic, copy) NSString * is_share;

@end
