//
//  FoundUserModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/4.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseView.h"

@interface FoundUserModel : BaseView
@property (nonatomic, copy) NSString * avatar;
@property (nonatomic, copy) NSString * ssid;
@property (nonatomic, assign) NSInteger sex;
@property (nonatomic, strong) NSMutableArray *myFriend;

@end
