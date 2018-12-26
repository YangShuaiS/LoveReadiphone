//
//  TKPView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/29.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "TKPView.h"

@implementation TKPView{
    UIImageView * backimage;
    
    UIImageView * jpimageview;
    BaseLabel * title;
    BaseLabel * subtitle;
    
    BaseLabel * sxlabel;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addview];
    }
    return self;
}
- (void)addview{
    WS(ws);
    self.backgroundColor = [UIColor whiteColor];
    backimage = [UIImageView new];
    backimage.backgroundColor = RGB(238,238,238);
    backimage.layer.cornerRadius = LENGTH(5);
    backimage.layer.masksToBounds = YES;
    [ws addSubview:backimage];
    [backimage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws).with.insets(UIEdgeInsetsMake(LENGTH(5), LENGTH(10), LENGTH(5), LENGTH(10)));
        make.height.mas_equalTo(LENGTH(145));
    }];
    
    jpimageview = [UIImageView new];
    jpimageview.backgroundColor = RANDOMCOLOR;
    jpimageview.contentMode = UIViewContentModeScaleAspectFit;
    [backimage addSubview:jpimageview];
    [jpimageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->backimage).with.offset(LENGTH(20));
        make.top.mas_equalTo(self->backimage).with.offset(LENGTH(10));
        make.bottom.mas_equalTo(self->backimage).with.offset(-LENGTH(10));
        make.width.mas_equalTo(LENGTH(143));
    }];
    
    title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(3, 3, 3) LabelFont:TextFont(16) TextAlignment:NSTextAlignmentCenter Text:@"一等奖（一名）"];
    [backimage addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->jpimageview.mas_right).with.offset(LENGTH(0));
        make.right.mas_equalTo(self->backimage);
        make.top.mas_equalTo(self->backimage).with.offset(LENGTH(56));
    }];
    
    subtitle = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(3, 3, 3) LabelFont:TextFont(18) TextAlignment:NSTextAlignmentCenter Text:@"森海塞尔耳机"];
    [backimage addSubview:subtitle];
    [subtitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->jpimageview.mas_right).with.offset(LENGTH(0));
        make.right.mas_equalTo(self->backimage);
        make.top.mas_equalTo(self->title).with.offset(LENGTH(16));
    }];
    
    sxlabel = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(3, 3, 3) LabelFont:TextFont(21) TextAlignment:NSTextAlignmentCenter Text:@"失效"];
    sxlabel.backgroundColor = RGB(214, 214, 214);
    [backimage addSubview:sxlabel];
    [sxlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(LENGTH(70));
        make.height.mas_equalTo(LENGTH(30));
        make.top.mas_equalTo(LENGTH(6));
        make.right.mas_equalTo(-LENGTH(6));
    }];
    sxlabel.transform = CGAffineTransformMakeRotation(M_PI/8);
}

- (void)setModel:(TKPLModel *)model{
    _model = model;
    [jpimageview sd_setImageWithURL:URLIMAGE(model.prize_img)];
    title.text = [NSString stringWithFormat:@"%@等奖（%@名）",model.prize_rank,model.prize_num];
    AttributedStringModel * model1 = [AttributedStringModel new];
    model1.textString = title.text;
    model1.bianString = [NSString stringWithFormat:@"（%@名）",model.prize_num];
    model1.fount = 12;
    NSArray * modelarray = @[model1];
    NSMutableAttributedString *AttributedStr = [BaseObject Attributed:modelarray];
    title.attributedText = AttributedStr;
    
    subtitle.text = model.prize_name;
    
    if ([model.prize_status isEqualToString:@"0"]) {
        sxlabel.hidden = NO;
    }else{
        sxlabel.hidden = YES;
    }
}
@end
