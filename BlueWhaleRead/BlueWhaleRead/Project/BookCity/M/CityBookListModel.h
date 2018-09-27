//
//  CityBookListModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/12.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"

@interface CityBookListModel : BaseModel
@property (nonatomic, copy) NSString * author;//作者
@property (nonatomic, copy) NSString * b_score;//分数
@property (nonatomic, copy) NSString * catalogs;//分类id
@property (nonatomic, copy) NSString * cover;//头像
@property (nonatomic, assign) NSInteger imp_type;//精读/泛读 精读为1 泛读为2
@property (nonatomic, assign) NSInteger is_read;//是否已阅读 1为已加入书架，2是已读
@property (nonatomic, copy) NSString * levels;//等级
@property (nonatomic, copy) NSString * mark;//星级
@property (nonatomic, copy) NSString * master_id;//主图书id
@property (nonatomic, copy) NSString * name;//书名
@property (nonatomic, copy) NSString * pages;//页数
@property (nonatomic, copy) NSString * ssid;//书id
@property (nonatomic, copy) NSString * publish_time;//发版时间    
@property (nonatomic, copy) NSString * status;//状态
@property(nonatomic,strong) NSMutableArray * badgeList;//勋章列表

@end
