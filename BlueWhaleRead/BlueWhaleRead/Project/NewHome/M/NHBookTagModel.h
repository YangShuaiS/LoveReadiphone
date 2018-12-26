//
//  NHBookTagModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/3.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface NHBookTagModel : BaseModel
@property (nonatomic, copy) NSString * is_theme;
@property (nonatomic, copy) NSString * name;
@property (nonatomic, copy) NSString * ssid;
@property (nonatomic, strong) NSMutableArray *bookList;//书列表

@end

NS_ASSUME_NONNULL_END
