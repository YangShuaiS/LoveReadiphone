//
//  ShouCangTableViewCell.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/4/14.
//  Copyright © 2019 YS. All rights reserved.
//

#import "ShouCangTableViewCell.h"

@implementation ShouCangTableViewCell{
    UIView * backview;
    UIImageView * backimage;
    BaseLabel * title;
    BaseLabel * time;
    UIView * leftview;
    UIImageView * dgbj;
    FLAnimatedImageView * dg;
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
    
    leftview = [UIView new];
    [self.contentView addSubview:leftview];
    
    dgbj = [UIImageView new];
    dgbj.layer.cornerRadius = LENGTH(3);
    dgbj.layer.borderColor = RGBA(0, 0, 0,0.2).CGColor;
    dgbj.layer.borderWidth = 1;
    dgbj.layer.backgroundColor = RGBA(255, 255, 255,1).CGColor;
    [leftview addSubview:dgbj];
    [dgbj mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self->leftview);
        make.right.mas_equalTo(self->leftview);
        make.size.mas_equalTo(CGSizeMake(LENGTH(15), LENGTH(15)));
    }];
    _imageviewleft = dgbj;

    dg = [FLAnimatedImageView new];
    dg.contentMode = UIViewContentModeScaleAspectFit;
    [dgbj addSubview:dg];
    [dg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self->dgbj);
        make.left.mas_equalTo(self->dgbj).with.offset(LENGTH(3));
        make.right.mas_equalTo(self->dgbj).with.offset(-LENGTH(3));
    }];


    
    backview = [UIView new];
    backview.backgroundColor = RGB(255, 255, 255);
    backview.layer.shadowColor = RGB(171, 171, 171).CGColor;
    backview.layer.shadowOffset = CGSizeMake(0,1);//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
    backview.layer.shadowRadius = LENGTH(12);
    backview.layer.shadowOpacity = 0.18;
    backview.layer.cornerRadius = LENGTH(12);
    [self.contentView addSubview:backview];
    
    [leftview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).with.offset(-LENGTH(38));
        make.centerY.mas_equalTo(ws);
        make.height.mas_equalTo(self->backview);
        make.width.mas_equalTo(LENGTH(38));
    }];
    
    [backview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws.contentView).with.offset(LENGTH(12));
        make.left.mas_equalTo(self->leftview.mas_right).with.offset(LENGTH(20));
//        make.left.mas_equalTo(ws.contentView).with.offset(LENGTH(20));

        make.right.mas_equalTo(ws.contentView).with.offset(-LENGTH(20));
        make.bottom.mas_equalTo(ws.contentView).with.offset(-LENGTH(12));
    }];
    
    UIView * backview1 = [UIView new];
    backview1.layer.masksToBounds = YES;
    backview1.layer.cornerRadius = LENGTH(12);
    [backview addSubview:backview1];
    [backview1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self->backview);
    }];
    
    backimage = [UIImageView new];
    backimage.contentMode = UIViewContentModeScaleAspectFill;
    backimage.layer.masksToBounds = YES;
    backimage.backgroundColor = RGB(155, 155, 155);
    [backview1 addSubview:backimage];
    [backimage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.bottom.and.left.mas_equalTo(backview1);
        make.size.mas_equalTo(CGSizeMake(LENGTH(91), LENGTH(88)));
    }];
    
    UIView * v = [UIView new];
    v.backgroundColor = RGBA(0, 0, 0, 0.3);
    [backimage addSubview:v];
    [v mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self->backview);
    }];
    
    
    time = [[BaseLabel alloc] initWithTxteColor:RGB(255, 255, 255) LabelFont:TextFontCu(18) TextAlignment:NSTextAlignmentCenter Text:@""];
    [backimage addSubview:time];
    [time mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self->backimage);
    }];
    
    title = [[BaseLabel alloc] initWithTxteColor:RGB(3, 3, 3) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentLeft Text:@""];
    title.numberOfLines = 2;
    [backview1 addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(backview1);
        make.left.mas_equalTo(self->backimage.mas_right).with.offset(LENGTH(16));
        make.right.mas_equalTo(backview1).with.offset(-LENGTH(16));
    }];
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setModel:(NHProverbModel *)model{
    _model = model;
    [backimage sd_setImageWithURL:URLIMAGE(model.img)];
    title.text = model.content;
    time.text = [NSString stringWithFormat:@"%ld / %ld",model.timedate.month,model.timedate.day];
    if (model.clicksatatus == 1) {
        dg.image = UIIMAGE(@"全选");
    }else{
        dg.image = UIIMAGE(@"");
        
    }
}

- (void)setXuanzhong:(NSInteger)xuanzhong{
    _xuanzhong = xuanzhong;

}

-(void)setEditing:(BOOL)editing animated:(BOOL)animated{
    [super setEditing:editing animated:animated];

//    [UIView animateWithDuration:0.5 animations:^{
//
//        [self layoutIfNeeded];
//    }];
    WS(ws);

    if (editing) {
        [UIView animateWithDuration:0.5 animations:^{
            [self->backview mas_updateConstraints:^(MASConstraintMaker *make) {
                make.right.mas_equalTo(ws.contentView).with.offset(LENGTH(38));
            }];
            [self layoutIfNeeded];
        }];
    }else{

        [UIView animateWithDuration:0.5 animations:^{
            [self->backview mas_updateConstraints:^(MASConstraintMaker *make) {
                make.right.mas_equalTo(ws.contentView).with.offset(-LENGTH(20));
            }];
            [self layoutIfNeeded];
        }];
    }
}
@end
