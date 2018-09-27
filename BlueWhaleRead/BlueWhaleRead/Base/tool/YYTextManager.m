//
//  YYTextManager.m
//  BoVolumes
//
//  Created by 杨帅 on 2018/4/18.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "YYTextManager.h"

@implementation YYTextManager
+(instancetype)SharedManager
{
    static YYTextManager *manager=nil;
    @synchronized (self)
    {
        if (manager == nil)
        {
            manager = [[self alloc] init];
        }
    }
    return  manager;
}
//-(NSMutableAttributedString *)ClickString:(NSString *)string
//                                RangArray:(NSArray *)array
//                                    Color:(UIColor *)color
//                               TextString:(NSString *)strings{
//    NSMutableAttributedString *text  = [[NSMutableAttributedString alloc] initWithString:strings];
//    YYTextBorder *border = [[YYTextBorder alloc]init];
//    border.insets = UIEdgeInsetsMake(-2, 0, -2, 0);
//    border.cornerRadius = 3;
//    border.fillColor = [UIColor clearColor];
//    NSArray *result = [[self regexAtString:string] matchesInString:text.string options:kNilOptions range:text.yy_rangeOfAll];
//    for (NSTextCheckingResult *at in result) {
//        if (at.range.location == NSNotFound && at.range.length <= 1) {
//            continue;
//        }
//        if ([text yy_attribute:YYTextHighlightAttributeName atIndex:at.range.location] == nil){
//            NSRange ran = NSMakeRange(at.range.location-1, at.range.length+2);
//
//            [text yy_setColor:color range:ran];
////            YYTextHighlight *highlight = [YYTextHighlight new];
////            [highlight setBackgroundBorder:border];
////            highlight.userInfo = @{@"type":[text.string substringWithRange:ran]};
////            [text yy_setTextHighlight:highlight range:ran];
////        [text addAttribute:NSLinkAttributeName value:[UIColor redColor] range:ran];
//        [text addAttribute:NSLinkAttributeName value:[text.string substringWithRange:ran] range:ran];
//
//        }
//    }
//
//
//    return text;
//}
//-(NSMutableAttributedString *)RefreshYYlabel:(NSMutableArray *)arr
//                                     Atttext:(NSMutableAttributedString*)attstring{
//    NSMutableAttributedString *text = attstring;
//    UIColor *color = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1.0];
//
//    for (NSString * name in arr) {
//        
//        NSArray *result = [[self regexAtString:name] matchesInString:text.string options:kNilOptions range:text.yy_rangeOfAll];
//        for (NSTextCheckingResult *at in result) {
//            if (at.range.location == NSNotFound && at.range.length <= 1) {
//                continue;
//            }
//            if ([text yy_attribute:YYTextHighlightAttributeName atIndex:at.range.location] == nil){
//                YYTextBorder *border = [[YYTextBorder alloc]init];
//                border.insets = UIEdgeInsetsMake(-2, 0, -2, 0);
//                border.cornerRadius = 3;
//                border.fillColor = [UIColor clearColor];
//                
//                NSRange ran = NSMakeRange(at.range.location-1, at.range.length+2);
//                [text yy_setColor:color range:ran];
////                YYTextHighlight *highlight = [YYTextHighlight new];
////                [highlight setBackgroundBorder:border];
////                highlight.userInfo = @{@"type":[text.string substringWithRange:ran]};
////                [text yy_setTextHighlight:highlight range:ran];
//            }
//        }
//    }
//    return text;
//}
//
//// 正则@某某某
//-(NSRegularExpression *)regexAtString:(NSString *)str
//{
//     NSRegularExpression *regex;
//    NSString * string = [NSString stringWithFormat:@"(%@)",str];
//    regex = [NSRegularExpression regularExpressionWithPattern:string options:kNilOptions error:NULL];
//    return regex;
//}
//

@end
