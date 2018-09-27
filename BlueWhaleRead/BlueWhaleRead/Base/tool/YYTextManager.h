//
//  YYTextManager.h
//  BoVolumes
//
//  Created by 杨帅 on 2018/4/18.
//  Copyright © 2018年 YS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YYTextManager : NSObject
+(instancetype)SharedManager;
//添加富文本以及初始点击事件
-(NSMutableAttributedString *)ClickString:(NSString *)string
                                RangArray:(NSArray *)array
                                    Color:(UIColor *)color
                               TextString:(NSString *)strings;
-(NSMutableAttributedString *)RefreshYYlabel:(NSMutableArray *)arr
                                     Atttext:(NSMutableAttributedString*)attstring;
@end
