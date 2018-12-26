//
//  HTWeekProCollectionViewCell.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/1.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "HTWeekProCollectionViewCell.h"
#import "SZSCViewController.h"
#import "HTShareViewController.h"
@implementation HTWeekProCollectionViewCell{
    UIImageView * kuang;
    BaseLabel * title;
    BaseButton * button;
//    UITapGestureRecognizer * sztap;
//    UITapGestureRecognizer * sctap;
//    UITapGestureRecognizer * fxtap;

}
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}
- (void)szclick{
    if (_indexPath.section == 0 && _indexPath.row == 0) {

    if ([[self viewController].navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        [self viewController].navigationController.interactivePopGestureRecognizer.enabled = NO;
    }

    SZSCViewController * vc = [SZSCViewController new];
    vc.titles = @"识字量检测";
    [[self viewController].navigationController pushViewController:vc animated:YES];
    }
}

- (void)scclick{
    if (_indexPath.section == 0 && _indexPath.row == 1) {

    if ([[self viewController].navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        [self viewController].navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
    SZSCViewController * vc = [SZSCViewController new];
    vc.titles = @"识词量检测";
    [[self viewController].navigationController pushViewController:vc animated:YES];
    }
}

- (void)fxlick{
    if (_indexPath.section > 0 && _indexPath.row == 1){
    HTShareViewController * vc = [HTShareViewController new];
    [[self viewController].navigationController pushViewController:vc animated:YES];
    }
}
-(void)setupUI{
    WS(ws);

    kuang = [UIImageView new];
    kuang.layer.borderWidth = 1;
    kuang.layer.borderColor = RGB(87,173,172).CGColor;
    kuang.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:kuang];
    [kuang mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(ws);
        make.width.and.height.mas_equalTo(LENGTH(16));
        make.left.mas_lessThanOrEqualTo(ws);
    }];
    title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGBA(0, 0, 0, 0.3) LabelFont:TextFont(13) TextAlignment:NSTextAlignmentLeft Text:@"阅读完成2本书（+110分）"];
    [self addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->kuang.mas_right).with.offset(LENGTH(10));
        make.centerY.mas_equalTo(ws);
        make.right.mas_equalTo(ws).with.offset(-LENGTH(2));
    }];
    self.userInteractionEnabled = YES;
    button = [BaseButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self action:@selector(oneButton:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
    
}
- (void)oneButton:(BaseButton *)button{
    if (_indexPath.section == 0 && _indexPath.row == 0) {
        [self szclick];
    }else if (_indexPath.section == 0 && _indexPath.row == 1){
        [self scclick];
    }else if (_indexPath.section > 0 && _indexPath.row == 0){
        
    }else if (_indexPath.section > 0 && _indexPath.row == 1){
        [self fxlick];
    }
}
- (void)setModel:(NHTimeListModel *)model{
    _model = model;
//    [self remotap];
    title.text = model.name;
    if (_indexPath.section == 0 && _indexPath.row == 0) {
        [self addxiahuaxian];

        if ([model.literacy_is_completed isEqualToString:@"0"]) {
            kuang.image = UIIMAGE(@"");
        }else{
            kuang.image = UIIMAGE(@"勾");
        }
    }else if (_indexPath.section == 0 && _indexPath.row == 1){
        [self addxiahuaxian];

        if ([model.glossary_is_completed isEqualToString:@"0"]) {
            kuang.image = UIIMAGE(@"");
        }else{
            kuang.image = UIIMAGE(@"勾");
        }
    }else if (_indexPath.section > 0 && _indexPath.row == 0){
        
        if ([model.book_is_completed isEqualToString:@"0"]) {
            kuang.image = UIIMAGE(@"");
        }else{
            kuang.image = UIIMAGE(@"勾");
        }
    }else if (_indexPath.section > 0 && _indexPath.row == 1){
        [self addxiahuaxian];
        if ([model.share_is_completed isEqualToString:@"0"]) {
            kuang.image = UIIMAGE(@"");
        }else{
            kuang.image = UIIMAGE(@"勾");
        }
    }
}

- (void)addxiahuaxian{
    NSDictionary *attribtDic = @{NSUnderlineStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
    NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:title.text attributes:attribtDic];
    //赋值
    title.attributedText = attribtStr;
}

- (void)remotap{
//    [kuang removeGestureRecognizer:sztap];
//    [kuang removeGestureRecognizer:sctap];
//    [kuang removeGestureRecognizer:fxtap];

}
@end
