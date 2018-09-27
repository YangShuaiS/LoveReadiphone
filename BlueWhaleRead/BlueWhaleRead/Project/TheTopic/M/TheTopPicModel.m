//
//  TheTopPicModel.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/20.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "TheTopPicModel.h"

@implementation TheTopPicModel
+ (void)InitializeModel{
    [TheTopPicModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"bookProblems":@"BookProblemsModel"};
    }];
}
@end
