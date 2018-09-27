//
//  UnreadBookListModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/19.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"
#import "UnreadBookModel.h"
@interface UnreadBookListModel : BaseModel
@property (nonatomic, copy) NSNumber * code;
@property (nonatomic, copy) NSString * message;
@property (nonatomic, strong) NSMutableArray *bookList;
+ (void)InitializeModel;

@end
