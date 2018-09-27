//
//  LunBoTuXQModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/28.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseView.h"
#import "LunBoTuXQContentModel.h"
@interface LunBoTuXQModel : BaseView
@property (nonatomic, copy) NSNumber * code;
@property (nonatomic, copy) NSString * message;
@property(nonatomic,strong) LunBoTuXQContentModel * banner;
@end
