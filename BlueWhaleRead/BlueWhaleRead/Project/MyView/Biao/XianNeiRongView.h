//
//  XianNeiRongView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/25.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseView.h"
typedef NS_ENUM(NSInteger, XianNeiRongStyle) {
    XianNeiRongStyleTitle = 0,//title
    XianNeiRongStyleNeirong = 1,//内容
};
@interface XianNeiRongView : BaseView
- (instancetype)initWithStyle:(XianNeiRongStyle)style;
@property(nonatomic,strong)NSMutableArray * itemarray;
@property (nonatomic, strong) AchiZBModel * model;//用户阅读信息
@property (nonatomic, strong) NSString * myleve;//用户阅读信息

@end
