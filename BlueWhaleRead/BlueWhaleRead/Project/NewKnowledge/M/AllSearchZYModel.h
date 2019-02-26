//
//  AllSearchZYModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/2/20.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface AllSearchZYModel : BaseModel
@property (nonatomic, assign) NSInteger style; //1搜索 2相关文章 3 书 4 知识网
@property (nonatomic, strong) NSMutableArray *itemarray;//内容

@end

NS_ASSUME_NONNULL_END
