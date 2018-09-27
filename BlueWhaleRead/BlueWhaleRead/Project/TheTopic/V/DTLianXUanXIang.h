//
//  DTLianXUanXIang.h
//  BoWanJuanForPad
//
//  Created by 杨帅 on 2018/5/25.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseView.h"

@interface DTLianXUanXIang : BaseView
- (void)weixuanzhong;
- (void)xuanzhong;
@property (nonatomic, assign) BOOL zhuangtai;
@property(nonatomic,strong) NSString * name;
@property(nonatomic,strong) TiMuModel * model;



@end
