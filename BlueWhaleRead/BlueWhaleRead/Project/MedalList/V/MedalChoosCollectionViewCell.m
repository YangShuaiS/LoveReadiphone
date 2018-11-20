//
//  MedalChoosCollectionViewCell.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/9.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "MedalChoosCollectionViewCell.h"

@implementation MedalChoosCollectionViewCell{
    FLAnimatedImageView * bookimageView;
    FLAnimatedImageView * downImageView;
    BaseLabel * bookStyleLabel;

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
    bookimageView = [FLAnimatedImageView new];
//    bookimageView.image = UIIMAGE(ZHANWEITUTX);
    bookimageView.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:bookimageView];
    [bookimageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws).with.offset(LENGTH(1));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(1));
        make.top.mas_equalTo(ws);
        make.bottom.mas_equalTo(ws);
    }];
    
    downImageView = [FLAnimatedImageView new];
//    downImageView.backgroundColor = RANDOMCOLOR;
    downImageView.image = UIIMAGE(@"icon_勋章_添加书");
    [self addSubview:downImageView];
    [downImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws);
        make.right.mas_equalTo(ws);
        make.bottom.mas_equalTo(ws);
        make.height.mas_equalTo(LENGTH(10));
    }];
    
    NSInteger font;
        if (self.frame.size.width>30) {
            font = 10;
        }else{
            font = 6;
        }
    bookStyleLabel = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0,179,177) LabelFont:TextFontCu(font) TextAlignment:NSTextAlignmentCenter Text:@"待加入"];
    bookStyleLabel.backgroundColor = RGB(107, 219, 216);
    [downImageView addSubview:bookStyleLabel];
    [bookStyleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->downImageView.mas_left).with.offset(2);
        make.right.mas_equalTo(self->downImageView.mas_right).with.offset(-2);
        make.bottom.mas_equalTo(self->downImageView.mas_bottom).with.offset(-1);
//        make.centerX.mas_equalTo(self->downImageView.mas_centerX);
//        make.top.mas_equalTo(self->downImageView.mas_bottom).with.offset(LENGTH(2));
//        make.height.mas_equalTo(LENGTH(17));
    }];
    [bookStyleLabel layoutIfNeeded];
    [self changeLabelStyle:bookStyleLabel];
}

-(void)changeLabelStyle:(UILabel *)label{
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:label.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(LENGTH(2.5), LENGTH(2.5))];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = label.bounds;
    maskLayer.path = maskPath.CGPath;
    label.layer.mask = maskLayer;
}

- (void)setAllmodel:(AllBookListModel *)allmodel{
    _allmodel = allmodel;
    bookimageView.contentMode = UIViewContentModeScaleAspectFit;
    [bookimageView sd_setImageWithURL:URLIMAGE(allmodel.cover) placeholderImage:UIIMAGE(ZHANWEITUSHU)];
    if (allmodel.is_read==1) {
        bookStyleLabel.text = @"未读";
        bookStyleLabel.textColor = RGB(0,179,177);
        bookStyleLabel.backgroundColor = RGB(107, 219, 216);
    }else if (allmodel.is_read == 2){
        bookStyleLabel.text = @"已读";
        bookStyleLabel.textColor = RGB(194,146,1);
        bookStyleLabel.backgroundColor = RGB(254,215,80);
    }else{
        bookStyleLabel.text = @"待加入";
        bookStyleLabel.textColor = RGB(0,179,177);
        bookStyleLabel.backgroundColor = RGB(107, 219, 216);
    }

}
- (void)cellCSH{
    bookimageView.contentMode = UIViewContentModeScaleAspectFill;
    bookimageView.image = UIIMAGE(@"");
    bookStyleLabel.text = @"待加入";
    bookStyleLabel.textColor = RGB(0,179,177);
    bookStyleLabel.backgroundColor = RGB(107, 219, 216);
}
- (void)jiahao{
    bookimageView.image = UIIMAGE(@"icon_添加勋章书籍");
    bookimageView.contentMode = UIViewContentModeCenter;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    WS(ws);

    [downImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(ws.frame.size.height/2);
    }];
}
@end
