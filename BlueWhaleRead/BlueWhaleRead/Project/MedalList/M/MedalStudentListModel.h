//
//  MedalStudentListModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/25.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"
#import "MedalStudentUserModel.h"
@interface MedalStudentListModel : BaseModel
@property (nonatomic, strong) NSMutableArray *badgeStudentBookList;//
@property (nonatomic, strong) MedalStudentUserModel *student;//

@end
