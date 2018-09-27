//
//  MedalListXqModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/13.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"
#import "MedalListBadgeInfoModel.h"

#import "MedalListDetailModel.h"
#import "AllBookListModel.h"
#import "AllGetFriendModel.h"
#import "MedalStudentListModel.h"
#import "MedalStudenBookModel.h"
@interface MedalListXqModel : BaseModel
@property (nonatomic, copy) NSNumber * code;
@property (nonatomic, copy) NSString * message;
@property (nonatomic, strong) MedalListBadgeInfoModel *badgeInfo;
@property (nonatomic, strong) NSMutableArray *bookList;
@property (nonatomic, strong) NSMutableArray *badgeStudentList;//AllBookListModel 数据统一
@property (nonatomic, strong) NSMutableArray *studentbookList;
@property (nonatomic, assign) CGFloat studentCompletedNum;//学生完成数

@property(nonatomic,assign)NSInteger is_completed;



@property (nonatomic, strong) MedalListDetailModel *badgeDetail;
 
+ (void)InitializeModel;
@end
