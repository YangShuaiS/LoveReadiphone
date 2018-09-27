//
//  SearchCitBookModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/26.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"

@interface SearchCitBookModel : BaseModel
@property (nonatomic, copy) NSNumber * code;
@property (nonatomic, copy) NSString * message;

@property(nonatomic,strong) NSMutableArray * data;//书
+ (void)InitializeModel;

@end
