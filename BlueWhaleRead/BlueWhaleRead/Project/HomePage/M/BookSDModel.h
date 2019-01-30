//
//  BookSDModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/1/28.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface BookSDModel : BaseModel
@property (nonatomic, copy) NSString * name;
@property(nonatomic,strong) NSMutableArray * booklist;
@end

NS_ASSUME_NONNULL_END
