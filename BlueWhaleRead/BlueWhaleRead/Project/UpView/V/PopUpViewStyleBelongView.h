//
//  PopUpViewStyleBelongView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/13.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseView.h"
typedef void(^GenBlock)(PopUpViewClickStyle style);

@interface PopUpViewStyleBelongView : BaseView
@property(nonatomic,strong) GenPopViewModel * model;
@property(nonatomic,copy)GenBlock block;

@property(nonatomic,strong) JoinBookModel * joinmodel;//加入书架model。只有PopUpViewStyleBelong

@end
