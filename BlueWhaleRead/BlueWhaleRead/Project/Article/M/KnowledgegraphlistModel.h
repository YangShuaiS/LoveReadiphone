//
//  KnowledgegraphlistModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/5/16.
//  Copyright © 2019 YS. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface KnowledgegraphlistModel : BaseModel
@property (nonatomic, copy) NSString * img;
@property (nonatomic, assign) CGFloat with;
@property (nonatomic, assign) CGFloat height;

@end

NS_ASSUME_NONNULL_END
