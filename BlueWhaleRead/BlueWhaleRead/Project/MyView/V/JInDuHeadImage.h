//
//  JInDuHeadImage.h
//  BoWanJuanForPad
//
//  Created by 杨帅 on 2018/5/29.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseView.h"

@interface JInDuHeadImage : BaseView
@property (nonatomic, strong) UIColor *progressColor;
@property (nonatomic, assign) CGFloat progressWidth;
@property (nonatomic, assign) CGFloat progress;
@property(nonatomic,strong)    FLAnimatedImageView * touxiang;

@property (nonatomic, assign) NSInteger upjl;

@end
