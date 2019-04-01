//
//  BookBuyLinkModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/3/22.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface BookBuyLinkModel : BaseModel
@property (nonatomic, copy) NSString * app_url;
@property (nonatomic, copy) NSString * book_id;
@property (nonatomic, copy) NSString * price;
@property (nonatomic, copy) NSString * program_url;
@property (nonatomic, assign) NSInteger source;
@property (nonatomic, copy) NSString * ssid;
@property (nonatomic, copy) NSString * status;

@end

NS_ASSUME_NONNULL_END
