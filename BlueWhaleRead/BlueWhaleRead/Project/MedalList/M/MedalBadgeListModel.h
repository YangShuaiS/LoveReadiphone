//
//  MedalBadgeListModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/13.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"

@interface MedalBadgeListModel : BaseModel
@property (nonatomic, copy) NSString * badgeNum;//点亮中的人数
@property (nonatomic, copy) NSString * getBadgeNum;//获得勋章的人数
@property (nonatomic, copy) NSString * logo;//勋章logo
@property (nonatomic, copy) NSString * name;//勋章名
@property (nonatomic, copy) NSString * ssid;//勋章id

@property (nonatomic, strong) NSMutableArray *studentList;

@end
