//
//  CTTableViewCell.m
//  BoWanJuanForPad
//
//  Created by 杨帅 on 2018/5/25.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "CTTableViewCell.h"

@implementation CTTableViewCell

{
    BaseLabel * Title;
    BaseView * view ;
    FLAnimatedImageView * imageView;
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
    view.backgroundColor = [UIColor clearColor];
    view.layer.borderWidth = 1;
    view.layer.borderColor = [UIColor whiteColor].CGColor;
    [self addSubview:view];
    
    Title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255, 255, 255) LabelFont:TextFontCu(LENGTH(15)) TextAlignment:NSTextAlignmentLeft Text:@"案我是答案我是答案我是答案我是答案案我是答案我是答案我是答案我是答"];
    Title.numberOfLines = 0;
    [view addSubview:Title];
    WS(ws);
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(ws).with.offset(-LENGTH(28));
        make.bottom.equalTo(ws).with.offset(-LENGTH(10));
        make.top.equalTo(ws).with.offset(0);
        make.left.equalTo(ws).with.offset(0);
        make.height.mas_equalTo(LENGTH(66));
    }];
    
    
    [Title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self->view.mas_right).with.offset(-LENGTH(8));
        //        make.bottom.equalTo(self->  ).with.offset(-LENGTH(28));
        //        make.top.equalTo(self->view.mas_top).with.offset(LENGTH(28));
        make.left.equalTo(self->view.mas_left).with.offset(LENGTH(8));
        make.centerY.mas_equalTo(self->view.mas_centerY);
    }];
    
    imageView = [FLAnimatedImageView new];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(ws).with.offset(LENGTH(0));
        make.centerY.mas_equalTo(self->view.mas_centerY);
        make.width.mas_equalTo(LENGTH(29));
        make.height.mas_equalTo(LENGTH(20));
    }];
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
//- (void)setFrame:(CGRect)frame{
//    //        frame.origin.x += 10;
//    //        frame.origin.y += 10;
//    //        frame.size.height -= 10;
//    //        frame.size.width -= 20;
//    [super setFrame:frame];
//}
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

- (void)setStyle:(NSInteger)style{
    _style = style;
    if (style == 0) {
        [self ClickCell];
    }else if (style == 1){
        [self BackClickCell];

    }else if (style == 2){
        [self payxucell];
    }else if (style == 3){
        [self duoxuancell];
    }

}
- (void)ClickCell{
    // 正确图
    imageView.image = UIIMAGE(@"icon_查看错题_对勾");
    CGRect frame = imageView.frame;
    frame.size.width = 29;
    frame.size.height = 20;
    imageView.frame = frame;
    view.backgroundColor = RGB(0,215,167);
}
- (void)BackClickCell{
    imageView.image = UIIMAGE(@"icon_查看错题_错");
    CGRect frame = imageView.frame;
    frame.size.width = 23;
    frame.size.height = 23 ;
    imageView.frame = frame;
    view.backgroundColor = RGB(255,129,129);
}
- (void)payxucell{
    view.backgroundColor = RGB(255,255,255);
    Title.textColor = RGB(85,137,230);
}
- (void)duoxuancell{
    view.backgroundColor = RGB(254,165,79);
}
- (void)setTimodel:(TiMuModel *)timodel{
    _timodel = timodel;
    Title.text = timodel.DaAn;
}

@end
