//
//  MyMessageListModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/26.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"

@interface MyMessageListModel : BaseModel
@property (nonatomic, copy) NSNumber * code;
@property (nonatomic, copy) NSString * message;

@property(nonatomic,strong)NSMutableArray * studentMessageList;

+ (void)InitializeModel;
@end
