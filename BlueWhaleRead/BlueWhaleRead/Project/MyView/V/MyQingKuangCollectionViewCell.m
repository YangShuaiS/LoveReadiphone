//
//  MyQingKuangCollectionViewCell.m
//  BoWanJuanForPad
//
//  Created by 杨帅 on 2018/5/29.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "MyQingKuangCollectionViewCell.h"

@implementation MyQingKuangCollectionViewCell{
    FLAnimatedImageView * imageView;
    BaseLabel * content;
    BaseLabel * name;
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
    imageView = [FLAnimatedImageView new];
    imageView.backgroundColor = RGB(72,194,193);
    imageView.layer.masksToBounds = YES;
    imageView.layer.cornerRadius = LENGTH(85/2);
    [self addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(0);
        make.left.equalTo(ws).with.offset(0);
        make.right.equalTo(ws).with.offset(0);
        make.height.mas_equalTo(LENGTH(85));
        make.width.mas_equalTo(LENGTH(85));
    }];
    
    content = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:WhitColor LabelFont:TextFont(17) TextAlignment:NSTextAlignmentCenter Text:[NSString stringWithFormat:@"%@\n%@",ZHANWEIZI,ZHANWEIZI]];
    content.numberOfLines = 0;
    [imageView addSubview:content];
    [content mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->imageView.mas_top).with.offset(0);
        make.left.equalTo(self->imageView.mas_left).with.offset(0);
        make.right.equalTo(self->imageView.mas_right).with.offset(0);
        make.bottom.equalTo(self->imageView.mas_bottom).with.offset(0);
    }];
    
    name = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:ChangYongTitLe LabelFont:TextFont(17) TextAlignment:NSTextAlignmentCenter Text:ZHANWEIZI];
    [self addSubview:name];
    [name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->imageView.mas_bottom).with.offset(LENGTH(17));
        make.left.equalTo(ws).with.offset(0);
        make.right.equalTo(ws).with.offset(0);
    }];
}
-(void)setTitle:(NSString *)title{
    _title = title;
    name.text = title;
}
- (void)setContenttitle:(NSString *)contenttitle{
    _contenttitle = contenttitle;
    content.text = contenttitle;
}
@end
