//
//  TKJIEGUOMODEL.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/23.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"

@interface TKJIEGUOMODEL : BaseModel
@property (nonatomic, copy) NSNumber * code;
@property (nonatomic, copy) NSString * message;
@property (nonatomic, copy) NSString * badgeId;//勋章id
@property (nonatomic, copy) NSString * badgeMinLogo;//勋章图片
@property (nonatomic, copy) NSString * badgeName;//勋章名
@property (nonatomic, assign) NSInteger badgeNum;//勋章个数
//@property (nonatomic, copy) NSString * book_id;//书id
//@property (nonatomic, copy) NSString * book_name;//书名
@property (nonatomic, copy) NSString * bookId;//书id
@property (nonatomic, copy) NSString * bookName;//书名
@property (nonatomic, assign) NSInteger challengeTime;//挑战时间
@property (nonatomic, assign) NSInteger correctAnswer;//正确回答数
@property (nonatomic, assign) NSInteger isPassed;//0为不通过1通过
@property (nonatomic, assign) NSInteger newCompleted;//剩余答题次数
@property (nonatomic, assign) NSInteger studentBadgeNum;//学生阅读书个数
@property (nonatomic, assign) NSInteger totalAnswer;//错误回答数
@property (nonatomic, assign) NSInteger totalScore;//总分数
@property (nonatomic, assign) NSInteger score;//此次得分



@property (nonatomic, assign) NSInteger task_num;//此次得分



@property (nonatomic, strong) NSMutableArray * badgeBooks;//勋章书籍数组
+ (void)InitializeModel;

@end
