//
//  TheTopPicModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/20.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"
#import "BookProblemsModel.h"
#import "TKJIEGUOMODEL.h"
@interface TheTopPicModel : BaseModel
@property (nonatomic, copy) NSNumber * code;
@property (nonatomic, copy) NSString * message;
@property (nonatomic, assign) NSInteger time;

@property (nonatomic, strong) NSMutableArray *bookProblems;
+ (void)InitializeModel;
@end
