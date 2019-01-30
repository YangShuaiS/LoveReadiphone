//
//  BaseObject.h
//  BoVolumes
//
//  Created by 杨帅 on 2018/4/16.
//  Copyright © 2018年 YS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sys/utsname.h>
#import "MeModel.h"
extern CGFloat NavHeight;
extern CGFloat TabBarHeight;
extern CGFloat StatusBar;
extern CGFloat poinw;


extern NSString * ZSFWQ;

extern MeModel const * Me;

@interface BaseObject : NSObject
#pragma mark - 时间截取
+ (NSArray *)TiemArray:(NSString *)time
                String:(NSString *)string;
+ (NSMutableArray *)AllRang:(NSString *)text
                 RangString:(NSString *)string;
/**
 计算文字长度
 
 @param text 文字
 @param font 字体
 @return 长度
 */
+ (CGFloat )widthForLabel:(NSString *)text fontSize:(CGFloat)font;

/**
 16进制转换 颜色
 
 @param hexColor 颜色
 @return 转换后的颜色
 */
+(UIColor *) getColor:(NSString *)hexColor;

+ (UIViewController *)PopViewController:(NSArray *)Controller
                          AllController:(NSArray *)allarray;

+ (NSMutableAttributedString*)FuWenBen:(NSString *)string
                                 Fount:(CGFloat)font
                             TextColor:(UIColor*)color
                            BianString:(NSString *)BianString;
+ (NSMutableAttributedString*)AttributedAll:(NSArray *)modelarray;
+ (NSMutableAttributedString*)Attributed:(NSArray *)modelarray;

+ (NSMutableAttributedString*)AttributedStringModel:(AttributedStringModel*)model
                                        StringArray:(NSArray *)array;
//登录路径
+ (NSString *)AddPathName:(NSString *)path;
//判断手机号码格式是否正确
+ (BOOL)valiMobile:(NSString *)mobile;
//label行间距
+ (NSMutableAttributedString*)AttribleString:(NSInteger)HangJianJu
                                      String:(NSString * )string;
+(NSString*)getCurrentTimes;

+ (UIColor *) colorWithHexString: (NSString *)color;

+ (NSString *)Sharetitle:(NSString *)title;

+ (NSString*)deviceModelName;

+ (NSDate *)TimeStringForDate:(NSString *)format;
+ (NSDate *)LastMonth:(NSDate *)date;
+ (NSDate *)NextMonth:(NSDate *)date;
+ (NSString*)weekDayStr:(NSDate *)date;
+ (NSInteger)MonthDayLength:(NSDate *)date;
+ (NSDate *)LastDays:(NSDate *)date Days:(NSInteger)day;
+ (NSDate *)NextDays:(NSDate *)date Days:(NSInteger)day;

+ (NSMutableDictionary *)BenDiXinXi;
+ (NSString *)NowTime;

+ (NSMutableArray *)TaskColorArray:(NSInteger)inter;
@end
