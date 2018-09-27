//
//  FoundLikeBookModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/25.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"

@interface FoundLikeBookModel : BaseModel
@property (nonatomic, copy) NSString * author;
@property (nonatomic, copy) NSString * ssid;
@property (nonatomic, copy) NSString * friendReadNum;
@property (nonatomic, copy) NSString * name;
@property (nonatomic, copy) NSString * cover;

@property (nonatomic, strong) NSMutableArray *bookStudentList;

@end
