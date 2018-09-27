//
//  BadgeOnlyImageModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/19.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"

@interface BadgeOnlyImageModel : BaseModel

@property (nonatomic, copy) NSString * min_logo;
@property (nonatomic, assign) NSInteger book_count;
@property (nonatomic, copy) NSString * is_completed;
@property (nonatomic, copy) NSString * ssid;
@property (nonatomic, assign) NSInteger task_num;



//@property (nonatomic, copy) NSString * badge_id;
//@property (nonatomic, copy) NSString * logo;
//@property(nonatomic, assign) NSInteger badge_read_num;
@end
