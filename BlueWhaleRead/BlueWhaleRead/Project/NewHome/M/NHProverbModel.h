//
//  NHProverbModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/1.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface NHProverbModel : BaseModel
@property (nonatomic, copy) NSString * author;
@property (nonatomic, assign) NSInteger collection_num;
@property (nonatomic, assign) NSInteger is_collect;
@property (nonatomic, copy) NSString * show_time;

@property (nonatomic, copy) NSString * content;
@property (nonatomic, copy) NSString * ssid;
@property (nonatomic, copy) NSString * status;
@property (nonatomic, copy) NSString * img;
@property (nonatomic, copy) NSString * proverbImg;

@property (nonatomic, copy) NSDateComponents * timedate;
@property (nonatomic, assign) NSInteger clicksatatus;




@end

NS_ASSUME_NONNULL_END
