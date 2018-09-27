//
//  PublicView.h
//  BoWanJuanForPad
//
//  Created by 杨帅 on 2018/6/1.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseView.h"
#import "PublicModel.h"
typedef void(^LeftClick)(void);
typedef void(^RightClick)(void);

@interface PublicView : BaseView
@property (nonatomic,copy)LeftClick leftClick;
@property (nonatomic,copy)RightClick rightClick;
@property (nonatomic, strong)PublicModel * model;
@end
