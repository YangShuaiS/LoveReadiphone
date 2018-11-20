//
//  HaiBaoView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/5.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseView.h"


@interface HaiBaoView : BaseView
@property(nonatomic,strong)FenXiangModel * modes;
@property(nonatomic,assign)ShareStyle sharestyle;
@property(nonatomic,strong)NSString * Text;
@property(nonatomic,strong)NSString * title;

@property(nonatomic,strong)NSString * textid;//文章分享id
@end

