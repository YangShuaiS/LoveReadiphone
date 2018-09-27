//
//  UnreadBookModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/19.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"

@interface UnreadBookModel : BaseModel
@property (nonatomic, copy) NSString * author;
@property (nonatomic, copy) NSString * b_score;//书分数
@property (nonatomic, strong) NSMutableArray *badgeList;//勋章
@property (nonatomic, copy) NSString * cover;//封皮
@property (nonatomic, assign) NSInteger dayTimes;//剩余次数
@property (nonatomic, copy) NSString * imp_type;//精读/泛读 精读为1 泛读为2
@property (nonatomic, copy) NSString * is_read;//状态 1-》未阅读 2-》已阅读
@property (nonatomic, copy) NSString * levels;//等级
@property (nonatomic, copy) NSString * mark;//星级
@property (nonatomic, copy) NSString * master_id;//主图书id
@property (nonatomic, copy) NSString * name;//书名
@property (nonatomic, copy) NSString * pages;//页数
@property (nonatomic, copy) NSString * publish_time;//发布时间
@property (nonatomic, copy) NSString * ssid;//书id
@property (nonatomic, assign) NSInteger is_like;//0 未选择  1 喜欢  2 不喜欢


@end
