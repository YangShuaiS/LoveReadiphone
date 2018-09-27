//
//  BookFenjiModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/12.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"

@interface BookFenjiModel : BaseModel
@property (nonatomic, copy) NSString *  lv;//等级名
@property (nonatomic, copy) NSString * ssid;//等级id    
@property (nonatomic, assign) NSInteger type;//点击状态，手写

@end
