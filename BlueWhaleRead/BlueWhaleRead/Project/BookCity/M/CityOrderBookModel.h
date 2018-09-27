//
//  CityOrderBookModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/12.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"

@interface CityOrderBookModel : BaseModel
@property (nonatomic, copy) NSString * sort;//排序方式
@property (nonatomic, copy) NSString * ssid;
@property (nonatomic, assign) NSInteger type;
@end
