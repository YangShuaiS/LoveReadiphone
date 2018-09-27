//
//  BaseView.h
//  BoVolumes
//
//  Created by 杨帅 on 2018/4/9.
//  Copyright © 2018年 YS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PushModel.h"
@protocol BaseViewDelegate // 代理传值方法
@optional
- (void)PushFriendViewCOntroller:(PushModel *)model;
@end
@interface BaseView : UIView
@property (nonatomic, weak) id <BaseViewDelegate> delegate;
void Coordinate_2 (double pi, float l, float c_w , float c_h, float *x, float *y);


@property (nonatomic,strong) UINavigationController * nav;

@end
