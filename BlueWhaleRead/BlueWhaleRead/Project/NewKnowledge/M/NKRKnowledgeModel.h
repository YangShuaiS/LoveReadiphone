//
//  NKRKnowledgeModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/2/19.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface NKRKnowledgeModel : BaseModel
@property (nonatomic, copy) NSString * banner_foreword;
@property (nonatomic, copy) NSString * banner_img;
@property (nonatomic, copy) NSString * banner_img1;
@property (nonatomic, assign) NSInteger related_type;
@property (nonatomic, copy) NSString * title;
@property (nonatomic, copy) NSString * ssid;


@property (nonatomic, assign) NSInteger inter;//0 小  1 大  
@property (nonatomic, assign) NSInteger duigou;//0 小  1 大  or 0 未选中 1 选中

@property (nonatomic, assign) NSInteger banner_type;

@end

NS_ASSUME_NONNULL_END
