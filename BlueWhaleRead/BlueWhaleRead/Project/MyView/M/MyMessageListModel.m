//
//  MyMessageListModel.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/26.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "MyMessageListModel.h"

@implementation MyMessageListModel
+ (void)InitializeModel{
    [MyMessageListModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"studentMessageList":@"MyMessageModel"};
    }];
}
@end
