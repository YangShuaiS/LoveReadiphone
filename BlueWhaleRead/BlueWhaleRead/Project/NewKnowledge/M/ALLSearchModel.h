//
//  ALLSearchModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/2/19.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "BaseModel.h"
#import "AllSearchWZModel.h"
#import "AllSearchZYModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface ALLSearchModel : BaseModel
@property (nonatomic, copy) NSNumber * code;
@property (nonatomic, copy) NSString * message;
@property (nonatomic, strong) NSMutableArray *bannerdata;//文章
@property (nonatomic, strong) NSMutableArray *bookdata;//书
@property (nonatomic, strong) NSMutableArray *knowledgedata;//知识网
@property (nonatomic, strong) NSMutableArray *bookList;//知识网

+ (void)InitializeModel;

@end

NS_ASSUME_NONNULL_END
