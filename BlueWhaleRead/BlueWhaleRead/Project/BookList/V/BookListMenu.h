//
//  BookListMenu.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/3.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseView.h"

typedef void(^GenBlockInter)(NSInteger inter);
@interface BookListMenu : BaseView
@property (nonatomic, strong) NSArray *controllerArray;
@property (nonatomic, strong) NSArray *titarray;
@property (nonatomic, assign) NSInteger indext;
@property(nonatomic,copy)GenBlockInter block;

@end
