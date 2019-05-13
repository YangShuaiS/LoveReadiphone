//
//  MingYanShareView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/4/15.
//  Copyright © 2019 YS. All rights reserved.
//

#import "MingYanShareView.h"

@implementation MingYanShareView{
    UIImageView * imageView;
    BaseLabel * time;
    BaseLabel * title;
    UIImageView * imageViews;
    BaseLabel * downlabel;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addview];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _allinter = 0;
        [self addview];
    }
    return self;
}
- (void)addview{
    WS(ws);
    self.backgroundColor = [UIColor whiteColor];
    imageView = [UIImageView new];
    imageView.backgroundColor = RGB(152, 152, 152);
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.and.top.mas_equalTo(ws);
        make.height.mas_equalTo(LENGTH(183));
    }];
    
    time = [[BaseLabel alloc] initWithTxteColor:RGBA(152, 152, 152, 1) LabelFont:TextFont(13) TextAlignment:NSTextAlignmentLeft Text:@"2019/4/20"];
    [self addSubview:time];
    [time mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->imageView.mas_bottom).with.offset(LENGTH(18));
        make.left.mas_equalTo(ws).with.offset(LENGTH(19));
    }];
    
    title = [[BaseLabel alloc] initWithTxteColor:RGBA(3, 3, 3, 1) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentLeft Text:@""];
    title.numberOfLines = 0;
    [self addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.mas_equalTo(self->time.mas_bottom).with.offset(LENGTH(18));
        make.height.mas_equalTo(LENGTH(165));
        make.left.mas_equalTo(ws).with.offset(LENGTH(19));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(19));
        make.bottom.mas_equalTo(ws).with.offset(-LENGTH(20));
    }];
    
    downlabel = [[BaseLabel alloc] initWithTxteColor:RGBA(3, 3, 3, 1) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentRight Text:@""];
    [self addSubview:downlabel];
    [downlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        //        make.top.mas_equalTo(self->time.mas_bottom).with.offset(LENGTH(18));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(19));
        make.bottom.mas_equalTo(self->title.mas_bottom);
    }];
    
    UIImageView * touxiang = [UIImageView new];
    touxiang.contentMode = UIViewContentModeScaleAspectFit;
    touxiang.layer.masksToBounds = YES;
    touxiang.layer.cornerRadius = LENGTH(13);
    [self addSubview:touxiang];
    [touxiang mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws).with.offset(LENGTH(10));
        make.left.mas_equalTo(ws).with.offset(LENGTH(18));
        make.size.mas_equalTo(CGSizeMake(LENGTH(26), LENGTH(26)));
    }];
    [touxiang sd_setImageWithURL:URLIMAGE(Me.avatar) placeholderImage:UIIMAGE(@"icon-男孩") completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        ws.allinter ++;
    }];

    
    BaseLabel * label = [[BaseLabel alloc] initWithTxteColor:RGB(255, 255, 255) LabelFont:TextFontCu(13) TextAlignment:NSTextAlignmentLeft Text:Me.name];
    [self addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(touxiang);
        make.left.mas_equalTo(touxiang.mas_right).with.offset(LENGTH(9));
    }];
    
    imageViews = [UIImageView new];
    imageViews.contentMode = UIViewContentModeScaleAspectFit;
    imageViews.backgroundColor = [UIColor clearColor];
    [self addSubview:imageViews];
    [imageViews mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(ws).with.offset(-LENGTH(17));
        make.centerY.mas_equalTo(self->imageView.mas_bottom);
        make.size.mas_equalTo(CGSizeMake(LENGTH(50), LENGTH(50)));
    }];
    
    imageViews.layer.shadowColor = RGB(3, 3, 3).CGColor;
    imageViews.layer.shadowOffset = CGSizeMake(0,1);//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
    imageViews.layer.shadowRadius = 4;
    imageViews.layer.shadowOpacity = 0.2;
}

- (void)setModel:(NHProverbModel *)model{
    _model = model;
    WS(ws);
    [imageView sd_setImageWithURL:URLIMAGE(model.img) completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        ws.allinter ++;
    }];
    time.text = [NSString stringWithFormat:@"%ld/%ld/%ld",model.timedate.year,model.timedate.month,model.timedate.day];
    title.text = model.content;

    if ([model.author isEqualToString:@""]) {
        
    }else{
        downlabel.text = [NSString stringWithFormat:@"—— %@",model.author];
    }
    
}

- (void)setErweimaImage:(NSURL *)erweimaImage{
    _erweimaImage = erweimaImage;
    WS(ws);
    [imageViews sd_setImageWithURL:erweimaImage completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        ws.allinter ++;
    }];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    CGRect frame = CGRectMake(imageView.frame.origin.x, imageView.frame.origin.y, imageView.frame.size.width, LENGTH(65));
    CAGradientLayer *gradientLayer0 = [[CAGradientLayer alloc] init];
    gradientLayer0.frame = frame;
    gradientLayer0.colors = @[
                              (id)[UIColor colorWithRed:3.0f/255.0f green:3.0f/255.0f blue:3.0f/255.0f alpha:0.4f].CGColor,
                              (id)[UIColor colorWithRed:255.0f/255.0f green:255.0f/255.0f blue:255.0f/255.0f alpha:.0f].CGColor];
    gradientLayer0.locations = @[@0,@1];
    [gradientLayer0 setStartPoint:CGPointMake(1, 0)];
    [gradientLayer0 setEndPoint:CGPointMake(1,1)];
    [imageView.layer addSublayer:gradientLayer0];
}
@end
