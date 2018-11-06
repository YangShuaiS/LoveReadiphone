//
//  MeModel.h
//  BoWanJuanForPad
//
//  Created by 杨帅 on 2018/5/22.
//  Copyright © 2018年 YS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LINSHI.h"


#import "LCBMilestone.h"//里程碑

#import "PushModel.h"
#import "AttributedStringModel.h"

#import "UnderModel.h"

#import "HomePage.h"
#import "FoundModel.h" //发现model
#import "BookCityModel.h"
#import "BookXQModel.h"
#import "MedalListModel.h"
#import "MedalListXqModel.h"
#import "UnreadBookListModel.h"    //未读书籍model
#import "ReadBookListModel.h"     //已读
#import "MyClassListModel.h"      //班级
#import "FriendCodeModel.h"       //他人信息页
#import "TheTopPicModel.h"        //题
#import "DTJieGuoModel.h"         //答题结果
#import "TXXunZhangModel.h"
#import "ShiZiLiangModel.h"      //识字量
#import "ShiCiLiangModel.h"      //识词量
#import "TiStyleModel.h"
#import "TiMuModel.h"          //题目
#import "BaseModel.h"
#import "GenPopViewModel.h"
#import "MyDeModel.h"//我的
#import "ZHUTIMODEL.h"//主题
#import "AchievementModel.h"//成就报表


#import "GeneralUpView.h"   //弹出视图
#import "GeneraNoDataView.h"

#import "UserLoginModel.h" //登录
#import "SearchCitBookModel.h"//搜索

#import "MyMessageListModel.h"
#import "MyMessageModel.h"

#import "MonthPMModel.h"

#import "LunBoTuXQModel.h"

#import "ClassBJDTModel.h"//班级动态

#import "MyBadgeListModel.h"//我的勋章

#import "HomeFriendHYHModel.h"//换一换

#import "JoinBookModel.h"//加入书架model

#import "ZhiShiShuModel.h"//知识树model

#import "ZhiShiShuXqModel.h" //知识树model详情
#import "ZhiShiShuFLModel.h"//知识树分类
#import "UserCityModel.h"//城市

#import "FenXiangModel.h"//分享
@interface MeModel : BaseModel
@property (nonatomic, copy) NSString *avatar;
@property (nonatomic, strong) NSString *code;
@property (nonatomic, copy) NSString *level;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *phone;
@property (nonatomic, copy) NSString *school_id;
@property (nonatomic, copy) NSString *score;
@property (nonatomic, copy) NSString *sex;
@property (nonatomic, copy) NSString *ssid;
@property (nonatomic, copy) NSString *status;
@property (nonatomic, copy) NSString *token;
@property(nonatomic,assign)NSInteger loginStyle;//登录状态,1为登录成功
@property (nonatomic, copy) NSString *userid;

+ (MeModel *)SharedModel;
- (MeModel *)ADDvalue;
@end
