//
//  ZhuTiTagModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/24.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"

@interface ZhuTiTagModel : BaseModel
@property (nonatomic, copy) NSString * descriptions;//描述
@property (nonatomic, copy) NSString * name;//tag名
@property (nonatomic, copy) NSString * ssid;//ag id
@property (nonatomic, copy) NSString * theme_img;//主题图

@property(nonatomic,strong) NSMutableArray * booklist;
@end
