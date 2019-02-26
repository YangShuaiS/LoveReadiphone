//
//  SearchView.h
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/5/21.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseView.h"
typedef void(^GenBlocks)(NSString * str);

@interface SearchView : BaseView
@property (nonatomic, strong) NSMutableArray * controllerArray;
@property (nonatomic, strong) NSString * title;
@property(nonatomic,copy)GenBlocks block;
@property (nonatomic, assign) NSInteger inter;

@end
