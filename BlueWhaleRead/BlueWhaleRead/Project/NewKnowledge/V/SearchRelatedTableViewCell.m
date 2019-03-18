//
//  SearchRelatedTableViewCell.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/2/15.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "SearchRelatedTableViewCell.h"

@implementation SearchRelatedTableViewCell{
    FLAnimatedImageView * imageView;
    BaseLabel * title;
    BaseLabel * time;
    BaseLabel * yd;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self =  [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addview];
    }
    return self;
}
- (void)addview{
    self.backgroundColor = [UIColor clearColor];
    WS(ws);
    imageView = [FLAnimatedImageView new];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.layer.masksToBounds = YES;
    imageView.layer.cornerRadius = LENGTH(5);
    imageView.backgroundColor = RGB(239, 239, 239);
    [self addSubview:imageView];
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws).with.offset(LENGTH(17));
        make.top.mas_equalTo(ws);
        make.bottom.mas_equalTo(ws).with.offset(-LENGTH(20));
        make.width.mas_equalTo(LENGTH(110));
        make.height.mas_equalTo(LENGTH(68));
    }];
    
    title = [[BaseLabel alloc] initWithTxteColor:RGB(31, 31, 31) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentLeft Text:@"教育部：“大语文时代”来临,基础打不好，影响..."];
    title.numberOfLines = 2;
    [self addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->imageView);
        make.left.mas_equalTo(self->imageView.mas_right).with.offset(LENGTH(15));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(22));
    }];
    
    yd = [[BaseLabel alloc] initWithTxteColor:RGB(175,175,175) LabelFont:TextFont(11) TextAlignment:NSTextAlignmentRight Text:@"159阅读"];
    [self addSubview:yd];
    [yd mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self->imageView);
        make.right.mas_equalTo(ws).with.offset(-LENGTH(17));
    }];
    
    time = [[BaseLabel alloc] initWithTxteColor:RGB(175,175,175) LabelFont:TextFont(11) TextAlignment:NSTextAlignmentLeft Text:@"2018年13月32日"];
    [self addSubview:time];
    [time mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self->imageView);
        make.left.mas_equalTo(self->imageView.mas_right).with.offset(LENGTH(15));
    }];
}
- (void)setModel:(AllSearchWZModel *)model{
    _model = model;
    [imageView sd_setImageWithURL:URLIMAGE(model.banner_img)];
    title.text = model.title;
    yd.text = [NSString stringWithFormat:@"%@阅读",model.read_times];
    NSArray * arr = [BaseObject TiemArray:model.create_time String:@""];
    time.text = arr[0];
    
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
