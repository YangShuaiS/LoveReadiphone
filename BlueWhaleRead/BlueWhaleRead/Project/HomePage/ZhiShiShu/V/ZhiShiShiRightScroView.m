//
//  ZhiShiShiRightScroView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/2/25.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "ZhiShiShiRightScroView.h"
@implementation ZhiShiShiRightScroView{

}
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addview];
    }
    return self;
}

- (void)addview{
    WS(ws);
    self.backgroundColor = RGBA(0, 0, 0, 0.4);
}


@end
