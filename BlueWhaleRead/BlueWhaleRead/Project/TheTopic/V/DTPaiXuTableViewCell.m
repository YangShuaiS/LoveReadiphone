//
//  DTPaiXuTableViewCell.m
//  BoWanJuanForPad
//
//  Created by 杨帅 on 2018/5/24.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "DTPaiXuTableViewCell.h"

@implementation DTPaiXuTableViewCell{
    BaseLabel * Title;
    BaseView * view ;
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
    view = [BaseView new];
    view.backgroundColor = RGB(255, 255, 255);
    [self addSubview:view];
    
    
    Title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(85, 137, 230) LabelFont:TextFontCu(15) TextAlignment:NSTextAlignmentLeft Text:@"案我是答案我是答案我是答案我是答案案我是答案我是答案我是答案我是答"];
    Title.numberOfLines = 0;
    [view addSubview:Title];
    
    WS(ws);
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(ws).with.offset(0);
        make.bottom.equalTo(ws).with.offset(-LENGTH(10));
        make.top.equalTo(ws).with.offset(0);
        make.left.equalTo(ws).with.offset(0);
        make.height.mas_equalTo(LENGTH(56));
    }];
    
    
    [Title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self->view.mas_right).with.offset(-LENGTH(8));
        //        make.bottom.equalTo(self->view.mas_bottom).with.offset(-LENGTH(28));
        //        make.top.equalTo(self->view.mas_top).with.offset(LENGTH(28));
        make.left.equalTo(self->view.mas_left).with.offset(LENGTH(8));
        make.centerY.mas_equalTo(self->view.mas_centerY);
    }];
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setFrame:(CGRect)frame{
    //        frame.origin.x += 10;
    //        frame.origin.y += 10;
    //        frame.size.height -= 10;
    //        frame.size.width -= 20;
    [super setFrame:frame];
}
- (void)layoutSubviews{
    [super layoutSubviews];
    view.layer.masksToBounds = YES;
    view.layer.cornerRadius = LENGTHHEIGHT(10);
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
}
- (void)setName:(NSString *)name{
    Title.text = name;
}
- (void)setModel:(TiMuModel *)model{
    _model = model;
    Title.text = model.DaAn;
}
@end
