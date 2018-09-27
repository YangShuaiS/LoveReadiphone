//
//  Menu.h
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/5/3.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseView.h"

@interface Menu : BaseView
@property (nonatomic, strong) NSArray *controllerArray;
@property (nonatomic, strong) NSArray *titarray;
@property (nonatomic, assign) MenuStyle style;
@end
