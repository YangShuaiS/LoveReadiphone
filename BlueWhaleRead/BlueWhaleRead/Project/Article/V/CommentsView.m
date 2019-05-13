//
//  CommentsView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/4/9.
//  Copyright © 2019 YS. All rights reserved.
//

#import "CommentsView.h"

@implementation CommentsView{
    NSMutableArray * array;
    UIImageView * fx;
    UIImageView * dz;
    UIImageView * sc;
    UIImageView * pl;
    UIView * backview;
    CommentsStyle laststyle;
    BaseLabel * pllabel;
    NSInteger orig;
    BaseLabel * label;
    UIColor * backcolor;
}

- (instancetype)initWithBackColor:(UIColor *)color
                            Style:(CommentsStyle)style
                         Original:(NSInteger)original{
    self = [super init];
    if (self) {
        backcolor = color;
        laststyle = style;
        [self addWithBackColor:color Style:style Original:original];
    }
    return self;
}
- (void)addWithBackColor:(UIColor *)color
                   Style:(CommentsStyle)style
                Original:(NSInteger)original{
    WS(ws);
    orig = original;
    self.backgroundColor = color;
    array = [NSMutableArray array];
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
    effectView.userInteractionEnabled = NO;
    [self addSubview:effectView];
    [effectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
    fx = [UIImageView new];
    fx.contentMode = UIViewContentModeScaleAspectFit;
    fx.userInteractionEnabled = YES;
    UITapGestureRecognizer * fxtap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(FenXiang)];
    [fx addGestureRecognizer:fxtap];
    
    pllabel = [[BaseLabel alloc] initWithTxteColor:RGB(255, 69, 0) LabelFont:[UIFont boldSystemFontOfSize:10] TextAlignment:NSTextAlignmentCenter Text:@"99"];
//    pllabel.backgroundColor = [UIColor whiteColor];
    [self addSubview:pllabel];
    
    dz = [UIImageView new];
    dz.contentMode = UIViewContentModeScaleAspectFit;
    dz.userInteractionEnabled = YES;
    UITapGestureRecognizer * dztap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(DianZan)];
    [dz addGestureRecognizer:dztap];
    
    sc = [UIImageView new];
    sc.contentMode = UIViewContentModeScaleAspectFit;
    sc.userInteractionEnabled = YES;
    UITapGestureRecognizer * sctap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ShouCang)];
    [sc addGestureRecognizer:sctap];
    
    pl = [UIImageView new];
    pl.contentMode = UIViewContentModeScaleAspectFit;
    pl.userInteractionEnabled = YES;
    UITapGestureRecognizer * pltap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(PingLun)];
    [pl addGestureRecognizer:pltap];
    
    backview = [UIView new];
    backview.layer.masksToBounds = YES;
    backview.layer.cornerRadius = 15;
    [self addSubview:backview];
    backview.userInteractionEnabled = YES;
    UITapGestureRecognizer * backviewtap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ShuRuKuang)];
    [backview addGestureRecognizer:backviewtap];
    
    label = [[BaseLabel alloc] initWithTxteColor:RGB(175, 175, 175) LabelFont:TextFont(11) TextAlignment:NSTextAlignmentLeft Text:@"下面请开始你的表演"];
    [backview addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->backview).with.offset(LENGTH(11));
        make.top.and.bottom.and.right.mas_equalTo(self->backview);
    }];
    switch (style) {
        case CommentsStyle1:
            [self addCommentStyle1];
            break;
        case CommentsStyle2:
            [self addCommentStyle2];
            break;
        default:
            break;
    }
    [backview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws).with.offset(LENGTH(18));
        make.top.mas_equalTo(ws).with.offset(9);
        make.height.mas_equalTo(30);
        make.right.mas_equalTo(self->pl.mas_left).with.offset(-LENGTH(23));
    }];
}

- (void)addCommentStyle1{
    WS(ws);
    if (orig == 1) {
        fx.image = UIIMAGE(@"转发");
        [array addObject:fx];
    }else{
        [fx removeFromSuperview];

    }
    
    dz.image = UIIMAGE(@"点赞");
    [array addObject:dz];

    sc.image = UIIMAGE(@"收藏-");
    [array addObject:sc];
    
    pl.image = UIIMAGE(@"评论-成功");
    [array addObject:pl];
    
    UIImageView * lastimage ;
    for (int i = 0; i < array.count; i ++) {
        UIImageView * imageview = array[i];
        [self addSubview:imageview];
        if (i == 0) {
            [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.mas_equalTo(ws).with.offset(-LENGTH(20));
            }];
        }else{
            [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.mas_equalTo(lastimage.mas_left).with.offset(-LENGTH(24));
            }];
        }
        [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(ws).with.offset(12);
            make.size.mas_equalTo(CGSizeMake(20, 20));
        }];
        lastimage = imageview;
    }
    backview.backgroundColor = RGB(242,242,242);
    [self addSubview:pllabel];
    [pllabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->pl.mas_top).with.offset(-3);
        make.right.mas_equalTo(self->pl);
    }];

}

- (void)addCommentStyle2{
    WS(ws);
    if (orig == 1) {
        fx.image = UIIMAGE(@"转发-白");
        [array addObject:fx];
    }else{
        [fx removeFromSuperview];
        
    }
    
    dz.image = UIIMAGE(@"点赞-白");
    [array addObject:dz];
    
    [sc removeFromSuperview];
    
    pl.image = UIIMAGE(@"评论-成功-白");
    [array addObject:pl];
    
    UIImageView * lastimage ;
    for (int i = 0; i < array.count; i ++) {
        UIImageView * imageview = array[i];
        [self addSubview:imageview];
        if (i == 0) {
            [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.mas_equalTo(ws).with.offset(-LENGTH(20));
            }];
        }else{
            [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.mas_equalTo(lastimage.mas_left).with.offset(-LENGTH(24));
            }];
        }
        [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(ws).with.offset(12);
            make.size.mas_equalTo(CGSizeMake(20, 20));
        }];
        lastimage = imageview;
    }
    backview.backgroundColor = RGBA(255,255,255,0.6);
    pllabel.backgroundColor = [UIColor clearColor];
    label.textColor = RGB(255, 255, 255);
    [self addSubview:pllabel];
    [pllabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->pl.mas_top).with.offset(-8);
        make.right.mas_equalTo(self->pl);
    }];
    
}


- (void)FenXiang{
    [self.delegateComments CommentsFenXiang];
}

- (void)DianZan{
    [self.delegateComments CommentsDianZan];
}

- (void)ShouCang{
    [self.delegateComments CommentsShouCang];
}

- (void)PingLun{
    [self.delegateComments CommentsPingLun];
}

- (void)ShuRuKuang{
    [self.delegateComments CommentsShuRuKuang];
}

- (void)setModel:(LunBoTuXQModel *)model{
    _model = model;
    if ([BaseObject ArratClass:model.studentCommentList]) {
        pllabel.text = [NSString stringWithFormat:@"%ld",model.studentCommentList.count];
    }
    switch (laststyle) {
        case CommentsStyle1:
            [self upview1];
            break;
        case CommentsStyle2:
            [self upview2];
            break;
        default:
            break;
    }
}

- (void)upview1{
    if (_model.is_collect == 0) {
        sc.image = UIIMAGE(@"收藏-");
    }else{
        sc.image = UIIMAGE(@"收藏-成功");
    }
    
    if (_model.is_like == 0) {
        dz.image = UIIMAGE(@"点赞");
    }else{
        dz.image = UIIMAGE(@"点赞-成功");
    }
}

- (void)upview2{
    if (_model.is_collect == 0) {
        sc.image = UIIMAGE(@"收藏-未收藏状态");
    }else{
        sc.image = UIIMAGE(@"收藏-成功");
    }
    
    if (_model.is_like == 0) {
        dz.image = UIIMAGE(@"点赞-白");
    }else{
        dz.image = UIIMAGE(@"点赞-成功");
    }
}

- (void)setModel1:(ZhiShiShuModel *)model1{
    _model1 = model1;
    if ([BaseObject ArratClass:model1.data.studentCommentList]) {
        pllabel.text = [NSString stringWithFormat:@"%ld",model1.data.studentCommentList.count];
    }
    switch (laststyle) {
        case CommentsStyle1:
            [self upview11];
            break;
        case CommentsStyle2:
            [self upview22];
            break;
        default:
            break;
    }
}
- (void)upview11{
    if (_model1.data.is_collect == 0) {
        sc.image = UIIMAGE(@"收藏-");
    }else{
        sc.image = UIIMAGE(@"收藏-成功");
    }
    
    if (_model1.data.is_like == 0) {
        dz.image = UIIMAGE(@"点赞");
    }else{
        dz.image = UIIMAGE(@"点赞-成功");
    }
}

- (void)upview22{
    if (_model1.data.is_collect == 0) {
        sc.image = UIIMAGE(@"收藏-未收藏状态");
    }else{
        sc.image = UIIMAGE(@"收藏-成功");
    }
    
    if (_model1.data.is_like == 0) {
        dz.image = UIIMAGE(@"点赞-白");
    }else{
        dz.image = UIIMAGE(@"点赞-成功");
    }
}
@end
