//
//  TZXZArticle.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/21.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"

@interface TZXZArticle : BaseModel
@property (nonatomic, copy) NSString * article_id;
@property (nonatomic, copy) NSString * content;
@property (nonatomic, copy) NSString * title;
@property (nonatomic, assign) NSInteger use_time;
@property (nonatomic, strong) NSMutableArray *questionList;

@end
