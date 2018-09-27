//
//  TiStyleModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/2.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"

@interface TiStyleModel : BaseModel
@property (nonatomic, assign) NSInteger type;
@property (nonatomic, copy) NSString * timu;
@property (nonatomic, copy) NSString * timuid;
@property (nonatomic, copy) NSString * bookid;

@property (nonatomic, copy) NSMutableArray * timuarray;
@property (nonatomic, copy) NSMutableArray * yhdaarray;//用户答案
@property (nonatomic, copy) NSMutableArray * zqdaarray;//正确答案
@end
