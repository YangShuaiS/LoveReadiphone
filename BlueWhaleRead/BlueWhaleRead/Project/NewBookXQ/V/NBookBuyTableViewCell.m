//
//  NBookBuyTableViewCell.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/3/19.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "NBookBuyTableViewCell.h"

@implementation NBookBuyTableViewCell{
    UIImageView * imageView;
    BaseLabel * title;
    BaseLabel * subtitle;
    UIImageView * rightimageView;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self =  [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    return self;
}
- (void)setupUI{
    self.backgroundColor = [UIColor whiteColor];
    
    WS(ws);
    imageView = [UIImageView new];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.image = UIIMAGE(@"京东");
    [self addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws).with.offset(LENGTH(23));
        make.bottom.mas_equalTo(ws).with.offset(-LENGTH(23));
        make.left.mas_equalTo(ws).with.offset(LENGTH(20));
        make.size.mas_equalTo(CGSizeMake(LENGTH(self->imageView.image.size.width), LENGTH(self->imageView.image.size.height)));
    }];
    
    title = [[BaseLabel alloc] initWithTxteColor:RGB(31, 31, 31) LabelFont:TextFont(16) TextAlignment:NSTextAlignmentLeft Text:@"京东商城"];
    [self addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self->imageView);
        make.left.mas_equalTo(self->imageView.mas_right).with.offset(LENGTH(10));
    }];
    
    subtitle = [[BaseLabel alloc] initWithTxteColor:RGB(31, 31, 31) LabelFont:TextFont(16) TextAlignment:NSTextAlignmentLeft Text:@"¥ 40.5"];
    [self addSubview:subtitle];
    [subtitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self->imageView);
        make.right.mas_equalTo(ws).with.offset(-LENGTH(42));
    }];
    
    rightimageView = [UIImageView new];
    rightimageView.contentMode = UIViewContentModeScaleAspectFit;
    rightimageView.image = UIIMAGE(@"icon_个人资料_箭头");
    [self addSubview:rightimageView];
    rightimageView.image = [rightimageView.image imageWithRenderingMode:(UIImageRenderingModeAlwaysTemplate)];
    rightimageView.tintColor = RGB(153,153,153);
    [rightimageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self->imageView);
        make.right.mas_equalTo(ws).with.offset(-LENGTH(20));
        make.size.mas_equalTo(CGSizeMake(LENGTH(self->rightimageView.image.size.width), LENGTH(self->rightimageView.image.size.height)));
    }];
    
    UIView * xian = [UIView new];
    xian.backgroundColor = RGB(229,229,229);
    [self addSubview:xian];
    [xian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(ws).with.offset(-1);
        make.left.mas_equalTo(ws).with.offset(LENGTH(20));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(20));
        make.height.mas_equalTo(1);
    }];
}
- (void)setModel:(BookBuyLinkModel *)model{
    _model = model;
    if (model.source == 1) {
        imageView.image = UIIMAGE(@"京东");
        title.text = @"京东商城";
    }else{
        imageView.image = UIIMAGE(@"淘宝");
        title.text = @"淘宝商城";
    }
    subtitle.text = [NSString stringWithFormat:@"%@",model.price];
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
