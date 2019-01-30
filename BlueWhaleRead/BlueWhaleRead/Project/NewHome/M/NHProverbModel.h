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
@property (nonatomic, copy) NSString * content;
@property (nonatomic, copy) NSString * ssid;
@property (nonatomic, copy) NSString * status;
@property (nonatomic, copy) NSString * img;
@property (nonatomic, copy) NSString * proverbImg;



@end

NS_ASSUME_NONNULL_END
