//
//  AttributedStringModel.h
//  BoWanJuanForPad
//
//  Created by 杨帅 on 2018/5/25.
//  Copyright © 2018年 YS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AttributedStringModel : NSObject
@property (nonatomic, copy) NSString * textString;
@property (nonatomic, copy) NSString * bianString;
@property (nonatomic, assign) CGFloat fount;
@property (nonatomic, strong) UIColor * color;
@end
