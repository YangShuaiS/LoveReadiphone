//
//  HproverbView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/28.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "HproverbView.h"
#import "NBCmenuView.h"
#import "NHMingYanViewController.h"
@implementation HproverbView{
    NBCmenuView * navMenu;//
    UIImageView * backimage;
    BaseLabel * title;
    BaseLabel * time;

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
    navMenu = [NBCmenuView new];
//    navMenu.styles = NBCmenuViewStyleimage;
    navMenu.label.text = @"每日格言";
    [navMenu setBlock:^{
        [ws LookAll];
    }];
    [self addSubview:navMenu];
    [navMenu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(0);
        make.top.equalTo(ws).with.offset(LENGTH(0));
        make.right.equalTo(ws).with.offset(0);
    }];

    
    UIView * backview = [UIView new];
    backview.backgroundColor = RGB(255, 255, 255);
    backview.layer.shadowColor = RGB(171, 171, 171).CGColor;
    backview.layer.shadowOffset = CGSizeMake(0,1);//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
    backview.layer.shadowRadius = LENGTH(12);
    backview.layer.shadowOpacity = 0.18;
    backview.layer.cornerRadius = LENGTH(12);
    [self addSubview:backview];
    [backview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->navMenu.mas_bottom);
        make.left.mas_equalTo(ws).with.offset(LENGTH(20));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(20));
        make.bottom.mas_equalTo(ws).with.offset(-LENGTH(14));
    }];
    
    UIView * backview1 = [UIView new];
    backview1.layer.masksToBounds = YES;
    backview1.layer.cornerRadius = LENGTH(12);
    [backview addSubview:backview1];
    [backview1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(backview);
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
    
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(LookAll)];
    [self addGestureRecognizer:tap];
}

- (void)setItemArray:(NSMutableArray *)itemArray{
    _itemArray = itemArray;
    if (itemArray.count > 0) {
        NHProverbModel * model = _itemArray[0];
        NSCalendarUnit dayInfoUnits  = NSCalendarUnitEra | NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
        NSCalendar *gregorian = [[NSCalendar alloc]
                                 initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        model.timedate = [gregorian components:dayInfoUnits fromDate:[BaseObject TimeStringForDate:model.show_time]];
        [backimage sd_setImageWithURL:URLIMAGE(model.img)];
        title.text = model.content;
        time.text = [NSString stringWithFormat:@"%ld / %ld",model.timedate.month,model.timedate.day];
    }
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
//    self.layer.cornerRadius = LENGTH(12);
//    backimage.layer.cornerRadius = LENGTH(12);
//    imageview.layer.cornerRadius = LENGTH(12);

}

- (void)LookAll{
    NHMingYanViewController * vc = [NHMingYanViewController new];
    [[self viewController].navigationController pushViewController:vc animated:YES];
}
@end
