//
//  MedalDownView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/9.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseView.h"
#import "JoinDownView.h"

#pragma mark -------------- 下面视图样式
typedef NS_ENUM(NSInteger, DownStyle) {
    DownStyleGoLightUp = 0,//去点亮
    DownStyleLightUping = 1, //点亮中
    DownStyleYiDianLiang = 2, //一点亮

};
typedef void(^ChooseMedalbool)(void);
@interface MedalDownView : BaseView
@property(nonatomic,assign)DownStyle style;
@property(nonatomic,copy)ChooseMedalbool block;
@property(nonatomic,strong) JoinDownView * joinDown;
@property(nonatomic,strong) NSMutableArray * itemarray;
@property(nonatomic,strong) MedalListXqModel * model;
@end
