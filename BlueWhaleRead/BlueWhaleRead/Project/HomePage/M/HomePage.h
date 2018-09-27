//
//  HomePage.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/11.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"
#import "BadgeListModel.h"
#import "BookFriendModel.h"
#import "ReadPeopleModel.h"
#import "DynamicListModel.h"
#import "LunboModel.h"
#import "TagModel.h"
#import "TestImgListModel.h"
#import "TypeListModel.h"
#import "BookListModel.h"
#import "HomeuserModel.h"
#import "HomebadgelistModel.h"
#import "HomemilestoneModel.h"
@interface HomePage : BaseModel
@property (nonatomic, copy) NSNumber * code;
@property (nonatomic, copy) NSString * message;
@property (nonatomic, strong) HomeuserModel * student;//头部用户信息
@property (nonatomic, strong) NSMutableArray *iconList;//icon列表
@property (nonatomic, strong) NSMutableArray *bannerList;//轮播图
@property (nonatomic, strong) NSMutableArray *classStudent;//班级动态
@property (nonatomic, strong) TypeListModel *typeList;
@property (nonatomic, strong) NSMutableArray *hotBadge;//热门勋章
@property (nonatomic, strong) NSMutableArray *friendBook;
@property(nonatomic,assign) NSInteger friendBookCount;

//@property (nonatomic, strong) NSMutableArray *testImgList;

+ (void)InitializeModel;

@end

