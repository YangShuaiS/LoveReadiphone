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
//NSString * ZSFWQ = @"http://tiantianaidu.com/";
//NSString * ZSFWQ = @"http://192.168.1.221:8080/";
//NSString * ZSFWQ = @"http://192.168.1.114:8075/";

NSString * ZSFWQ = @"http://192.168.1.221:8085/";
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
@end
