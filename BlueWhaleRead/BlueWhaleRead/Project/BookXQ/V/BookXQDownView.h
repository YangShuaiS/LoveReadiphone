//
//  BookXQDownView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/13.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseView.h"
typedef void(^click)(void);

@interface BookXQDownView : BaseView
@property(nonatomic,strong) BookXQbookModel *model;
@property(nonatomic,assign) NSInteger joincity;
@property(nonatomic,copy)click block;

@end
