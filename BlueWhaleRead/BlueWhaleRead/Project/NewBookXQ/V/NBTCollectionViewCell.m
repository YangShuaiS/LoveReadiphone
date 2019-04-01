//
//  NBTCollectionViewCell.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/3/18.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "NBTCollectionViewCell.h"

@implementation NBTCollectionViewCell{
    FLAnimatedImageView * imageView;
    BaseLabel * title;
    BaseLabel * downtitle;

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
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws).with.offset(LENGTH(17));
        make.centerX.mas_equalTo(ws);
        make.size.mas_equalTo(CGSizeMake(21, 19));
    }];
    title = [[BaseLabel alloc] initWithTxteColor:RGB(31, 31, 31) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentCenter Text:@""];
    [self addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->imageView.mas_bottom).with.offset(LENGTH(10));
        make.left.mas_equalTo(ws).with.offset(LENGTH(5));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(5));
    }];
    
    downtitle = [[BaseLabel alloc] initWithTxteColor:RGB(31, 31, 31) LabelFont:TextFont(11) TextAlignment:NSTextAlignmentCenter Text:@""];
    [self addSubview:downtitle];
    [downtitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->title.mas_bottom);
        make.left.mas_equalTo(ws).with.offset(LENGTH(5));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(5));
    }];
}
- (void)setModel:(NewBookTopClickModel *)model{
    _model = model;
    imageView.image = UIIMAGE(model.image);
    title.text = model.title;
    downtitle.text = model.downtitle;
    if (model.style == 0) {
        title.textColor = RGB(31, 31, 31);
        downtitle.textColor = RGB(31, 31, 31);
    }else if (model.style == 1){
        title.textColor = RGB(204,204,204);
        downtitle.textColor = RGB(204,204,204);
    }
}
@end
