//
//  ZhiShiShuScroVuew.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/9/17.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseView.h"
#import "CommentsView.h"
#import "CommentsShuRuKuangView.h"
#import "ArticleScroDownView.h"

typedef void(^clicks)(CGRect frame);
@interface ZhiShiShuScroVuew : BaseView<UIScrollViewDelegate,NavDelegate,UIGestureRecognizerDelegate,CommentsViewDelegate,ArticleScroTopViewViewDelegate>
@property(nonatomic,strong) NSString * itemid;
@property(nonatomic,copy)clicks block;

@end
