//
//  MyDeModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/24.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"
#import "MyUserInfo.h"
#import "BageLeveListModel.h"
#import "MyZiLiaoModel.h"
@interface MyDeModel : BaseModel
@property (nonatomic, copy) NSNumber * code;
@property (nonatomic, copy) NSString * message;
@property (nonatomic, copy) NSString * is_balance;//0否
@property (nonatomic, strong) MyUserInfo * userinfo;//0否
@property (nonatomic, strong) NSMutableArray * myBadgeList;//我的勋章列表

@property (nonatomic, copy) NSString * user;//用户信息
@property (nonatomic, copy) NSString * abilityNum;//阅读能力
@property (nonatomic, copy) NSString * myReadNum;//阅读本书
@property (nonatomic, copy) NSString * myGlossary;//我的识词量
@property (nonatomic, copy) NSString * myLiteracy;//我的识字量



+ (void)InitializeModel;

@end
