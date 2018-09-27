//
//  TXXunZhangModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/21.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"
#import "TZXZArticle.h"
@interface TXXunZhangModel : BaseModel
@property (nonatomic, copy) NSNumber * code;
@property (nonatomic, copy) NSString * message;

@property(nonatomic,strong) TZXZArticle * article;
+ (void)InitializeModel;

@end
