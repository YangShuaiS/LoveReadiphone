//
//  AllBookListModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/13.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"

@interface AllBookListModel : BaseModel
@property (nonatomic, copy) NSString * author;
@property (nonatomic, copy) NSString * b_score;
@property (nonatomic, copy) NSString * cover;
@property (nonatomic, copy) NSString * imp_type;//类型
@property (nonatomic, assign) NSInteger is_read;//
@property (nonatomic, copy) NSString * levels;
@property (nonatomic, copy) NSString * mark;
@property (nonatomic, copy) NSString * name;
@property (nonatomic, copy) NSString * pages;
@property (nonatomic, copy) NSString * publish_time;
@property (nonatomic, copy) NSString * ssid;
@property (nonatomic, copy) NSString * status;
@property (nonatomic, copy) NSString * is_like;
@property (nonatomic, assign) NSInteger joinstyle;


@property (nonatomic, strong) NSMutableArray *badgeList;

@end
