//
//  ArticleOneDownView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/3/26.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "ArticleOneDownView.h"
#import "ZhiShiShuShuViewController.h"
@implementation ArticleOneDownView{
    UIImageView * mlttj;//脉络图推荐
    UIView * backviews;
    BaseLabel * title;
    BaseLabel * subtitle;
    CAGradientLayer *gradient;

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
    gradient = [CAGradientLayer layer];
    WS(ws);
    BaseLabel * onetitle = [[BaseLabel alloc] initWithTxteColor:RGB(31,31,31) LabelFont:TextFontCu(14) TextAlignment:NSTextAlignmentLeft Text:@"脉络图推荐"];
    [self addSubview:onetitle];
    [onetitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws).with.offset(LENGTH(22));
        make.left.mas_equalTo(ws).with.offset(LENGTH(18));
    }];
    
    mlttj = [UIImageView new];
    mlttj.contentMode = UIViewContentModeScaleToFill;
    mlttj.layer.masksToBounds = YES;
    mlttj.layer.cornerRadius = LENGTH(5);
    [self addSubview:mlttj];
    [mlttj mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(onetitle.mas_bottom).with.offset(LENGTH(16));
        make.left.mas_equalTo(ws).with.offset(LENGTH(17));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(17));
        make.bottom.mas_equalTo(ws);
        make.height.mas_equalTo(LENGTH(110));
    }];
    
    mlttj.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(push)];
    [mlttj addGestureRecognizer:tap];
    
//    backviews = [UIView new];
//    [mlttj addSubview:backviews];
//    [backviews mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.and.right.and.bottom.mas_equalTo(self->mlttj);
//        make.height.mas_equalTo(LENGTH(66));
//    }];
//
//
//    title = [[BaseLabel alloc] initWithTxteColor:RGB(255, 255, 255) LabelFont:TextFontCu(16) TextAlignment:NSTextAlignmentLeft Text:@""];
//    [backviews addSubview:title];
//    [title mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.bottom.mas_equalTo(self->backviews).with.offset(-LENGTH(25));
//        make.left.mas_equalTo(self->backviews).with.offset(LENGTH(7));
//        make.right.mas_equalTo(self->backviews).with.offset(-LENGTH(7));
//    }];
//
//    subtitle = [[BaseLabel alloc] initWithTxteColor:RGB(255, 255, 255) LabelFont:TextFont(14) TextAlignment:NSTextAlignmentLeft Text:@""];
//    [backviews addSubview:subtitle];
//    [subtitle mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.bottom.mas_equalTo(self->backviews).with.offset(-LENGTH(4));
//        make.left.mas_equalTo(self->backviews).with.offset(LENGTH(7));
//        make.right.mas_equalTo(self->backviews).with.offset(-LENGTH(7));
//
//    }];
}
- (void)setModel:(LunBoTuXQModel *)model{
    _model = model;
    if (model.knowledgeGrade.count == 3) {
        knowledgeGradeModel * mo = model.knowledgeGrade[model.knowledgeGrade.count-1];
        [mlttj sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",ZSTX,mo.knowledge.knowledge_width_img]]];
//        [mlttj sd_setImageWithURL:URLIMAGE(mo.knowledge.knowledge_width_img)];
//        title.text = mo.knowledge.name;
//        subtitle.text = mo.knowledge.knowledge_info;
    }
}

- (void)setZhiShiSHUmodel:(ZhiShiShuModel *)ZhiShiSHUmodel{
    _ZhiShiSHUmodel = ZhiShiSHUmodel;
    
    if (ZhiShiSHUmodel.data.knowledgeGrade.count == 3) {
        knowledgeGradeModel * mo = ZhiShiSHUmodel.data.knowledgeGrade[ZhiShiSHUmodel.data.knowledgeGrade.count-1];
        [mlttj sd_setImageWithURL:URLIMAGE(mo.knowledge.knowledge_width_img)];
        title.text = mo.knowledge.name;
        subtitle.text = mo.knowledge.knowledge_info;
    }
}
- (void)push{
    knowledgeGradeModel *knowmodel ;
    NSInteger inter;
    if (_model==nil) {
        knowmodel = _ZhiShiSHUmodel.data.knowledgeGrade[_ZhiShiSHUmodel.data.knowledgeGrade.count-1];
        inter = _ZhiShiSHUmodel.data.knowledgeGrade.count;
    }
    if (_ZhiShiSHUmodel==nil) {
        knowmodel = _model.knowledgeGrade[_model.knowledgeGrade.count-1];
        inter = _model.knowledgeGrade.count;
    }
    ZhiShiShuShuViewController * vc = [ZhiShiShuShuViewController new];
    vc.itemid =knowmodel.knowledge._id;
    [[self viewController].navigationController pushViewController:vc animated:YES];
}
- (void)layoutSubviews{
    [super layoutSubviews];
    [backviews layoutIfNeeded];
    gradient.frame = backviews.bounds;
    //    gradient.colors = @[(id)RGBA(0, 0, 0, 1),RGBA(0, 0, 0, 0)];
    UIColor * color1 = RGBA(3, 0, 0, 0.5);
    UIColor * color2 = RGBA(0, 0, 0, 0);
    gradient.colors = @[(id)color2.CGColor,(id)color1.CGColor];
    gradient.locations = @[@0, @1];
    gradient.startPoint = CGPointMake(0.5, 0);
    gradient.endPoint = CGPointMake(0.5, 1);
    [backviews.layer addSublayer:gradient];
    [backviews addSubview:title];
    [backviews addSubview:subtitle];
    
}
@end
