//
//  ArticleScroTopView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/3/20.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "BaseView.h"
#import "ArticleTopView.h"

NS_ASSUME_NONNULL_BEGIN

@interface ArticleScroTopView : BaseView
@property(nonatomic,strong)LunBoTuXQModel * model;
@property(nonatomic,assign)CGFloat sizeheight;
@property(nonatomic,assign)CGFloat titleheight;


@property(nonatomic,strong)ArticleTopView * topView;




@end

NS_ASSUME_NONNULL_END
