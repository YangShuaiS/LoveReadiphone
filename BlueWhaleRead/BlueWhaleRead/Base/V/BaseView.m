//
//  BaseView.m
//  BoVolumes
//
//  Created by 杨帅 on 2018/4/9.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseView.h"

@implementation BaseView
#pragma mark - 算落点坐标

void Coordinate_2 (double pi, float l, float c_w , float c_h, float *x, float *y) {
    *x = c_w + sin(pi)*l;
    *y = c_h - cos(pi)*l;
}
@end
