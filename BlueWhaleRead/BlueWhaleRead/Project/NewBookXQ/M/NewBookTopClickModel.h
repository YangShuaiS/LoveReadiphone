//
//  NewBookTopClickModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/3/18.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface NewBookTopClickModel : BaseModel
@property (nonatomic, copy) NSString * title;
@property (nonatomic, copy) NSString * downtitle;
@property (nonatomic, copy) NSString * image;
@property (nonatomic, assign) NSInteger is_like;
@property (nonatomic, assign) NSInteger style;//1 不可点击 0 可点击

@end

NS_ASSUME_NONNULL_END
