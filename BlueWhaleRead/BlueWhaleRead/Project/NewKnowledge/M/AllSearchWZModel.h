//
//  AllSearchWZModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/2/19.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface AllSearchWZModel : BaseModel
@property (nonatomic, copy) NSString * banner_img;
@property (nonatomic, copy) NSString * banner_type;
@property (nonatomic, copy) NSString * ssid;
@property (nonatomic, copy) NSString * title;
@property (nonatomic, copy) NSString * create_time;
@property (nonatomic, copy) NSString * read_times;

@end

NS_ASSUME_NONNULL_END
