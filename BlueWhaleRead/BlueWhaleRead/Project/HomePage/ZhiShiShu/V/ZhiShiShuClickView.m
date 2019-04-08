//
//  ZhiShiShuClickView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/2/22.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "ZhiShiShuClickView.h"
#import "LBTViewController.h"
#import "ZhiShiShuShuViewController.h"
#import "ArticleViewController.h"
@implementation ZhiShiShuClickView{
    FLAnimatedImageView * left;
    FLAnimatedImageView * center;
    FLAnimatedImageView * right;
    BaseLabel * label;
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
    left = [self returnimageview];
    [self addSubview:left];
    
    center = [self returnimageview];
    [self addSubview:center];
    
    right = [self returnimageview];
    [self addSubview:right];
    
    label = [[BaseLabel alloc] initWithTxteColor:RGB(255, 255, 255) LabelFont:TextFont(12) TextAlignment:NSTextAlignmentLeft Text:@"中国古代神话中地\n位最高，修为最\n深的大神"];
    label.numberOfLines = 2;
    [center addSubview:label];
    
    [left mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.top.and.bottom.mas_equalTo(ws);
    }];
    [center mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->left.mas_right);
        make.top.and.bottom.mas_equalTo(ws);
    }];
    [right mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.and.top.and.bottom.mas_equalTo(ws);
        make.left.mas_equalTo(self->center.mas_right);
    }];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self->center).with.insets(UIEdgeInsetsMake(0, LENGTH(5), 0, 0));
    }];
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *backtap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click)];
    //将手势添加到需要相应的view中去
    [self addGestureRecognizer:backtap];
}
- (FLAnimatedImageView *)returnimageview{
    FLAnimatedImageView * imageview = [FLAnimatedImageView new];
    imageview.contentMode = UIViewContentModeScaleToFill;
    return imageview;
}

- (void)setModel:(ZhiShiShuClickModel *)model{
    _model = model;
    __block ZhiShiShuClickView * bloclself = self;
    NSString * log1 = [[NSString stringWithFormat:@"%@%@",ZSTXIMAGEURL,model.left_img] stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    [left sd_setImageWithURL:[NSURL URLWithString:log1] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        [bloclself upleftimage:image];
    }];
    
    NSString * centerimage = [[NSString stringWithFormat:@"%@%@",ZSTXIMAGEURL,model.middle_img] stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    [center sd_setImageWithURL:[NSURL URLWithString:centerimage] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        [bloclself upcenterimage:image];
    }];
    
    NSString * rightimage = [[NSString stringWithFormat:@"%@%@",ZSTXIMAGEURL,model.right_img] stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    [right sd_setImageWithURL:[NSURL URLWithString:rightimage] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        [bloclself uprightimageL:image];
    }];
    label.textColor = [BaseObject colorWithHexString:model.arrow_words_color Alpha:1];
    NSMutableString* str=[[NSMutableString alloc]initWithString:model.arrow_words];
    if (str.length>15) {
        [str insertString:@"\n"atIndex:15];
        [str insertString:@"\n"atIndex:8];
        label.font = TextFont(12);
    }else if (str.length > 8){
        [str insertString:@"\n"atIndex:8];
        label.font = TextFont(12);
    }else{
        label.font = TextFont(14);
    }
    label.text = str;
}
- (void)upleftimage: (UIImage *)image{
    [left mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(image.size.width/2);
        make.height.mas_equalTo(image.size.height/2);
    }];
}
- (void)upcenterimage:(UIImage *)image{
    [center mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.width.mas_equalTo(image.size.width/2);
        make.height.mas_equalTo(image.size.height/2);
    }];
}

- (void)uprightimageL:(UIImage *)image{
    [right mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(image.size.width/2);
        make.height.mas_equalTo(image.size.height/2);
    }];
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
