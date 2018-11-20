//
//  NBCALLModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/7.
//  Copyright © 2018年 YS. All rights reserved.
//


//本人比较懒

#import "BaseModel.h"
#import "NBCclassificationModel.h"
@interface NBCALLModel : BaseModel
@property (nonatomic, copy) NSNumber * code;
@property (nonatomic, copy) NSString * message;
@property (nonatomic, strong) NSMutableArray *catalogList;//分类
@property (nonatomic, strong) NSMutableArray *rankList;//书单
@property (nonatomic, strong) NSMutableArray *themeNew;//
@property (nonatomic, strong) NSMutableArray *themeTop;//
@property (nonatomic, strong) NSMutableArray *themeWeek;//

@property (nonatomic, strong) NSMutableArray *weekList;//

+ (void)InitializeModel;
@end

