//
//  YSInformationView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/2/14.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "YSInformationView.h"
@implementation YSInformationView{
    FLAnimatedImageView * imageView;
    BaseLabel * onetitle;
    BaseLabel * twotitle;
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
    imageView = [FLAnimatedImageView new];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.layer.masksToBounds = YES;
    imageView.layer.cornerRadius = LENGTH(5);
    imageView.backgroundColor = RGB(239, 239, 239);
    [self addSubview:imageView];
    
    onetitle = [[BaseLabel alloc] initWithTxteColor:RGB(31, 31, 31) LabelFont:TextFont(14) TextAlignment:NSTextAlignmentLeft Text:@"四大名著：西游记"];
    [self addSubview:onetitle];
    
    twotitle = [[BaseLabel alloc] initWithTxteColor:RGB(175, 175, 175) LabelFont:TextFont(11) TextAlignment:NSTextAlignmentLeft Text:@"一部浪漫主义长篇神魔小说"];
    [self addSubview:twotitle];

}

- (void)setStyle:(YSInformationViewStyle)style{
    _style = style;
    switch (style) {
        case YSInformationViewStyleBigImageAmdOndTwoTitle:
            [self upYSInformationViewStyleBigImageAmdOndTwoTitle];
            break;
        case YSInformationViewStyleSomleImageAndOnetTitle:
            [self upYSInformationViewStyleSomleImageAndOnetTitle];
            break;
        case YSInformationViewStyleSomleImageAndTwotTitle:
            [self upYSInformationViewStyleSomleImageAndTwotTitle];
            break;
             
        default:
            break;
    }
}
- (void)upYSInformationViewStyleBigImageAmdOndTwoTitle{
    WS(ws);
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.and.right.mas_equalTo(ws);
        make.height.mas_equalTo(self->imageView.mas_width).multipliedBy(1.422857);
    }];
    
    [onetitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->imageView.mas_bottom).with.offset(LENGTH(14));
        make.left.and.right.mas_equalTo(ws);
    }];
    
    [twotitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->onetitle.mas_bottom).with.offset(LENGTH(5));
        make.left.and.right.mas_equalTo(ws);
    }];
}
- (void)upYSInformationViewStyleSomleImageAndOnetTitle{
    WS(ws);
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.and.right.mas_equalTo(ws);
        make.height.mas_equalTo(self->imageView.mas_width).multipliedBy(0.610561);
    }];
    
    [onetitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->imageView.mas_bottom).with.offset(LENGTH(13));
        make.left.and.right.mas_equalTo(ws);
    }];
}

- (void)upYSInformationViewStyleSomleImageAndTwotTitle{
    WS(ws);
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.and.right.mas_equalTo(ws);
        make.height.mas_equalTo(self->imageView.mas_width).multipliedBy(0.610561);
    }];
    
    [onetitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->imageView.mas_bottom).with.offset(LENGTH(14));
        make.left.and.right.mas_equalTo(ws);
    }];
    
    [twotitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->onetitle.mas_bottom).with.offset(LENGTH(5));
        make.left.and.right.mas_equalTo(ws);
    }];
}

- (void)setModel:(NKRKnowledgeModel *)model{
    _model = model;
    if (model.related_type == 1) {
        if (model.inter == 1) {
            [imageView sd_setImageWithURL:URLIMAGE(model.banner_img1)];
        }else{
            [imageView sd_setImageWithURL:URLIMAGE(model.banner_img)];
        }
    }else if (model.related_type == 2){
        if (model.inter == 1) {
            [imageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",ZSTX,model.banner_img1]]];
        }else{
            [imageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",ZSTX,model.banner_img]]];
        }
    }else{
        
    }
    

    
    onetitle.text = model.title;
    twotitle.text = model.banner_foreword;
}


@end
