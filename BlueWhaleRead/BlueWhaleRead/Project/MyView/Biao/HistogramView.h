//
//  HistogramView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/12.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseView.h"

/**
 *  能力评估方向  基础评估、实践评估、专业评估、
 */
@interface HistItem : NSObject
/**
 *  评估名字
 */
@property (copy, nonatomic) NSString *itemName;
/**
 *  评估ID 预留
 */
@property (copy, nonatomic) NSString *itemID;
/**
 *  代表该评估方向的颜色
 */
@property (strong, nonatomic) UIColor  *itemColor;
/**
 *  各项评估结果的百分比数组
 */
@property (strong, nonatomic) NSArray  *itemPercent;

@end


@interface HistogramView : BaseView
@property(nonatomic,assign) NSInteger Ynumber;//Y轴坐标个数
@property(nonatomic,strong) NSArray * Xcoordinates;//x轴坐标名
@property(nonatomic,assign) NSInteger MaxYvalue;//y轴最大坐标值
@property (strong, nonatomic) UIColor  *FormColor;//表格颜色
@property(nonatomic,assign) NSInteger Xnumber;//X轴一个坐标下放几个
@property (strong, nonatomic) NSArray <HistItem *>*histArray;//表格颜色

@property(nonatomic,assign)ChartStyle style;
@property (assign, nonatomic) BOOL downts;//下面提示

@property(nonatomic,assign) CGFloat ClassNume;//班级均值
@property(nonatomic,assign) CGFloat BiaoZhunZhi;//标准值

@end
