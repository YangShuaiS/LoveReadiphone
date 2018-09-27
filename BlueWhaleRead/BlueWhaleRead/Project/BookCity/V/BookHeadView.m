

//
//  BookHeadView.m
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/5/4.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BookHeadView.h"
#import "LeiDaTuOnlyUser.h"
#import "AchievementReportViewController.h"
@implementation BookHeadView{
    BaseLabel * title;
    ElementItem *item1;
    LeiDaTuOnlyUser *radar;
    BaseLabel * ZJJY;
    BaseButton * xq;
    
    BaseLabel*titleDown;
}

-(instancetype)init{
    self = [super init];
    if (self) {
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    self.backgroundColor = RGB(255, 255, 255);
    WS(ws);
    item1 = [[ElementItem alloc]init];
    item1.itemPercent = @[@"0",@"0",@"0",@"0",@"0",@"0"];
    item1.itemColor = RGBA(60, 91, 170, 0.5);
    //    item1.itemName = @"基础综合";
    radar = [[LeiDaTuOnlyUser alloc]initWithRadarElements:@[@"",@"",@"",@"",@"",@""] lengthColor:[UIColor colorWithRed:197/255.0 green:197/255.0 blue:197/255.0 alpha:1]];
    [radar addAbilitysWithElements:@[item1]];
    radar.backgroundColor = [UIColor clearColor];
    [self addSubview:radar];

    [radar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(LENGTH(42));
        make.centerY.mas_equalTo(ws.mas_centerY);
//        make.top.equalTo(ws).with.offset(LENGTH(20));
        make.width.mas_equalTo(LENGTH(148));
        make.height.mas_offset(LENGTH(148));
    }];
    
    ZJJY = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(4,51,50) LabelFont:TextFont(LENGTH(20)) TextAlignment:NSTextAlignmentLeft Text:@""];
    [self addSubview:ZJJY];
    [ZJJY mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->radar.mas_right).with.offset(LENGTH(22));
        make.top.equalTo(self->radar.mas_top).with.offset(LENGTH(14));
//        make.right.equalTo(ws.mas_right).with.offset(-LENGTH(30));
    }];
    
    //
    title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(19) TextAlignment:NSTextAlignmentLeft Text:@""];
    title.numberOfLines = 0;
    [self addSubview:title];
    
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->radar.mas_right).with.offset(LENGTH(22));
        make.top.equalTo(self->ZJJY.mas_bottom).with.offset(LENGTH(30));
        make.right.equalTo(ws.mas_right).with.offset(-LENGTH(30));
    }];
    
    titleDown = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(50,73,73) LabelFont:TextFontCu(20) TextAlignment:NSTextAlignmentLeft Text:@""];
    [self addSubview:titleDown];
 
    
    xq = [BaseButton buttonWithType:UIButtonTypeCustom];
    [xq addTarget:self action:@selector(XiangQing) forControlEvents:UIControlEventTouchUpInside];
    [xq setTitle:@"查看详情" forState:UIControlStateNormal];
    [xq setTitleColor:RGB(90, 196, 192) forState:UIControlStateNormal];
    xq.titleLabel.font = TextFont(Font16);
    [self addSubview:xq];
    

    
    [xq mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self->ZJJY.mas_centerY);
        make.right.equalTo(ws.mas_right).with.offset(-LENGTH(30));
    }];
    
    [titleDown mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self->xq.mas_left).with.offset(-LENGTH(22));
        make.top.equalTo(self->xq.mas_top).with.offset(0);
        //        make.right.equalTo(ws.mas_right).with.offset(-LENGTH(30));
    }];

}

- (void)XiangQing{
    AchievementReportViewController * vc = [AchievementReportViewController new];
    [self.nav pushViewController:vc animated:YES];
}
- (void)setReadBalance:(CityTopBiaoreadBalanceModel *)readBalance{
    _readBalance = readBalance;
    [radar removeFromSuperview];
    NSMutableArray * Percent = [NSMutableArray array];
    NSMutableArray * Elements = [NSMutableArray array];
    for (AchiemyBalanceModel * m in readBalance.studentBalance) {
        [Percent addObject:[NSString stringWithFormat:@"%@",m.balance]];
        [Elements addObject:m.catalog_name];
    }
    
    item1 = [[ElementItem alloc]init];
    item1.itemPercent = (NSArray *)Percent;
    item1.itemColor = RGBA(60, 91, 170, 0.5);
    //    item1.itemName = @"基础综合";
    radar = [[LeiDaTuOnlyUser alloc]initWithRadarElements:(NSArray *)Elements lengthColor:[UIColor colorWithRed:168.0/255.0 green:168.0/255.0 blue:168.0/255.0 alpha:1]];
    [radar addAbilitysWithElements:@[item1]];
    radar.backgroundColor = [UIColor clearColor];
    [self addSubview:radar];
    
    WS(ws);
    [radar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(LENGTH(42));
        make.centerY.mas_equalTo(ws.mas_centerY);
        //        make.top.equalTo(ws).with.offset(LENGTH(20));
        make.width.mas_equalTo(LENGTH(148));
        make.height.mas_offset(LENGTH(148));
    }];
    
    [ZJJY mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->radar.mas_right).with.offset(LENGTH(22));
        make.top.equalTo(self->radar.mas_top).with.offset(LENGTH(14));
        make.right.equalTo(ws.mas_right).with.offset(-LENGTH(30));
    }];
    
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->radar.mas_right).with.offset(LENGTH(22));
        make.top.equalTo(self->ZJJY.mas_bottom).with.offset(LENGTH(10));
        make.right.equalTo(ws.mas_right).with.offset(-LENGTH(10));
        make.bottom.mas_equalTo(ws.mas_bottom).with.offset(-LENGTH(10));
    }];
    
    [xq mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self->ZJJY.mas_centerY);
        make.right.equalTo(ws.mas_right).with.offset(-LENGTH(30));
    }];
    AchieuserReadInfoModel * one = readBalance.userReadInfo[0];
    AchieuserReadInfoModel * two = readBalance.userReadInfo[1];
    AchieuserReadInfoModel * three = readBalance.userReadInfo[2];
    AchieuserReadInfoModel * four = readBalance.userReadInfo[3];
    AchieuserReadInfoModel * five = readBalance.userReadInfo[4];
    
    NSString * onenum = [NSString stringWithFormat:@"%@本",one.catalogNum];
    NSString * twonum = [NSString stringWithFormat:@"%@本",two.catalogNum];
    NSString * threenum = [NSString stringWithFormat:@"%@本",three.catalogNum];
    NSString * fournum = [NSString stringWithFormat:@"%@本",four.catalogNum];
    NSString * fivenum = [NSString stringWithFormat:@"%@本",five.catalogNum];
    if (_readBalance.is_balance == 0) {
        NSString * zt = @"不均衡";
        NSString * titdown = [NSString stringWithFormat:@"%@同学阅读均衡指标为“%@”",Me.name,zt];
        AttributedStringModel * model = [AttributedStringModel new];
        model.textString = titdown;
        model.bianString = zt;
        model.color = RGB(242,95,75);
        NSArray * modelarray = @[model];
        NSMutableAttributedString *AttributedStr = [BaseObject Attributed:modelarray];
        titleDown.attributedText = AttributedStr;
        
        
        NSString * all =[NSString stringWithFormat:@"目前所属级别为 %@ 级，该生完成了 %@ 级阅读范围内%@和%@两个方向的书籍阅读。建议指导学生再多读%@类、%@类和%@的图书。该生目前阅读书籍情况如下：\n\n%@类:%@本     %@类:%@本     %@类:%@本\n%@类:%@本        %@类:%@本",_readBalance.myLevel,_readBalance.myLevel,one.catalogName,two.catalogName,three.catalogName,four.catalogName,five.catalogName,one.catalogName,one.catalogNum,two.catalogName,two.catalogNum,three.catalogName,three.catalogNum,four.catalogName,four.catalogNum,five.catalogName,five.catalogNum];
        
        AttributedStringModel * onemodel = [AttributedStringModel new];
        onemodel.textString = all;
        onemodel.bianString = onenum;
        onemodel.color = RGB(90,196,192);
        
        AttributedStringModel * twomodel = [AttributedStringModel new];
        twomodel.textString = all;
        twomodel.bianString = twonum;
        twomodel.color = RGB(90,196,192);
        
        AttributedStringModel * threemodel = [AttributedStringModel new];
        threemodel.textString = all;
        threemodel.bianString = threenum;
        threemodel.color = RGB(90,196,192);
        
        AttributedStringModel * fourmodel = [AttributedStringModel new];
        fourmodel.textString = all;
        fourmodel.bianString = fournum;
        fourmodel.color = RGB(90,196,192);
        
        AttributedStringModel * fivemodel = [AttributedStringModel new];
        fivemodel.textString = all;
        fivemodel.bianString = fivenum;
        fivemodel.color = RGB(90,196,192);
        NSArray * downmodelarray = @[onemodel,twomodel,threemodel,fourmodel,fivemodel];
        NSMutableAttributedString *AttributedStrsu = [BaseObject Attributed:downmodelarray];
        title.attributedText = AttributedStrsu;
        
        //        subtitle.text = [NSString stringWithFormat:@"%@同学阅读均衡指标为“不均衡”\n目前所属级别为%@级,该学生完成了%@级阅读范围内%@和%@两个方向的书籍阅读。建议指导学生再多读%@类,%@类和%@类的图书。该生目前阅读书籍情况如下:\n%@类:%@本\n%@类:%@本\n%@类:%@本\n%@类:%@本\n%@类:%@本",Me.name,_readBalance.myLevel,_readBalance.myLevel,one.catalogName,two.catalogName,three.catalogName,four.catalogName,five.catalogName,one.catalogName,one.catalogNum,two.catalogName,two.catalogNum,three.catalogName,three.catalogNum,four.catalogName,four.catalogNum,five.catalogName,five.catalogNum];
    }else{
        NSString * zt = @"均衡";
        NSString * titdown = [NSString stringWithFormat:@"%@同学阅读均衡指标为“%@”",Me.name,zt];
        AttributedStringModel * model = [AttributedStringModel new];
        model.textString = titdown;
        model.bianString = zt;
        model.color = RGB(90,196,192);
        NSArray * modelarray = @[model];
        NSMutableAttributedString *AttributedStr = [BaseObject Attributed:modelarray];
        titleDown.attributedText = AttributedStr;
        
        
        NSString * all =[NSString stringWithFormat:@"目前所属级别为 %@ 级，该生完成了 %@ 级阅读范围内书籍：其中\n\n%@类:%@本     %@类:%@本     %@类:%@本\n%@类:%@本        %@类:%@本",_readBalance.myLevel,_readBalance.myLevel,one.catalogName,one.catalogNum,two.catalogName,two.catalogNum,three.catalogName,three.catalogNum,four.catalogName,four.catalogNum,five.catalogName,five.catalogNum];
        
        AttributedStringModel * onemodel = [AttributedStringModel new];
        onemodel.textString = all;
        onemodel.bianString = onenum;
        onemodel.color = RGB(90,196,192);
        
        AttributedStringModel * twomodel = [AttributedStringModel new];
        twomodel.textString = all;
        twomodel.bianString = twonum;
        twomodel.color = RGB(90,196,192);
        
        AttributedStringModel * threemodel = [AttributedStringModel new];
        threemodel.textString = all;
        threemodel.bianString = threenum;
        threemodel.color = RGB(90,196,192);
        
        AttributedStringModel * fourmodel = [AttributedStringModel new];
        fourmodel.textString = all;
        fourmodel.bianString = fournum;
        fourmodel.color = RGB(90,196,192);
        
        AttributedStringModel * fivemodel = [AttributedStringModel new];
        fivemodel.textString = all;
        fivemodel.bianString = fivenum;
        fivemodel.color = RGB(90,196,192);
        NSArray * downmodelarray = @[onemodel,twomodel,threemodel,fourmodel,fivemodel];
        NSMutableAttributedString *AttributedStrsu = [BaseObject Attributed:downmodelarray];
        title.attributedText = AttributedStrsu;
        
        
        //        subtitle.text = [NSString stringWithFormat:@"%@同学阅读均衡指标为“均衡”\n目前所属级别为%@级,该学生完成了%@级阅读范围内书籍.其中:\n%@类:%@本\n%@类:%@本\n%@类:%@本\n%@类:%@本\n%@类:%@本",Me.name,_readBalance.myLevel,_readBalance.myLevel,one.catalogName,one.catalogNum,two.catalogName,two.catalogNum,three.catalogName,three.catalogNum,four.catalogName,four.catalogNum,five.catalogName,five.catalogNum];
    }}

@end
