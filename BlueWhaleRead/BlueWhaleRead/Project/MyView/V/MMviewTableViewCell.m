//
//  MMviewTopTableViewCell.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/28.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "MMviewTableViewCell.h"

@implementation MMviewTableViewCell{
    FLAnimatedImageView * imageview;
    BaseLabel * name;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self =  [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addview];
    }
    return self;
}
- (void)addview{
    WS(ws);
    self.backgroundColor = [UIColor clearColor];
    imageview = [FLAnimatedImageView new];
    imageview.contentMode = UIViewContentModeScaleAspectFit;
//    imageview.backgroundColor = RANDOMCOLOR;
    [self addSubview:imageview];
    [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(LENGTH(42));
        make.top.mas_equalTo(ws).with.offset(LENGTH(16));
        make.bottom.mas_equalTo(ws).with.offset(-LENGTH(16));
        make.width.and.height.mas_equalTo(LENGTH(17));
    }];
    
    name = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(51, 51, 51) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentLeft Text:@""];
    [self addSubview:name];
    [name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->imageview.mas_right).with.offset(LENGTH(16));
        make.centerY.mas_equalTo(ws);
    }];
    
    UIView * dowxxian = [UIView new];
    dowxxian.backgroundColor = RGB(229,229,229);
    [self addSubview:dowxxian];
    [dowxxian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(ws).with.offset(-1);
        make.height.mas_equalTo(1);
        make.left.mas_equalTo(ws).with.offset(LENGTH(25));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(25));
    }];
    
    FLAnimatedImageView * bakimage = [FLAnimatedImageView new];
    bakimage.image = UIIMAGE(@"icon_个人资料_箭头");
    [self addSubview:bakimage];
    [bakimage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(ws.mas_right).with.offset(-LENGTH(38));
        make.centerY.mas_equalTo(ws);
        make.width.mas_equalTo(LENGTH(8));
        make.height.mas_equalTo(LENGTH(13));
    }];
    
}

- (void)setNamestring:(NSString *)namestring{
    _namestring = namestring;
    name.text = namestring;
}
- (void)setImagestring:(NSString *)imagestring{
    _imagestring = imagestring;
    imageview.image = UIIMAGE(imagestring);
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
