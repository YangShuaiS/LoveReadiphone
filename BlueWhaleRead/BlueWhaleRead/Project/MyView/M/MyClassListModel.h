//
//  MyClassListModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/19.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"
#import "MyClassModel.h"
#import "BadgeOnlyImageModel.h"
#import "MyClassTopModel.h"
@interface MyClassListModel : BaseModel
@property (nonatomic, copy) NSNumber * code;
@property (nonatomic, copy) NSString * message;
@property (nonatomic, assign) NSInteger studentnum;//本人位置 数组key
@property (nonatomic, strong) MyClassTopModel * clazz;//班级信息
@property (nonatomic, strong) MyClassTopModel * grade;//年级信息
@property (nonatomic, strong) MyClassTopModel * school;//学校信息

@property (nonatomic, strong) NSMutableArray *studentList;

+ (void)InitializeModel;
@end
