//
//  BookXqTopCollectionViewCell.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/18.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BookXqTopCollectionViewCell.h"
#import "UIImage+ChangeColor.h"
@implementation BookXqTopCollectionViewCell{
    UIImageView * imageview;
    BaseLabel * title;
}
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    WS(ws);
    UIColor * color = [UIColor clearColor];
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = LENGTH(5);
    self.layer.borderWidth = 1;
    self.layer.borderColor = color.CGColor;
    
    imageview = [UIImageView new];
    imageview.contentMode = UIViewContentModeScaleAspectFit;
    imageview.image = UIIMAGE(@"组 -1");
    [self addSubview:imageview];
    [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(ws);
        make.left.mas_equalTo(ws).with.offset(LENGTH(5));
        make.width.mas_equalTo(19);
        make.height.mas_equalTo(19);
    }];
    
    title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:color LabelFont:TextFont(12) TextAlignment:NSTextAlignmentLeft Text:@"上海101小学"];
    [self addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.bottom.mas_equalTo(ws);
        make.left.mas_equalTo(self->imageview.mas_right).with.offset(LENGTH(2));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(2));
    }];
}
- (void)setModel:(BookDanModel *)model{
    _model = model;
    title.text = model.name;
    UIColor * color;
    if ([model.theme_color isEqualToString:@"1"]) {
        imageview.image = UIIMAGE(@"组 393");
        color = RGB(172,210,255);
    }else if ([model.theme_color isEqualToString:@"2"]){
        imageview.image = UIIMAGE(@"组 -1");
        color = RGB(255,181,181);
    }else if ([model.theme_color isEqualToString:@"3"]){
        imageview.image = UIIMAGE(@"组 -2");
        color = RGB(255,212,144);
    }else if ([model.theme_color isEqualToString:@"4"]){
        imageview.image = UIIMAGE(@"组 -3");
        color = RGB(165,226,214);
    }else if ([model.theme_color isEqualToString:@"5"]){
        imageview.image = UIIMAGE(@"组 -4");
        color = RGB(236,195,255);
    }else if ([model.theme_color isEqualToString:@"6"]){
        imageview.image = UIIMAGE(@"组 -5");
        color = RGB(166,220,227);
    }
    title.textColor = color;
    self.layer.borderColor = color.CGColor;
//    imageview.backgroundColor = color;
}

@end
