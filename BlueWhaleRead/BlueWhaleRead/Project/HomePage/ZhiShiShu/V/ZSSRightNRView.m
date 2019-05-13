//
//  ZSSRightNRView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/2/25.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "ZSSRightNRView.h"
#import "LBTViewController.h"
#import "ZhiShiShuShuViewController.h"
#import "ArticleViewController.h"
@implementation ZSSRightNRView{
    UIView * backview;
    BaseLabel * lable;
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
    WS(ws);
    backview = [UIView new];
    backview.layer.masksToBounds = YES;
    backview.layer.cornerRadius = LENGTH(10);
    backview.layer.borderWidth = 1;
    backview.layer.borderColor = RGB(255, 255, 255).CGColor;
    [self addSubview:backview];
    [backview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.bottom.mas_equalTo(ws);
        make.left.mas_equalTo(ws).with.offset(LENGTH(14));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(14));
    }];
    
    lable = [[BaseLabel alloc] initWithTxteColor:RGB(255, 255, 255) LabelFont:TextFont(13) TextAlignment:NSTextAlignmentLeft Text:@""];
    lable.numberOfLines = 0;
    [backview addSubview:lable];
    [lable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self->backview).with.insets(UIEdgeInsetsMake(LENGTH(6), LENGTH(10), LENGTH(6), LENGTH(42)));
    }];
    
    FLAnimatedImageView * imageview =[FLAnimatedImageView new];
    imageview.contentMode = UIViewContentModeScaleAspectFit;
    imageview.image = UIIMAGE(@"圆底箭头");
    [backview addSubview:imageview];
    [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self->backview);
        make.right.mas_equalTo(self->backview).with.offset(-LENGTH(5));
        make.width.mas_equalTo(LENGTH(16));
        make.height.mas_equalTo(LENGTH(16));
    }];
    
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *backtap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click)];
    //将手势添加到需要相应的view中去
    [self addGestureRecognizer:backtap];
}
- (void)setModel:(ZhiShiShuClickModel *)model{
    _model = model;
    lable.text  = model.arrow_words;
    backview.backgroundColor = _backcolor;
}
- (void)layoutSubviews{
    [super layoutSubviews];
}
- (void)click{
    if ([_model.click_type isEqualToString:@"2"]) {
        if (_model.banner_type == 1) {
            LBTViewController * vc = [LBTViewController new];
            vc.inter = 1;
            vc.itemid = _model.click_to_id;
            [[self viewController].navigationController pushViewController:vc animated:YES];
        }else{
            ArticleViewController * vc = [ArticleViewController new];
            vc.itemid = _model.click_to_id;
            [[self viewController].navigationController pushViewController:vc animated:YES];
        }
    }else if ([_model.click_type isEqualToString:@"3"]){
        ZhiShiShuShuViewController * vc = [ZhiShiShuShuViewController new];
        vc.itemid = _model.click_to_id;
        [[self viewController].navigationController pushViewController:vc animated:YES];
    }
}
@end
