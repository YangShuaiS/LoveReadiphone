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
    NacStyleLeftCenterSearch = 6,
    NavStyleLeftImageAndRightImageAndCenter = 7,

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


typedef NS_ENUM(NSInteger, ShareStyle) {
    ShareStyleTag1 = 1,//里程碑
    ShareStyleTag2 = 2,//书架最近读完的一本书是勋章书，且勋章点亮中
    ShareStyleTag3 = 3,//书架最近读完的一 本书是勋章书，且勋章点亮了
    ShareStyleTag4 = 4,//最近读完的一本书不是勋章书
    ShareStyleTag5 = 5,//排名第一时
    ShareStyleTag6 = 6,//其他的时候
    ShareStyleTag7 = 7,//排名第一时
    ShareStyleTag8 = 8,//其他的时候
    ShareStyleTag9 = 9,//轮播图
    ShareStyleTag10 = 10,//书单
    ShareStyleTag11 = 11,//书单


};
#pragma mark -------------- 任务
typedef NS_ENUM(NSInteger, TKAlltaskStyle) {
    TKAlltaskStyleXS = 1,//新手
    TKAlltaskStyleZJ = 2, //中高介
    TKAlltaskStyleZJALL = 3, //自建任务内容
    TKAlltaskStyleZJS = 4, //自荐人物
};

#pragma mark -------------- 任务详情
typedef NS_ENUM(NSInteger, TaxkXqStyele) {
    TaxkXqStyelenoviceingStyle = 0,//新手进行中
    TaxkXqStyelenoviceendStyle = 1, //新手任务完成
    TaxkXqStyelenovicefqStyle = 2, //新手任务放弃
    TaxkXqStyeUserOthering = 3,//自己其他任我游进行中
    TaxkXqStyeUserOtherend = 4,//自己其他任务r完成
    TaxkXqStyeUserOtherfq = 5,//自己其他任务放弃
    TaxkXqStyeOtherPeopleing = 6,//其达人任务进行中
    TaxkXqStyeOtherPeopleend = 7,//其他人其他任务r完成
    TaxkXqStyeOtherPeoplefa = 8,//其他人其他任务放弃
    TaxkXqStyeUserZJ = 9,//自建任务
};
@interface BaseENUM : NSObject

@end
