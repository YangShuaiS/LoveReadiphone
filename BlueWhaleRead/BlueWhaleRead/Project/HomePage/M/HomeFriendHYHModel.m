//
//  HomeFriendHYHModel.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/31.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "HomeFriendHYHModel.h"

@implementation HomeFriendHYHModel
+ (void)InitializeModel{
    [HomeFriendHYHModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"friendBook":@"BookFriendModel"};
    }];
}
@end
