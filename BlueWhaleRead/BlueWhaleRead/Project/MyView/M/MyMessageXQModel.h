//
//  MyMessageXQModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/27.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"

@interface MyMessageXQModel : BaseModel
@property (nonatomic, copy) NSNumber * code;
@property (nonatomic, copy) NSString * message;
@property(nonatomic,strong)MyMessageModel * studentMessageList;

@end
