//
//  BookXQModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/12.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"
#import "BookXQbookModel.h"
#import "BookXQBookReview.h"
#import "BookXQReadFriendModel.h"
#import "BookXQReadThoughtModel.h"
#import "BookBuyLinkModel.h"
#import "knowledgeTXListModel.h"
@interface BookXQModel : BaseModel
@property (nonatomic, copy) NSNumber * code;
@property (nonatomic, copy) NSString * message;
@property (nonatomic, copy) NSString * bookDetailImgd;//xia
@property (nonatomic, copy) NSString * bookDetailImgu;//shang

@property (nonatomic, assign) BookReadingStyle status;
@property(nonatomic,strong) BookXQbookModel * book;


@property(nonatomic,strong) NSMutableArray * badgeList; // CityBadgeListModel
@property(nonatomic,strong) NSMutableArray * bookReview; //优秀书评
@property(nonatomic,strong) NSMutableArray * readFriend; //在读同学
@property(nonatomic,strong) NSMutableArray * readThought; //读后感列表
@property(nonatomic,strong) NSMutableArray * bookBuyLink; //购买列表

@property(nonatomic,strong) NSMutableArray * knowledgeTXList; //相关脉络图
@property(nonatomic,strong) NSMutableArray * bannerknowledgeList; //相关知识图



+ (void)InitializeModel;
@end
