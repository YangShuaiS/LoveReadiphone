//
//  GeneralUpView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/10.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseView.h"
#import "JoinBookModel.h"
#pragma mark -------------- 弹出视图
typedef NS_ENUM(NSInteger, PopUpViewStyle) {
    PopUpViewStyleAddMedalAll = 0,//加入全部勋章
    PopUpViewStyleAddMedalPart = 1,//加入部分勋章
    PopUpViewStyleMedalcomplete = 2,//勋章完成
    PopUpViewStyleAnswer = 3,//答题说明
    PopUpViewStyleBelong = 4,//属于
};
#pragma mark -------------- 点击事件
typedef NS_ENUM(NSInteger, PopUpViewClickStyle) {
    PopUpViewClickStyleRemo = 0,//点击删除
    PopUpViewClickStyleTimeRemo = 1,//定时删除
    PopUpViewClickStylePush = 2,//跳转

};
typedef void(^PushBlock)(void);
@interface GeneralUpView : BaseView
#pragma mark ---------------- 切记，要先传model，懒得写熟悉纠错
@property(nonatomic,strong) GenPopViewModel * model;
@property(nonatomic,assign)PopUpViewStyle style;
@property(nonatomic,copy)PushBlock block;

@property(nonatomic,strong) JoinBookModel * joinmodel;//加入书架model。只有PopUpViewStyleBelong

@end
