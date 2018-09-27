//
//  PopUpViewStyleAnswerView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/13.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseView.h"
typedef void(^GenBlock)(PopUpViewClickStyle style);

@interface PopUpViewStyleAnswerView : BaseView
@property(nonatomic,strong) GenPopViewModel * model;
@property(nonatomic,copy)GenBlock block;

@end
