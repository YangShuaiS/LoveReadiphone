//
//  TXXunZhangModel.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/21.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "TXXunZhangModel.h"

@implementation TXXunZhangModel
+ (void)InitializeModel{
    [TZXZArticle mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"questionList":@"BookProblemsModel"};
    }];
}
@end
