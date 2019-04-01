//
//  NewHomeModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/1.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"
#import "LunboModel.h"
#import "NHProverbModel.h"
#import "NHmissionListModel.h"
#import "NHBookTagModel.h"
#import "NHMissionModel.h"
#import "NHTimeListModel.h"
//获奖弹出视图moel
#import "TKXSTaskXQModel.h"

#import "HTShareModel.h"//分享model

#import "UpAppModel.h"
#import "BookSDModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface NewHomeModel : BaseModel
@property (nonatomic, copy) NSNumber * code;
@property (nonatomic, copy) NSString * message;
@property (nonatomic, strong) NSMutableArray *bannerList;//轮播图
@property (nonatomic, strong) NSMutableArray *proverb;//每日谚语
@property (nonatomic, strong) NSMutableArray *missionList;//读书任务

@property (nonatomic, strong) NHBookTagModel * tag;
@property (nonatomic, strong) NHMissionModel * missionInfo;

//弹出通用
@property (nonatomic, copy) NSString * remaindDays;
@property (nonatomic, copy) NSString * prize_img;
@property (nonatomic, copy) NSString * periods_num;//期数

+ (void)InitializeModel;
@end

NS_ASSUME_NONNULL_END
