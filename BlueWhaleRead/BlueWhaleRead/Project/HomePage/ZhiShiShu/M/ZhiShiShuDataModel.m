//
//  ZhiShiShuDataModel.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/9/29.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "ZhiShiShuDataModel.h"

@implementation ZhiShiShuDataModel
- (NSMutableArray *)click{
    if (_click == nil) {
        _click = [NSMutableArray array];
    }
    return _click;
}
@end
