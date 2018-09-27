//
//  BaseLabel.h
//  ZYlive
//
//  Created by 杨帅 on 2017/6/6.
//  Copyright © 2017年 杨帅. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseLabel : UILabel
- (instancetype)initWithFrame:(CGRect)frame
               LabelTxteColor:(UIColor *)textcolor
                    LabelFont:(UIFont *)font
                TextAlignment:(NSTextAlignment)textAlignment
                         Text:(NSString *)text;
@end
