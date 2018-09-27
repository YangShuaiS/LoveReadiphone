//
//  BaseENUM.h
//  BoVolumes
//
//  Created by 杨帅 on 2018/4/9.
//  Copyright © 2018年 YS. All rights reserved.
//

#import <Foundation/Foundation.h>
#pragma mark -------------- Nav样式
typedef NS_ENUM(NSInteger, NavStyle) {
    NavStyleGeneral = 0,//通用,左返回中title
    NavStyleHome = 1, //首页
    NacStyleFound = 2, //发现
    NacStyleBookCity = 3, //发现
    NacStyleBookCitySJ = 4, //书架
    nacStyleCengterAndRight = 5,
    NacStyleLeftCenterSearch,

};
#pragma mark -------------- 书架样式
typedef NS_ENUM(NSInteger, BookCaseStyle) {
    BookCaseStyleWD = 0,//未读
    BookCaseStyleYD = 1, //已读
    BookCaseStyleHomeYD = 2, //首页已读
    BookCaseStyleHomeWD = 3, //首页未读
    BookCaseStyleSJWD = 4,//书架未读
    BookCaseStyleSJYD = 5,//书架已读

};

#pragma mark -------------- MenuStyle
typedef NS_ENUM(NSInteger, MenuStyle) {
    MenuStyleKH = 0,//可滑动
    MenuStyleBKH = 1, //不可滑动
};

#pragma mark -------------- XQXC or 勋章详情
typedef NS_ENUM(NSInteger, ViewControllerStyle) {
    ViewControllerStyleXZXQ = 0,//勋章详情
    ViewControllerStyleXQAH = 1, //兴趣爱好
};

#pragma mark -------------- 精读图书or不精读
typedef NS_ENUM(NSInteger, BookReadingStyle) {
    BookIntensiveReading = 1,//精读
    BookExtensiveReading = 2, //泛读
};

#pragma mark -------------- 菜单栏是否加更多
typedef NS_ENUM(NSInteger, MenuNavStyle) {
    MenuNavStyleTitle = 0,//只蚊子
    MenuNavStyleTitleAndMore = 1, //更多
};

#pragma mark -------------- Push页面
typedef NS_ENUM(NSInteger, PushStyle) {
    bookCityViewStyle = 0,//只蚊子
    XingQuXiaoZuStyle = 1, //兴趣小组
    OthrePerStyle = 2, //他人页
    PushBookXQ = 3, //书详情
    PushBookCity = 4,//书城
    PushXunZhangXQ = 5,//勋章详情
    PushXunZhangLieBiao = 6,//勋章列表
    PushXingQuXiaoZuXQ = 7,//兴趣小组详情
    PushDaTiJieGuo = 8,//答题结果
    DaTiTiaoCHuanXiaYiTi = 9,//答题跳转下一题
    DaTiTiaoCHuanShangYiTi = 10,//答题跳转下一题
    DtPushBookList = 11,//跳转书列表
};

#pragma mark -------------- 题类型
typedef NS_ENUM(NSInteger, DaTiStyle) {
    DTDanXuanStyle = 0,//单选
    DTDuoXuanStyle = 1,//多选
    DTPaiXuStyle = 2,//排序
    DTLianXianStyle = 3,//连线
    CTDanXuanStyle = 4,//单选错题
    CTDuoXuanStyle = 5,//多选错题
    CTPaiXuStyle = 6,//排序错题
    CTLianXianStyle = 7,//连线错题
    DTSHiZiOrShiCi = 8, //识字
    DTSHiZiOrShiCiTu = 9, //识字图

    DTShiZiTu = 10,
};

#pragma mark --------------- 结果页
typedef NS_ENUM(NSInteger, JieGuoStyle) {
    DTBookStyle = 0,//书籍
    DTXunZhangStyle = 1,//勋章
};

#pragma mark --------------- 同学or勋章头像页
typedef NS_ENUM(NSInteger, FriendHeadImageStyle) {
    FriendHeadImage = 0,//图
    FriendHeadImageAndLabel = 1,//图+文字
};
typedef NS_ENUM(NSInteger, FriendPushStyle) {
    FriendPushXunZhang = 0,//勋章
    FriendPushTaRen = 1,//他人
};

#pragma mark --------------- 诵读列表样式
typedef NS_ENUM(NSInteger, ReadListStyle) {
    ReadLeftAndRight = 0,//
    ReadLeft = 1,//
};

#pragma mark --------------- 弹出视图样式
typedef NS_ENUM(NSInteger, PopViewStyle) {
    PopViewStylecancel = 0,//
    PopViewStyleQueren = 1,//两个选张
};


#pragma mark -------------- 答题最下面样式
typedef NS_ENUM(NSInteger, DtLastOrNext) {
    DTStyleWithOneNext = 1,//第一个只有下一题
    DTStyleWithLastAndNext = 2, //中间包含上一题和下一题
    DTStyleWithLastAndPushUp = 3, //最后一道题,提交
    DTStyleWithLastAndPushBack = 4,//最后一道题,返回
    DTStyleWithPushUp= 5,//最后一道题,提交
    DTStyleWithBack = 6,//第一道题返回
};

#pragma mark -------------- 图表样式
typedef NS_ENUM(NSInteger, ChartStyle) {
    ChartStyleRadar = 0,//雷达图
    ChartStyleBarCharts = 1,//柱状图
    ChartStyleBarLine = 2,//折线图
    ChartStyleRadarNengLi = 3,//能力
    ChartStyleYueDuLiang = 4,//阅读量
    ChartStyleSHIZI = 5,//识字
    ChartStyleSHICI = 6,//识字


};
@interface BaseENUM : NSObject

@end
