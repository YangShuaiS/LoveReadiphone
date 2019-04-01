//
//  NBXQJJALLView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/3/19.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "NBXQJJALLView.h"

@implementation NBXQJJALLView{
    UIScrollView * scrollView;
    BaseLabel * label;
    BaseLabel * subtitle;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addview];
    }
    return self;
}
- (void)addview{
    self.backgroundColor = [UIColor whiteColor];
    WS(ws);

    

    
    UIImageView * oneimageview = [UIImageView new];
    oneimageview.contentMode = UIViewContentModeScaleAspectFit;
    oneimageview.image = UIIMAGE(@"椭圆1");
    [self addSubview:oneimageview];
    
    UIImageView * twoimageview = [UIImageView new];
    twoimageview.contentMode = UIViewContentModeScaleAspectFit;
    twoimageview.image = UIIMAGE(@"椭圆2");
    [self addSubview:twoimageview];
    
    UIImageView * threeimageview = [UIImageView new];
    threeimageview.contentMode = UIViewContentModeScaleAspectFit;
    threeimageview.image = UIIMAGE(@"椭圆3");
    [self addSubview:threeimageview];
    


    
    scrollView = [UIScrollView new];
    [self addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
    
    UIImageView * fanhui= [UIImageView new];
    fanhui.contentMode = UIViewContentModeScaleAspectFit;
    fanhui.image = UIIMAGE(@"X");
    [self addSubview:fanhui];
    
    fanhui.userInteractionEnabled = YES;
    UITapGestureRecognizer * tapGesture1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture1)];
    //将手势添加到需要相应的view中去
    [fanhui addGestureRecognizer:tapGesture1];
    
    
    [fanhui mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws).with.offset(LENGTH(15)+StatusBar);
        make.left.mas_equalTo(ws).with.offset(LENGTH(16));
        make.size.mas_equalTo(CGSizeMake(LENGTH(17), LENGTH(17)));
    }];
    
    [oneimageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(fanhui.mas_bottom).with.offset(LENGTH(20));
        make.left.mas_equalTo(ws);
        make.size.mas_equalTo(CGSizeMake(LENGTH(38), LENGTH(69)));
    }];
    
    [twoimageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(oneimageview.mas_bottom).with.offset(LENGTH(37));
        make.right.mas_equalTo(ws);
        make.size.mas_equalTo(CGSizeMake(LENGTH(83), LENGTH(121)));
    }];
    
    [threeimageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(oneimageview.mas_bottom).with.offset(LENGTH(131));
        make.left.mas_equalTo(ws).with.offset(LENGTH(10));
        make.size.mas_equalTo(CGSizeMake(LENGTH(80), LENGTH(80)));
    }];
    
    
    
    label = [[BaseLabel alloc] initWithTxteColor:RGB(0, 0, 0) LabelFont:TextFont(20) TextAlignment:NSTextAlignmentLeft Text:@""];
    [scrollView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->scrollView).with.offset(StatusBar+LENGTH(80));
        make.left.mas_equalTo(ws).with.offset(LENGTH(21));
    }];
    
    BaseLabel * jj = [[BaseLabel alloc] initWithTxteColor:RGB(153,153,153) LabelFont:TextFont(14) TextAlignment:NSTextAlignmentLeft Text:@"简介"];
    [scrollView addSubview:jj];
    [jj mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->label.mas_bottom).with.offset(LENGTH(30));
        make.left.mas_equalTo(ws).with.offset(LENGTH(21));
    }];
    
    subtitle = [[BaseLabel alloc] initWithTxteColor:RGB(51, 51, 51) LabelFont:TextFont(16) TextAlignment:NSTextAlignmentLeft Text:@""];
    subtitle.numberOfLines = 0;
    [scrollView addSubview:subtitle];
    [subtitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(jj.mas_bottom).with.offset(LENGTH(16));
        make.left.mas_equalTo(ws).with.offset(LENGTH(21));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(21));
    }];
    
    UIView * xian = [UIView new];
    xian.backgroundColor = RGB(229, 229, 229);
    [scrollView addSubview:xian];
    [xian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->subtitle.mas_bottom).with.offset(LENGTH(25));
        make.left.mas_equalTo(ws).with.offset(LENGTH(20));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(20));
        make.bottom.mas_equalTo(self->scrollView.mas_bottom).with.offset(-LENGTH(20));
        make.height.mas_equalTo(1);
    }];
}
- (void)tapGesture1{
    [UIView animateWithDuration:0.5 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (void)setModel:(BookXQModel *)model{
    _model = model;
    label.text = model.book.name;
    subtitle.text = model.book.info;
}
@end
