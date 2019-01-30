//
//  HTaskWeekView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/1/10.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "HTaskWeekView.h"
#import "SZSCViewController.h"
#import "HTShareViewController.h"
#import "BookCityViewController.h"
@implementation HTaskWeekView{
    UIImageView * leftimageview;
    BaseLabel * title;
    BaseLabel * subtitle;
    BaseLabel * ztlabel;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addView];
    }
    return self;
}
- (void)addView{
    WS(ws);
    self.backgroundColor = [UIColor clearColor];
    leftimageview = [UIImageView new];
    leftimageview.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:leftimageview];
    [leftimageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws).with.offset(LENGTH(15));
        make.bottom.mas_equalTo(ws).with.offset(-LENGTH(15));
        make.left.mas_equalTo(ws).with.offset(LENGTH(20));
    }];
    
    title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(51,51,51) LabelFont:TextFontCu(16) TextAlignment:NSTextAlignmentLeft Text:@""];
    [self addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->leftimageview.mas_top).with.offset(LENGTH(4));
        make.left.mas_equalTo(self->leftimageview.mas_right).with.offset(LENGTH(18));
    }];
    
    subtitle = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(173,173,173) LabelFont:TextFont(11) TextAlignment:NSTextAlignmentLeft Text:@""];
    [self addSubview:subtitle];
    [subtitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->title.mas_bottom).with.offset(LENGTH(5));
        make.left.mas_equalTo(self->leftimageview.mas_right).with.offset(LENGTH(18));
    }];
    
    ztlabel = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(204,204,204) LabelFont:TextFont(14) TextAlignment:NSTextAlignmentCenter Text:@""];
    ztlabel.layer.masksToBounds  = YES;
    ztlabel.layer.cornerRadius = LENGTH(15);
    ztlabel.layer.borderWidth = 1;
    ztlabel.layer.borderColor = RGB(204,204,204).CGColor;
    [self addSubview:ztlabel];
    [ztlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(ws);
        make.right.mas_equalTo(ws).with.offset(-LENGTH(15));
        make.width.mas_equalTo(LENGTH(70));
        make.height.mas_equalTo(LENGTH(30));
    }];
    
    ztlabel.userInteractionEnabled = YES;
    UITapGestureRecognizer * cilic = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click)];
    //将手势添加到需要相应的view中去
    [ztlabel addGestureRecognizer:cilic];
}
- (void)setModel:(NHTimeListModel *)model{
    _model = model;
    if (model.types == 1) {
        leftimageview.image = UIIMAGE(@"书");
        subtitle.text = [NSString stringWithFormat:@"完成%@/%@",model.week_book_num,model.allweek_book_num];
        AttributedStringModel * model2 = [AttributedStringModel new];
        model2.textString = subtitle.text;
        model2.bianString = [NSString stringWithFormat:@"%@",model.week_book_num];
        model2.color = _colorarray[0];
        NSArray * modelarray = @[model2];
        NSMutableAttributedString *AttributedStr = [BaseObject Attributed:modelarray];
        subtitle.attributedText = AttributedStr;
        
        ztlabel.text = @"去读书";
    }else if (model.types == 2){
        leftimageview.image = UIIMAGE(@"分享");
        subtitle.text = [NSString stringWithFormat:@"完成%@/%@",model.week_share_num,model.allweek_share_num];
        AttributedStringModel * model2 = [AttributedStringModel new];
        model2.textString = subtitle.text;
        model2.bianString = [NSString stringWithFormat:@"%@",model.week_share_num];
        model2.color = _colorarray[0];
        NSArray * modelarray = @[model2];
        NSMutableAttributedString *AttributedStr = [BaseObject Attributed:modelarray];
        subtitle.attributedText = AttributedStr;
        
        ztlabel.text = @"去分享";
    }else if (model.types == 3){
        leftimageview.image = UIIMAGE(@"识字量");
        ztlabel.text = @"去测试";
        subtitle.text = [NSString stringWithFormat:@"完成%@/1",model.literacy_is_completed];
        AttributedStringModel * model2 = [AttributedStringModel new];
        model2.textString = subtitle.text;
        model2.bianString = [NSString stringWithFormat:@"%@",model.literacy_is_completed];
        model2.color = _colorarray[0];
        NSArray * modelarray = @[model2];
        NSMutableAttributedString *AttributedStr = [BaseObject Attributed:modelarray];
        subtitle.attributedText = AttributedStr;

    }else if (model.types == 4){
        leftimageview.image = UIIMAGE(@"识词量");
        ztlabel.text = @"去测试";
        subtitle.text = [NSString stringWithFormat:@"完成%@/1",model.glossary_is_completed];
        AttributedStringModel * model2 = [AttributedStringModel new];
        model2.textString = subtitle.text;
        model2.bianString = [NSString stringWithFormat:@"%@",model.glossary_is_completed];
        model2.color = _colorarray[0];
        NSArray * modelarray = @[model2];
        NSMutableAttributedString *AttributedStr = [BaseObject Attributed:modelarray];
        subtitle.attributedText = AttributedStr;
    }
    
    title.text = [NSString stringWithFormat:@"%@ +%@分",model.name,model.book_Score];
    AttributedStringModel * model1 = [AttributedStringModel new];
    model1.textString = title.text;
    model1.bianString = [NSString stringWithFormat:@"+%@分",model.book_Score];
    model1.fount = 12;
    model1.color = _colorarray[0];
    NSArray * modelarray = @[model1];
    NSMutableAttributedString *AttributedStr = [BaseObject Attributed:modelarray];
    title.attributedText = AttributedStr;
    
    ztlabel.textColor = _colorarray[0];
    UIColor * color = _colorarray[0];
    ztlabel.layer.borderColor = color.CGColor;
    ztlabel.userInteractionEnabled = YES;
    if (model.completed >=1) {
        ztlabel.text = @"已完成";
        ztlabel.textColor = RGB(204,204,204);
        ztlabel.layer.borderColor = RGB(204,204,204).CGColor;
        ztlabel.userInteractionEnabled = NO;
    }else{
        if (_frien == 1 || _ing == 0) {
            ztlabel.textColor = RGB(204,204,204);
            ztlabel.layer.borderColor = RGB(204,204,204).CGColor;
            ztlabel.userInteractionEnabled = NO;
        }else{
            ztlabel.userInteractionEnabled = YES;

        }
    }
    
    if (_noweek == 1) {
        ztlabel.textColor = RGB(204,204,204);
        ztlabel.layer.borderColor = RGB(204,204,204).CGColor;
        ztlabel.userInteractionEnabled = NO;
    }
}
- (void)click{
    if (_model.types == 1) {
        BookCityViewController * vc = [BookCityViewController new];
        NSIndexPath * indpath = [NSIndexPath indexPathForRow:0 inSection:0];
        vc.inpath = indpath;
        vc.cata = [NSString stringWithFormat:@"100"];
        [[self viewController].navigationController pushViewController:vc animated:YES];
    }else if (_model.types == 2){
        HTShareViewController * vc = [HTShareViewController new];
        [[self viewController].navigationController pushViewController:vc animated:YES];
    }else if (_model.types == 3){
        if ([[self viewController].navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
            [self viewController].navigationController.interactivePopGestureRecognizer.enabled = NO;
        }
        SZSCViewController * vc = [SZSCViewController new];
        vc.titles = @"识字量检测";
        [[self viewController].navigationController pushViewController:vc animated:YES];
    }else if (_model.types == 4){
        if ([[self viewController].navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
            [self viewController].navigationController.interactivePopGestureRecognizer.enabled = NO;
        }
        SZSCViewController * vc = [SZSCViewController new];
        vc.titles = @"识词量检测";
        [[self viewController].navigationController pushViewController:vc animated:YES];
    }
}
@end
