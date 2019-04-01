//
//  NBXQReadTableViewCell.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/3/19.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "NBXQReadTableViewCell.h"

@implementation NBXQReadTableViewCell{
    UIView * backview;
    BaseLabel * title;
    UIImageView * imageview;
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
//    self.layer.masksToBounds = YES;
    
    WS(ws);
    backview = [UIView new];
    backview.layer.cornerRadius = LENGTH(14);
    backview.backgroundColor = [UIColor whiteColor];
    backview.layer.shadowOpacity = 1;
    backview.layer.shadowColor = RGBA(171, 171, 171,0.24).CGColor;
    backview.layer.shadowRadius = LENGTH(8);
    backview.layer.shadowOffset = CGSizeMake(4,0);
    [self addSubview:backview];
    [backview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws).with.offset(LENGTH(5));
        make.left.mas_equalTo(ws).with.offset(LENGTH(21));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(21));
        make.bottom.mas_equalTo(ws).with.offset(-LENGTH(5));
    }];
    
    title = [[BaseLabel alloc] initWithTxteColor:RGB(51, 51, 51) LabelFont:TextFont(16) TextAlignment:NSTextAlignmentLeft Text:@""];
    title.numberOfLines = 3;
    [backview addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->backview).with.offset(LENGTH(17));
        make.left.mas_equalTo(self->backview).with.offset(LENGTH(16));
        make.right.mas_equalTo(self->backview).with.offset(-LENGTH(16));
    }];
    
    UIView * downview = [UIView new];
    [backview addSubview:downview];
    [downview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self->backview);
        make.top.mas_equalTo(self->title.mas_bottom).with.offset(LENGTH(10));
        make.bottom.mas_equalTo(self->backview).with.offset(-LENGTH(10));
    }];
    
    imageview = [UIImageView new];
    imageview.contentMode = UIViewContentModeScaleAspectFit;
    imageview.image = UIIMAGE(@"icon_个人资料_箭头");
    [downview addSubview:imageview];

    imageview.transform = CGAffineTransformMakeRotation(M_PI/2);
    imageview.image = [imageview.image imageWithRenderingMode:(UIImageRenderingModeAlwaysTemplate)];
    imageview.tintColor = RGB(153,153,153);
    
    BaseLabel * ti = [[BaseLabel alloc] initWithTxteColor:RGB(153,153,153) LabelFont:TextFont(12) TextAlignment:NSTextAlignmentLeft Text:@"展开"];
    [downview addSubview:ti];
    [ti mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->imageview.mas_right).with.offset(LENGTH(7));
        make.right.mas_equalTo(downview).with.offset(LENGTH(5));
        make.top.mas_equalTo(downview).with.offset(LENGTH(10));
        make.bottom.mas_equalTo(downview).with.offset(LENGTH(5));
    }];
    
    [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(downview).with.offset(LENGTH(5));
        make.centerY.mas_equalTo(ti);
        make.size.mas_equalTo(CGSizeMake(LENGTH(6), LENGTH(10)));
    }];
    
    downview.userInteractionEnabled = YES;
    //添加手势
    UITapGestureRecognizer * tapGesture1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture1)];
    //将手势添加到需要相应的view中去
    [downview addGestureRecognizer:tapGesture1];
}

- (void)setModel:(BookXQReadThoughtModel *)model{
    _model = model;
    title.text = model.content;
}

- (void)tapGesture1{
    _model.cellstyle = _model.cellstyle==1?0:1;
    self.block();
}
- (void)setTop:(NSInteger)top{
    _top = top;
    if (top == 1) {
        WS(ws);
        [backview mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(ws).with.offset(LENGTH(18));
        }];
    }
}
- (void)setStyles:(NSInteger)styles{
    _styles = styles;
    if (styles == 1) {
        imageview.transform = CGAffineTransformMakeRotation(M_PI+M_PI/2);
        title.numberOfLines = 0;
    }
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)layoutSubviews{
    [super layoutSubviews];

}
@end
