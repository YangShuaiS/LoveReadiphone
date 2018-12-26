//
//  HTShareListModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/11.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface HTShareListModel : BaseModel
@property (nonatomic, copy) NSString * share_img;
@property (nonatomic, copy) NSString * share_name;
@property (nonatomic, copy) NSString * share_seq;
@property (nonatomic, copy) NSString * share_status;
@property (nonatomic, copy) NSString * ssid;
@property (nonatomic, copy) NSString * type;

@end

NS_ASSUME_NONNULL_END
