//
//  DTJieGuoModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/28.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"
#pragma mark --------------- 诵读列表样式
typedef NS_ENUM(NSInteger, DtJieGuoStyle) {
    DtJieGuoStyleYes = 1,//通过
    DtJieGuoStyleNo = 0,//未通过
};
@interface DTJieGuoModel : BaseModel
@property (nonatomic, assign) DtJieGuoStyle style;
@property (nonatomic, assign) NSInteger have;

@end
