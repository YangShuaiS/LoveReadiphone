//
//  MyMessageModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/26.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"

@interface MyMessageModel : BaseModel
@property (nonatomic, copy) NSString * content;
@property (nonatomic, assign) NSInteger is_read;
@property (nonatomic, copy) NSString * source;
@property (nonatomic, copy) NSString * ssid;
@property (nonatomic, copy) NSString * title ;
@property (nonatomic, copy) NSString * receiver ;
@property (nonatomic, copy) NSString * send_id ;
@property(nonatomic,copy) NSString * create_time;
//@property(nonatomic,strong)CreatetimeModel * create_time;
@end
