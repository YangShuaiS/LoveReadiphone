//
//  MyClassLabel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/20.
//  Copyright © 2018年 YS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyClassLabel : UILabel
/** 描多粗的边*/

@property (nonatomic, assign) NSInteger outLineWidth;

/** 外轮颜色*/

@property (nonatomic, strong) UIColor *outLinetextColor;

/** 里面字体默认颜色*/

@property (nonatomic, strong) UIColor *labelTextColor;

@end
