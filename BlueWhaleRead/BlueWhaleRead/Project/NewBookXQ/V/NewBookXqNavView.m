//
//  NewBookXqNavView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/3/18.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "NewBookXqNavView.h"
#import "NBookXQNTwoView.h"
@implementation NewBookXqNavView{
    BaseLabel * titlelabel;
    NBookXQNTwoView * twoview;
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
    UIView * backView = [UIView new];
    [self addSubview:backView];
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws).with.insets(UIEdgeInsetsMake(StatusBar, 0, 0, 0));
        make.height.mas_equalTo(NavHeight - StatusBar);
    }];
    
    UIImage * backImage = UIIMAGE(@"backhei");
    FLAnimatedImageView * left = [FLAnimatedImageView new];
    left.image = backImage;
    left.contentMode = UIViewContentModeScaleAspectFit;
    [backView addSubview:left];
    [left mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(backView).with.offset(LENGTH(16));
        make.centerY.mas_equalTo(backView);
        make.size.mas_equalTo(backImage.size);
    }];
    
    
    BaseButton * LeftBigButton = [BaseButton buttonWithType:UIButtonTypeCustom];
    [LeftBigButton addTarget:self action:@selector(left) forControlEvents:UIControlEventTouchUpInside];
    [backView addSubview:LeftBigButton];
    
    [LeftBigButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(backView).with.offset(0);
        make.bottom.equalTo(backView).with.offset(0);
        make.height.mas_equalTo(backView);
        make.width.mas_equalTo(LENGTH(36)+backView.frame.size.width);
    }];
    
    titlelabel = [[BaseLabel alloc] initWithTxteColor:RGB(0, 0, 0) LabelFont:[UIFont fontWithName:@"PingFang-TC" size:FontSize(18)] TextAlignment:NSTextAlignmentCenter Text:@""];
    [backView addSubview:titlelabel];
    [titlelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.bottom.mas_equalTo(backView);
        make.left.mas_equalTo(left.mas_right).with.offset(LENGTH(20));
        make.right.mas_equalTo(backView).with.offset(-LENGTH(36)-backView.frame.size.width);
    }];
    titlelabel.alpha = 1;
    
    twoview = [NBookXQNTwoView new];
    [backView addSubview:twoview];
    [twoview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.bottom.mas_equalTo(backView);
        make.left.mas_equalTo(left.mas_right).with.offset(LENGTH(20));
        make.right.mas_equalTo(backView).with.offset(-LENGTH(36)-backView.frame.size.width);
    }];
    twoview.alpha = 0;
}
- (void)left{
    [[self viewController].navigationController popViewControllerAnimated:YES];
}

- (void)setModel:(BookXQModel *)model{
    _model = model;
    titlelabel.text = @"书籍详情";
    twoview.model = model;
}

- (void)scrodidsize:(CGFloat)size{
    __block NewBookXqNavView * blockSelf = self;
    if (size <= NavHeight && titlelabel.alpha == 0) {
        [UIView animateWithDuration:0.5 animations:^{
            blockSelf->titlelabel.alpha = 1;
            blockSelf->twoview.alpha = 0;
        } completion:^(BOOL finished) {
            
        }];
        
    }else if (size > NavHeight && titlelabel.alpha == 1){
        [UIView animateWithDuration:0.5 animations:^{
            blockSelf->titlelabel.alpha = 0;
            blockSelf->twoview.alpha = 1;
        } completion:^(BOOL finished) {
            
        }];
    }
}
- (void)layoutSubviews{
    [super layoutSubviews];
    self.layer.shadowColor = RGB(0, 0, 0).CGColor;
    self.layer.shadowOffset = CGSizeMake(0,2);//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
    self.layer.shadowRadius = 2;
    self.layer.shadowOpacity = 0.04;
}
@end
