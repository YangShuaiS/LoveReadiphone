//
//  BookXQbookModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/12.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"

@interface BookXQbookModel : BaseModel
@property (nonatomic, copy) NSString * author;
@property (nonatomic, copy) NSString * b_score;
@property (nonatomic, copy) NSString * catalogs;//分类id
@property (nonatomic, copy) NSString * cover;//封皮
@property (nonatomic, assign) NSInteger imp_type;//精读/泛读 精读为1 泛读为2
@property (nonatomic, copy) NSString * info;//书简介
@property (nonatomic, assign) NSInteger is_read;//是否已读       1-》未阅读 2-》已阅读
@property (nonatomic, copy) NSString * isbn;
@property (nonatomic, copy) NSString * levels;//等级
@property (nonatomic, copy) NSString * mark;//星级
@property (nonatomic, copy) NSString * master_id;//主图书id
@property (nonatomic, copy) NSString * name;//书名
@property (nonatomic, copy) NSString * pages;//页数
@property (nonatomic, copy) NSString * publish_time;//发布时间
@property (nonatomic, copy) NSString * publisher;//出版社
@property (nonatomic, copy) NSString * ssid;//书id
@property (nonatomic, assign) NSInteger status;
@property(nonatomic,strong) NSMutableArray * badgeList; // CityBadgeListModel

@property (nonatomic, assign) NSInteger dayTimes;//剩余答题次数


@end
