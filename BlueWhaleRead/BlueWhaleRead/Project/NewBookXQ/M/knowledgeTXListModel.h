//
//  knowledgeTXListModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/3/22.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface knowledgeTXListModel : BaseModel
@property (nonatomic, copy) NSString * times;
@property (nonatomic, copy) NSString * banner_seq;
@property (nonatomic, copy) NSString * ssid;
@property (nonatomic, copy) NSString * title;
@property (nonatomic, copy) NSString * banner_img;
@property (nonatomic, copy) NSString * banner_foreword;

@end

NS_ASSUME_NONNULL_END
