//
//  MedalStudenBookModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/25.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"

@interface MedalStudenBookModel : BaseModel
@property (nonatomic, copy) NSString * cover;
@property (nonatomic, assign) NSInteger is_read;//是否已读       1-》未阅读 2-》已阅读
@property (nonatomic, copy) NSString * ssid;

@end
