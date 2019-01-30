//
//  BaseObject.m
//  BoVolumes
//
//  Created by 杨帅 on 2018/4/16.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseObject.h"
CGFloat NavHeight = 0;
CGFloat TabBarHeight = 0;
CGFloat StatusBar = 0;
CGFloat poinw = 0;

//NSString * ZSFWQ = @"http://39.106.100.235/";
NSString * ZSFWQ = @"https://tiantianaidu.com/";
//NSString * ZSFWQ = @"http://192.168.1.221:8085/";
//NSString * ZSFWQ = @"http://119.90.89.88:8085/";

//NSString * ZSFWQ = @"http://192.168.1.85:8069/";




//NSString *  ZSFWQ = @"http://192.168.1.221:8080/";
//NSString * ZSFWQ = @"http://192.168.1.114:8075/";

//NSString * ZSFWQ = @"http://119.90.89.88:8085/";


MeModel * Me = nil;

@implementation BaseObject
+ (NSArray *)TiemArray:(NSString *)time
                String:(NSString *)string{
    NSArray *array = [time componentsSeparatedByString:string]; //从字符A中分隔成2个元素的数组
    //    NSArray *timearray = [array[0] componentsSeparatedByString:@"-"]; //从字符A中分隔成2个元素的数组
    return array;
}
+ (NSMutableArray *)AllRang:(NSString *)text
          RangString:(NSString *)string{
    NSArray * array = [self TiemArray:text String:string];
    NSMutableArray * arr = [NSMutableArray array];
    NSString * endstr = @"";

    NSInteger inte = 0;
    for (NSString * str in array) {
        endstr = [endstr stringByAppendingString:str];
        NSRange rang = NSMakeRange(endstr.length, string.length);
        NSString * inter = [NSString stringWithFormat:@"%ld",endstr.length];
        endstr = [endstr stringByAppendingString:string];
        if (inte == array.count-1) {
        }else{
            inte ++ ;
            [arr addObject:inter];
        }
    }
    return arr;
}

/**
 *  计算文字长度
 */
+ (CGFloat )widthForLabel:(NSString *)text fontSize:(CGFloat)font
{
    CGSize size = [text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:font], NSFontAttributeName, nil]];
    return size.width;
}

/**
 转换颜色
 */
+(UIColor *) getColor:(NSString *)hexColor
{
    unsigned int red, green, blue;
    NSRange range;
    range.length =2;
    
    range.location =0;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]]scanHexInt:&red];
    range.location =2;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]]scanHexInt:&green];
    range.location =4;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]]scanHexInt:&blue];
    
    return [UIColor colorWithRed:(float)(red/255.0f)green:(float)(green/255.0f)blue:(float)(blue/255.0f)alpha:1.0f];
}



+ (UIViewController *)PopViewController:(NSArray *)Controller AllController:(NSArray *)allarray{
    for (UIViewController *controller in allarray) {
        for (UIViewController * twoViewController in Controller) {
            if ([controller isKindOfClass:[twoViewController class]]) {
                return twoViewController;
            }
        }
      
    }
    return [UIViewController new];
}

+ (NSMutableAttributedString*)FuWenBen:(NSString *)string
                                 Fount:(CGFloat)font
                             TextColor:(UIColor*)color
                            BianString:(NSString *)BianString{
    NSRange range;
    
    NSMutableAttributedString *AttributedStr = [[NSMutableAttributedString alloc]initWithString:string];
    range = [AttributedStr.string rangeOfString:BianString];
    [AttributedStr addAttribute:NSFontAttributeName value:TextFont(font) range:range];
    [AttributedStr addAttribute:NSForegroundColorAttributeName
                          value:color
                          range:range];
    return AttributedStr;
}
+ (NSMutableAttributedString*)AttributedAll:(NSArray *)modelarray{
    AttributedStringModel * models = modelarray[0];
    NSMutableAttributedString *AttributedStr = [[NSMutableAttributedString alloc]initWithString:models.textString];
    
    NSString *version= [UIDevice currentDevice].systemVersion;
    
    if(version.doubleValue >=9.0) {
        
        // 针对 9.0 以上的iOS系统进行处理
        for (AttributedStringModel * model in modelarray) {
            if ([models.textString rangeOfString:model.bianString].location !=NSNotFound) {
                NSArray * arr = [BaseObject rangeOfSubString:model.bianString inString:model.textString];
                if (model.integer == 0) {
                    for (NSValue * value in arr) {
                        NSRange range = [value rangeValue];
                        if (model.fount!=0) {
                            [AttributedStr addAttribute:NSFontAttributeName value:TextFont(model.fount) range:range];
                        }
                        if (model.color!=nil) {
                            [AttributedStr addAttribute:NSForegroundColorAttributeName
                                                  value:model.color
                                                  range:range];
                        }
                    }
                }else{
                    if (model.integer<=arr.count) {
                        NSRange range = [arr[model.integer] rangeValue];
                        if (model.fount!=0) {
                            [AttributedStr addAttribute:NSFontAttributeName value:TextFont(model.fount) range:range];
                        }
                        if (model.color!=nil) {
                            [AttributedStr addAttribute:NSForegroundColorAttributeName
                                                  value:model.color
                                                  range:range];
                        }
                    }
                }
                
                }
        }
    }else{
        
        // 针对 9.0 以下的iOS系统进行处理
        
    }
    return AttributedStr;
}
+ (NSMutableAttributedString*)Attributed:(NSArray *)modelarray{
    AttributedStringModel * models = modelarray[0];
    NSMutableAttributedString *AttributedStr = [[NSMutableAttributedString alloc]initWithString:models.textString];
    
    NSString *version= [UIDevice currentDevice].systemVersion;
    
    if(version.doubleValue >=9.0) {
        
        // 针对 9.0 以上的iOS系统进行处理
        for (AttributedStringModel * model in modelarray) {
            if ([models.textString rangeOfString:model.bianString].location !=NSNotFound) {

//                NSRange range = [AttributedStr.string rangeOfString:model.bianString];
//                NSArray * arr = [AttributedStr.string componentsSeparatedByString:model.bianString];
                NSArray * arr = [BaseObject rangeOfSubString:model.bianString inString:model.textString];
                if (arr.count == 2) {
                    NSRange range = [arr[0] rangeValue];
                    if (model.fount!=0) {
                        [AttributedStr addAttribute:NSFontAttributeName value:TextFont(model.fount) range:range];
                    }
                    if (model.color!=nil) {
                        [AttributedStr addAttribute:NSForegroundColorAttributeName
                                              value:model.color
                                              range:range];
                    }
                }else if (arr.count == 1){
                    NSRange range = [AttributedStr.string rangeOfString:model.bianString];
                    if (model.fount!=0) {
                        [AttributedStr addAttribute:NSFontAttributeName value:TextFont(model.fount) range:range];
                    }
                    if (model.color!=nil) {
                        [AttributedStr addAttribute:NSForegroundColorAttributeName
                                              value:model.color
                                              range:range];
                    }
                }else{
                    for (NSValue * value in arr) {
                        NSRange range = [value rangeValue];
                        if (model.fount!=0) {
                            [AttributedStr addAttribute:NSFontAttributeName value:TextFont(model.fount) range:range];
                        }
                        if (model.color!=nil) {
                            [AttributedStr addAttribute:NSForegroundColorAttributeName
                                                  value:model.color
                                                  range:range];
                        }
                    }
                }
              
               
            }
        }
    }else{
        
        // 针对 9.0 以下的iOS系统进行处理
        
    }
    return AttributedStr;
}

+ (NSMutableAttributedString*)AttributedStringModel:(AttributedStringModel*)model
                                        StringArray:(NSArray *)array{
    NSMutableAttributedString *AttributedStr = [[NSMutableAttributedString alloc]initWithString:model.textString];
    NSString *version= [UIDevice currentDevice].systemVersion;
    
    if(version.doubleValue >=9.0) {
        for (NSString * str in array) {
            if ([model.textString rangeOfString:str].location !=NSNotFound) {
                NSArray * arr = [BaseObject rangeOfSubString:str inString:model.textString];
                for (NSValue * value in arr) {
                    NSRange range = [value rangeValue];
                    if (model.fount!=0) {
                        [AttributedStr addAttribute:NSFontAttributeName value:TextFont(model.fount) range:range];
                    }
                    if (model.color!=nil) {
                        [AttributedStr addAttribute:NSForegroundColorAttributeName
                                              value:model.color
                                              range:range];
                    }
                }
            }
        }
    }else{
        
    }
    return AttributedStr;

}


+ (NSArray*)rangeOfSubString:(NSString*)subStr inString:(NSString*)string {
    NSMutableArray *rangeArray = [NSMutableArray array];
    NSString*string1 = [string stringByAppendingString:subStr];
    NSString *temp;
    for(int i =0; i < string.length-subStr.length+1; i ++) {
        temp = [string1 substringWithRange:NSMakeRange(i, subStr.length)];
        if ([temp isEqualToString:subStr]) {
            NSRange range = {i,subStr.length};
            [rangeArray addObject: [NSValue valueWithRange:range]];
        }
    }
    return rangeArray;
}


+ (NSString *)AddPathName:(NSString *)path{
    //获取路径对象
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *paths = [pathArray objectAtIndex:0];
    
    //获取文件的完整路径
    NSString *filePatch = [paths stringByAppendingPathComponent:path];
    
    
    return filePatch;
}

//判断手机号码格式是否正确
- (BOOL)isValidateByRegex:(NSString *)regex{
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [pre evaluateWithObject:self];
}

+ (BOOL)valiMobile:(NSString *)mobile

{
    
    mobile = [mobile stringByReplacingOccurrencesOfString:@" " withString:@""];
    if (mobile.length != 11)
    {
        return NO;
    }else{
                
        /**
                    
                          * 移动号段正则表达式
                     
                          */
    NSString * CM_NUM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d|705)\\d{7}$";

//    NSString *CM_NUM = @"^((13[4-9])|(147)|(15[0-2,7-9])|(178)|(18[2-4,7-8]))\\d{8}|(1705)\\d{7}$";

            /**
                     
                          * 联通号段正则表达式
                     
                          */
        NSString * CU_NUM = @"^1((3[0-2]|5[256]|8[56])\\d|709)\\d{7}$";

//        NSString *CU_NUM = @"^((13[0-2])|(145)|(15[5-6])|(176)|(18[5,6]))|(166)\\d{8}|(1709)\\d{7}$";
        
                /**
                     
                          * 电信号段正则表达式
                     
                          */
        NSString * CT_NUM = @"^1((33|53|8[09])\\d|349|700)\\d{7}$";

//        NSString *CT_NUM = @"^((133)|(153)|(177)|(18[0,1,9]))|(199)\\d{8}$";
        
        NSPredicate *pred1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM_NUM];
        BOOL isMatch1 = [pred1 evaluateWithObject:mobile];
        NSPredicate *pred2 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU_NUM];
        BOOL isMatch2 = [pred2 evaluateWithObject:mobile];
        NSPredicate *pred3 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT_NUM];
        BOOL isMatch3 = [pred3 evaluateWithObject:mobile];
        
        if (isMatch1 || isMatch2 || isMatch3) {
            return YES;
        }else{
            return NO;
        }
    }
}
+ (NSMutableAttributedString*)AttribleString:(NSInteger)HangJianJu
                                      String:(NSString * )string{
    NSMutableParagraphStyle  *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    // 行间距设置为
    [paragraphStyle  setLineSpacing:HangJianJu];
    NSMutableAttributedString  *setString = [[NSMutableAttributedString alloc] initWithString:string];
    [setString  addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [string length])];
    return setString;
}

//获取当前的时间

+(NSString*)getCurrentTimes{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    
    [formatter setDateFormat:@"YYYYMMddHHmmss"];
    
    //现在时间,你可以输出来看下是什么格式
    
    NSDate *datenow = [NSDate date];
    
    //----------将nsdate按formatter格式转成nsstring
    
    NSString *currentTimeString = [formatter stringFromDate:datenow];
    
//    MJExtensionLog(@"currentTimeString =  %@",currentTimeString);
    
    return currentTimeString;
    
}


+ (UIColor *) colorWithHexString: (NSString *)color
{
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    // 判断前缀
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    // 从六位数值中找到RGB对应的位数并转换
    NSRange range;
    range.location = 0;
    range.length = 2;
    //R、G、B
    NSString *rString = [cString substringWithRange:range];
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
}

+ (NSString *)Sharetitle:(NSString *)title{
    return title;
}

+ (NSString*)deviceModelName
{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceModel = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    if ([deviceModel isEqualToString:@"iPhone3,1"])    return @"iPhone4";
    if ([deviceModel isEqualToString:@"iPhone3,2"])    return @"iPhone4";
    if ([deviceModel isEqualToString:@"iPhone3,3"])    return @"iPhone4";
    if ([deviceModel isEqualToString:@"iPhone4,1"])    return @"iPhone4S";
    if ([deviceModel isEqualToString:@"iPhone5,1"])    return @"iPhone5";
    if ([deviceModel isEqualToString:@"iPhone5,2"])    return @"iPhone5(GSM+CDMA)";
    if ([deviceModel isEqualToString:@"iPhone5,3"])    return @"iPhone5c(GSM)";
    if ([deviceModel isEqualToString:@"iPhone5,4"])    return @"iPhone5c(GSM+CDMA)";
    if ([deviceModel isEqualToString:@"iPhone6,1"])    return @"iPhone5s(GSM)";
    if ([deviceModel isEqualToString:@"iPhone6,2"])    return @"iPhone5s(GSM+CDMA)";
    if ([deviceModel isEqualToString:@"iPhone7,1"])    return @"iPhone6Plus";
    if ([deviceModel isEqualToString:@"iPhone7,2"])    return @"iPhone6";
    if ([deviceModel isEqualToString:@"iPhone8,1"])    return @"iPhone6s";
    if ([deviceModel isEqualToString:@"iPhone8,2"])    return @"iPhone6sPlus";
    if ([deviceModel isEqualToString:@"iPhone8,4"])    return @"iPhoneSE";
    // 日行两款手机型号均为日本独占，可能使用索尼FeliCa支付方案而不是苹果支付
    if ([deviceModel isEqualToString:@"iPhone9,1"])    return @"iPhone7";
    if ([deviceModel isEqualToString:@"iPhone9,2"])    return @"iPhone7Plus";
    if ([deviceModel isEqualToString:@"iPhone9,3"])    return @"iPhone7";
    if ([deviceModel isEqualToString:@"iPhone9,4"])    return @"iPhone7Plus";
    if ([deviceModel isEqualToString:@"iPhone10,1"])   return @"iPhone_8";
    if ([deviceModel isEqualToString:@"iPhone10,4"])   return @"iPhone_8";
    if ([deviceModel isEqualToString:@"iPhone10,2"])   return @"iPhone_8_Plus";
    if ([deviceModel isEqualToString:@"iPhone10,5"])   return @"iPhone_8_Plus";
    if ([deviceModel isEqualToString:@"iPhone10,3"])   return @"iPhoneX";
    if ([deviceModel isEqualToString:@"iPhone10,6"])   return @"iPhoneX";
    if ([deviceModel isEqualToString:@"iPhone11,8"])   return @"iPhoneXR";
    if ([deviceModel isEqualToString:@"iPhone11,2"])   return @"iPhoneXS";
    if ([deviceModel isEqualToString:@"iPhone11,6"])   return @"iPhoneXSMax";
    if ([deviceModel isEqualToString:@"iPhone11,4"])   return @"iPhoneXSMax";
    if ([deviceModel isEqualToString:@"iPod1,1"])      return @"iPodTouch1G";
    if ([deviceModel isEqualToString:@"iPod2,1"])      return @"iPodTouch2G";
    if ([deviceModel isEqualToString:@"iPod3,1"])      return @"iPodTouch3G";
    if ([deviceModel isEqualToString:@"iPod4,1"])      return @"iPodTouch4G";
    if ([deviceModel isEqualToString:@"iPod5,1"])      return @"iPodTouch(5Gen)";
    if ([deviceModel isEqualToString:@"iPad1,1"])      return @"iPad";
    if ([deviceModel isEqualToString:@"iPad1,2"])      return @"iPad3G";
    if ([deviceModel isEqualToString:@"iPad2,1"])      return @"iPad2(WiFi)";
    if ([deviceModel isEqualToString:@"iPad2,2"])      return @"iPad2";
    if ([deviceModel isEqualToString:@"iPad2,3"])      return @"iPad2(CDMA)";
    if ([deviceModel isEqualToString:@"iPad2,4"])      return @"iPad2";
    if ([deviceModel isEqualToString:@"iPad2,5"])      return @"iPadMini(WiFi)";
    if ([deviceModel isEqualToString:@"iPad2,6"])      return @"iPadMini";
    if ([deviceModel isEqualToString:@"iPad2,7"])      return @"iPadMini(GSM+CDMA)";
    if ([deviceModel isEqualToString:@"iPad3,1"])      return @"iPad3(WiFi)";
    if ([deviceModel isEqualToString:@"iPad3,2"])      return @"iPad3(GSM+CDMA)";
    if ([deviceModel isEqualToString:@"iPad3,3"])      return @"iPad3";
    if ([deviceModel isEqualToString:@"iPad3,4"])      return @"iPad4(WiFi)";
    if ([deviceModel isEqualToString:@"iPad3,5"])      return @"iPad4";
    if ([deviceModel isEqualToString:@"iPad3,6"])      return @"iPad4(GSM+CDMA)";
    if ([deviceModel isEqualToString:@"iPad4,1"])      return @"iPadAir(WiFi)";
    if ([deviceModel isEqualToString:@"iPad4,2"])      return @"iPadAir(Cellular)";
    if ([deviceModel isEqualToString:@"iPad4,4"])      return @"iPadMini2(WiFi)";
    if ([deviceModel isEqualToString:@"iPad4,5"])      return @"iPadMini2(Cellular)";
    if ([deviceModel isEqualToString:@"iPad4,6"])      return @"iPadMini2";
    if ([deviceModel isEqualToString:@"iPad4,7"])      return @"iPadMini3";
    if ([deviceModel isEqualToString:@"iPad4,8"])      return @"iPadMini3";
    if ([deviceModel isEqualToString:@"iPad4,9"])      return @"iPadMini3";
    if ([deviceModel isEqualToString:@"iPad5,1"])      return @"iPadMini4(WiFi)";
    if ([deviceModel isEqualToString:@"iPad5,2"])      return @"iPadMini4(LTE)";
    if ([deviceModel isEqualToString:@"iPad5,3"])      return @"iPadAir2";
    if ([deviceModel isEqualToString:@"iPad5,4"])      return @"iPadAir2";
    if ([deviceModel isEqualToString:@"iPad6,3"])      return @"iPadPro9.7";
    if ([deviceModel isEqualToString:@"iPad6,4"])      return @"iPadPro9.7";
    if ([deviceModel isEqualToString:@"iPad6,7"])      return @"iPadPro12.9";
    if ([deviceModel isEqualToString:@"iPad6,8"])      return @"iPadPro12.9";
    
    if ([deviceModel isEqualToString:@"AppleTV2,1"])      return @"AppleTV2";
    if ([deviceModel isEqualToString:@"AppleTV3,1"])      return @"AppleTV3";
    if ([deviceModel isEqualToString:@"AppleTV3,2"])      return @"AppleTV3";
    if ([deviceModel isEqualToString:@"AppleTV5,3"])      return @"AppleTV4";
    
    if ([deviceModel isEqualToString:@"i386"])         return @"Simulator";
    if ([deviceModel isEqualToString:@"x86_64"])       return @"Simulator";
    return deviceModel;
}
#pragma mark --------- string转date
+ (NSDate *)TimeStringForDate:(NSString *)format{
    NSDateFormatter *formats = [[NSDateFormatter alloc] init];
    formats.dateFormat = @"yyyy-MM-dd";
    NSDate *data = [formats dateFromString:format];
    return data;
}
#pragma mark --------- 上月
+ (NSDate *)LastMonth:(NSDate *)date{
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    comps.month = -1;
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDate *_date = [gregorian dateByAddingComponents:comps toDate:date options:NSCalendarMatchStrictly];
    return _date;

}
#pragma mark --------- 下月
+ (NSDate *)NextMonth:(NSDate *)date{
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    comps.month = +1;
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDate *_date = [gregorian dateByAddingComponents:comps toDate:date options:NSCalendarMatchStrictly];
    return _date;
}

+ (NSDate *)LastDays:(NSDate *)date Days:(NSInteger)day{
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    comps.day = -day;
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDate *_date = [gregorian dateByAddingComponents:comps toDate:date options:NSCalendarMatchStrictly];
    return _date;
}

+ (NSDate *)NextDays:(NSDate *)date Days:(NSInteger)day{
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    comps.day = +day;
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDate *_date = [gregorian dateByAddingComponents:comps toDate:date options:NSCalendarMatchStrictly];
    return _date;
}

+ (NSDateComponents *)weekdayComponents:(NSDate *)date{
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *weekdayComponents = [gregorian components:NSCalendarUnitWeekday fromDate:date];
    return weekdayComponents;
}

+ (NSString*)weekDayStr:(NSDate *)date
{
    NSString *weekDayStr = nil;
    NSDateComponents *weekdayComponents = [self weekdayComponents:date];
    NSInteger week = [weekdayComponents weekday];
    switch (week) {
        case 1:
            weekDayStr = @"日";
            break;
        case 2:
            weekDayStr = @"一";
            break;
        case 3:
            weekDayStr = @"二";
            break;
        case 4:
            weekDayStr = @"三";
            break;
        case 5:
            weekDayStr = @"四";
            break;
        case 6:
            weekDayStr = @"五";
            break;
        case 7:
            weekDayStr = @"六";
            break;
        default:
            weekDayStr = @"";
            break;
    }
    return weekDayStr;
}
+ (NSInteger)MonthDayLength:(NSDate *)date{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSRange range = [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date];
    return range.length;
}

+ (NSMutableDictionary *)BenDiXinXi{
    NSString *filePatch = [BaseObject AddPathName:[NSString stringWithFormat:@"%@.plist",@"bendixinxi"]];
    NSMutableDictionary *dataDictionary = [[NSMutableDictionary alloc] initWithContentsOfFile:filePatch];
    return dataDictionary;
}
+ (NSString *)NowTime{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd"];
    NSDate *datenow = [NSDate date];
    NSString *currentTimeString = [formatter stringFromDate:datenow];
    return currentTimeString;
}

+ (NSMutableArray *)TaskColorArray:(NSInteger)inter{
    NSMutableArray * colorarray = [NSMutableArray array];
    //1 新手 3 自建 5   初阶    6   中阶    7   高阶
    
    //0 字体 1 深色 2 j浅色 3 阴影 4.排名背景 5 全部任务阴影色 6 圆圈颜色
    if (inter == 1) {
        [colorarray addObject:RGB(236,138,53)];//1
        [colorarray addObject:RGB(255,163,81)];//1
        [colorarray addObject:RGB(255,226,200)];//1
        [colorarray addObject:RGBA(197,102,0,0.35)];//1
        [colorarray addObject:RGB(255,247,232)];//1
        [colorarray addObject:RGB(255,151,29)];//1
        [colorarray addObject:RGB(250,138,28)];//1
    }
    if (inter == 3) {
        [colorarray addObject:RGB(91,199,198)];//1
        [colorarray addObject:RGB(108,208,207)];//1
        [colorarray addObject:RGB(199,245,239)];//1
        [colorarray addObject:RGBA(76,181,241,0.35)];//1
        [colorarray addObject:RGB(229,254,251)];//1
        [colorarray addObject:RGB(91,199,198)];//1
        [colorarray addObject:RGB(133,213,212)];//1
    }
    if (inter == 5) {
        [colorarray addObject:RGB(64,208,64)];  //1
        [colorarray addObject:RGB(95,218,95)];//1
        [colorarray addObject:RGB(197,248,197)];//1
        [colorarray addObject:RGBA(64,208,64,0.35)];//1
        [colorarray addObject:RGB(230,255,220)];//1
        [colorarray addObject:RGB(119,188,1)];//1
        [colorarray addObject:RGB(107,208,107)];//1
    }
    if (inter == 6) {
        [colorarray addObject:RGB(76,181,241)];//1
        [colorarray addObject:RGB(87,183,238)];//1
        [colorarray addObject:RGB(195,233,255)];//1
        [colorarray addObject:RGBA(76,181,241,0.35)];//1
        [colorarray addObject:RGB(222,244,255)];//1
        [colorarray addObject:RGB(10,145,222)];//1
        [colorarray addObject:RGB(69,180,244)];//1
    }
    if (inter == 7) {
        [colorarray addObject:RGB(139,157,249)];//1
        [colorarray addObject:RGB(149,165,247)];//1
        [colorarray addObject:RGB(224,229,253)];//1
        [colorarray addObject:RGBA(76,181,241,0.35)];//1
        [colorarray addObject:RGB(238,241,255)];//1
        [colorarray addObject:RGB(122,108,224)];//1
        [colorarray addObject:RGB(136,154,252)];//1
    }
    return colorarray;
}
@end
