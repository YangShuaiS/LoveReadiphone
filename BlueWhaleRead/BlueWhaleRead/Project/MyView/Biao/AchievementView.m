

//
//  AchievementView.m
//  BoWanJuanForPad
//
//  Created by 杨帅 on 2018/5/29.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "AchievementView.h"
#import "LeiDaTuOnlyUser.h"
#import "HistogramView.h"
#import "XianKuangView.h"
@interface AchievementView()

@end
@implementation AchievementView{
    BaseLabel * title;
    BaseLabel * subtitle;
    BaseLabel * titleDown;
}
-(instancetype)init{
    self = [super init];
    if (self) {
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    WS(ws);
    self.backgroundColor = RGB(255, 255, 255);
    title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(18,41,41) LabelFont:TextFont(20) TextAlignment:NSTextAlignmentCenter Text:@""];
    [self addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(LENGTH(15));
        make.left.equalTo(ws).with.offset(0);
        make.right.equalTo(ws).with.offset(0);
    }];
    
    titleDown = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(50,73,73) LabelFont:TextFont(18) TextAlignment:NSTextAlignmentCenter Text:@""];
    [self addSubview:titleDown];
    

    subtitle = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(50,73,73) LabelFont:TextFont(16) TextAlignment:NSTextAlignmentLeft Text:@""];
    subtitle.numberOfLines = 0;
    [self addSubview:subtitle]; 

}

- (void)addImaeView:(NSString *)string{
    WS(ws);
    FLAnimatedImageView* imageView = [FLAnimatedImageView new];
    imageView.image = UIIMAGE(string);
    [self addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->title.mas_bottom).with.offset(LENGTH(24));
        make.centerX.mas_equalTo(ws);
        make.bottom.mas_equalTo(ws).with.offset(-LENGTH(32));
//        make.width.mas_equalTo(LENGTH(270));
//        make.height.mas_offset(LENGTH(300));
    }];
}
- (void)setName:(NSString *)name{
    _name = name;
    title.text = name;
    
    switch (_style) {
        case ChartStyleRadar:
            if (_myReadNum >=5) {
                [self addRadar];
            }else{
                [self addImaeView:@"icon_缺省页图标1"];
            }
            break;
        case ChartStyleRadarNengLi:
            if (_myReadNum >=5) {
                [self addRadarNengLi];
            }else{
                [self addImaeView:@"icon_缺省页图标1"];
            }
            break;
        case ChartStyleYueDuLiang:
            if (_myReadNum >=5) {
                [self addYueDuLiang];
            }else{
                [self addImaeView:@"icon_缺省页图标2"];

            }
            break;
        case ChartStyleSHIZI:
            if (_literacyNum >=5) {
                [self addShiZi];
            }else{
                [self addImaeView:@"icon_缺省页图标2"];

            }
            break;
        case ChartStyleSHICI:
            if (_glossaryNum >=5) {
                [self addShiZC];
            }else{
                [self addImaeView:@"icon_缺省页图标2"];

            }
            break;
        case ChartStyleBarCharts:
            [self addBarCharts];
            break;
        case ChartStyleBarLine:
            [self addCaeLine];
            break;
        default:
            break;
    }
}
- (NSMutableArray *)bubbleDescendingOrderSortWithArray:(NSMutableArray *)descendingArr
{
    for (int i = 0; i < descendingArr.count; i++) {
        for (int j = 0; j < descendingArr.count - 1 - i; j++) {
            AchieuserReadInfoModel * model1 = descendingArr[j];
            AchieuserReadInfoModel * model2 = descendingArr[j+1];

            if ([model1.catalogNum integerValue] < [model2.catalogNum integerValue]) {
                descendingArr[j] = descendingArr[j + 1];
                descendingArr[j + 1] = model1;
            }
        }
    }
    return descendingArr;
}
#pragma mark ------------ 雷达图
- (void)addRadar{
    WS(ws);
    NSMutableArray * itemtile = [NSMutableArray array];
    NSMutableArray * gerenitem = [NSMutableArray array];
    NSMutableArray * banjiitem = [NSMutableArray array];

    for (AchiemyBalanceModel * model in _readBalance.myBalance) {
        [itemtile addObject:model.catalog_name];
        [gerenitem addObject:model.balance];
//        [gerenitem addObject:@"0.5"];
    }
    [banjiitem addObject:_readBalance.classBalance.catalog1];
    [banjiitem addObject:_readBalance.classBalance.catalog2];
    [banjiitem addObject:_readBalance.classBalance.catalog3];
    [banjiitem addObject:_readBalance.classBalance.catalog4];
    [banjiitem addObject:_readBalance.classBalance.catalog5];

    ElementItem *item1 = [[ElementItem alloc]init];
    item1.itemName = @"个人数值";
    item1.itemPercent = gerenitem;
    item1.itemColor = RGBA(60, 91, 170, 0.5);
    
    ElementItem *item2 = [[ElementItem alloc]init];
    item2.itemName = @"班级均值";
    item2.itemPercent = banjiitem;
    item2.itemColor = RGBA(231, 133, 62, 0.5);
    
    LeiDaTuOnlyUser *radar = [[LeiDaTuOnlyUser alloc]initWithRadarElements:itemtile lengthColor:[UIColor colorWithRed:197/255.0 green:197/255.0 blue:197/255.0 alpha:1]];
    [radar addAbilitysWithElements:@[item1,item2]];
    radar.downts = YES;
    radar.backgroundColor = [UIColor clearColor];
    [self addSubview:radar];
    
    [radar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->title.mas_bottom).with.offset(LENGTH(10));
//        make.left.mas_equalTo(ws).with.offset(LENGTH(5));
//        make.right.mas_equalTo(ws).with.offset(LENGTH(5));

        make.centerX.mas_equalTo(ws);
        make.width.mas_equalTo(LENGTH(270));
        make.height.mas_offset(LENGTH(300));
    }];

     NSArray *array2  = [self bubbleDescendingOrderSortWithArray:_readBalance.userReadInfo];
//    // 利用block进行排序
//    NSArray *array2 = [_readBalance.userReadInfo sortedArrayUsingComparator:
//                       ^NSComparisonResult(AchieuserReadInfoModel *obj1, AchieuserReadInfoModel *obj2) {
////                           NSComparisonResult result = [obj1.catalogNum compare:obj2.catalogNum];
//                           NSComparisonResult result = [obj2.catalogNum compare:obj1.catalogNum];
//                           return result;
//                       }];
    AchieuserReadInfoModel * one = array2[0];
    AchieuserReadInfoModel * two = array2[1];
    AchieuserReadInfoModel * three = array2[2];
    AchieuserReadInfoModel * four = array2[3];
    AchieuserReadInfoModel * five = array2[4];
    NSString * onenum = [NSString stringWithFormat:@"%@本",one.catalogNum];
    NSString * twonum = [NSString stringWithFormat:@"%@本",two.catalogNum];
    NSString * threenum = [NSString stringWithFormat:@"%@本",three.catalogNum];
    NSString * fournum = [NSString stringWithFormat:@"%@本",four.catalogNum];
    NSString * fivenum = [NSString stringWithFormat:@"%@本",five.catalogNum];
    if (_readBalance.is_balance == 0) {
        NSString * zt = @"”不均衡“";
        NSString * titdown = [NSString stringWithFormat:@"%@同学阅读均衡指标为%@",Me.name,zt];
        AttributedStringModel * model = [AttributedStringModel new];
        model.textString = titdown;
        model.bianString = zt;
        model.color = RGB(242,95,75);
        NSArray * modelarray = @[model];
        NSMutableAttributedString *AttributedStr = [BaseObject Attributed:modelarray];
        titleDown.attributedText = AttributedStr;
        

        NSString * all =[NSString stringWithFormat:@"目前所属级别为 %@ 级，该生完成了 %@ 级阅读范围内%@和%@两个方向的书籍阅读。建议指导学生再多读%@类、%@类和%@的图书。该生目前阅读书籍情况如下：\n\n%@类:%@本     %@类:%@本\n%@类:%@本     %@类:%@本\n%@类:%@本",_readBalance.myLevel,_readBalance.myLevel,one.catalogName,two.catalogName,three.catalogName,four.catalogName,five.catalogName,one.catalogName,one.catalogNum,two.catalogName,two.catalogNum,three.catalogName,three.catalogNum,four.catalogName,four.catalogNum,five.catalogName,five.catalogNum];
        
        AttributedStringModel * onemodel = [AttributedStringModel new];
        onemodel.textString = all;
        onemodel.color = RGB(90,196,192);
        
        NSArray * downmodelarray = @[onenum,twonum,threenum,fournum,fivenum];
        NSMutableAttributedString *AttributedStrsu = [BaseObject AttributedStringModel:onemodel StringArray:downmodelarray];
        subtitle.attributedText = AttributedStrsu;
        
//        subtitle.text = [NSString stringWithFormat:@"%@同学阅读均衡指标为“不均衡”\n目前所属级别为%@级,该学生完成了%@级阅读范围内%@和%@两个方向的书籍阅读。建议指导学生再多读%@类,%@类和%@类的图书。该生目前阅读书籍情况如下:\n%@类:%@本\n%@类:%@本\n%@类:%@本\n%@类:%@本\n%@类:%@本",Me.name,_readBalance.myLevel,_readBalance.myLevel,one.catalogName,two.catalogName,three.catalogName,four.catalogName,five.catalogName,one.catalogName,one.catalogNum,two.catalogName,two.catalogNum,three.catalogName,three.catalogNum,four.catalogName,four.catalogNum,five.catalogName,five.catalogNum];
    }else{
        NSString * zt = @"“均衡”";
        NSString * titdown = [NSString stringWithFormat:@"%@同学阅读均衡指标为%@",Me.name,zt];
        AttributedStringModel * model = [AttributedStringModel new];
        model.textString = titdown;
        model.bianString = zt;
        model.color = RGB(90,196,192);
        NSArray * modelarray = @[model];
        NSMutableAttributedString *AttributedStr = [BaseObject Attributed:modelarray];
        titleDown.attributedText = AttributedStr;
        
        
        NSString * all =[NSString stringWithFormat:@"目前所属级别为 %@ 级，该生完成了 %@ 级阅读范围内书籍：其中\n\n%@类:%@本     %@类:%@本\n%@类:%@本     %@类:%@本\n%@类:%@本",_readBalance.myLevel,_readBalance.myLevel,one.catalogName,one.catalogNum,two.catalogName,two.catalogNum,three.catalogName,three.catalogNum,four.catalogName,four.catalogNum,five.catalogName,five.catalogNum];
        
        AttributedStringModel * onemodel = [AttributedStringModel new];
        onemodel.textString = all;
        onemodel.color = RGB(90,196,192);
        
        NSArray * downmodelarray = @[onenum,twonum,threenum,fournum,fivenum];
        NSMutableAttributedString *AttributedStrsu = [BaseObject AttributedStringModel:onemodel StringArray:downmodelarray];
        subtitle.attributedText = AttributedStrsu;
        
//        subtitle.text = [NSString stringWithFormat:@"%@同学阅读均衡指标为“均衡”\n目前所属级别为%@级,该学生完成了%@级阅读范围内书籍.其中:\n%@类:%@本\n%@类:%@本\n%@类:%@本\n%@类:%@本\n%@类:%@本",Me.name,_readBalance.myLevel,_readBalance.myLevel,one.catalogName,one.catalogNum,two.catalogName,two.catalogNum,three.catalogName,three.catalogNum,four.catalogName,four.catalogNum,five.catalogName,five.catalogNum];
    }
    
//    XianKuangView * xiankuang = [XianKuangView new];
//    xiankuang.readBalance = _readBalance;
//    [self addSubview:xiankuang];

    [titleDown mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(radar.mas_bottom).with.offset(LENGTH(18));
        make.left.equalTo(ws).with.offset(LENGTH(22));
        make.right.equalTo(ws).with.offset(-LENGTH(22));
    }];
    
    [subtitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->titleDown.mas_bottom).with.offset(LENGTH(16));
        make.left.equalTo(ws).with.offset(LENGTH(22));
        make.right.equalTo(ws).with.offset(-LENGTH(22));
        make.bottom.mas_equalTo(ws).with.offset(-LENGTH(16));

    }];
    
//    [xiankuang mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self->subtitle.mas_bottom).with.offset(LENGTH(10));
//        make.left.equalTo(ws).with.offset(LENGTH(22));
//        make.right.equalTo(ws).with.offset(-LENGTH(22));
//        make.height.mas_equalTo(LENGTH(280));
//        make.bottom.mas_equalTo(ws).with.offset(-LENGTH(16));
//    }];
    
}
- (NSString *)BlockString:(NSString *)flo{
    CGFloat fl = [flo floatValue]/100.00000001;
    return [NSString stringWithFormat:@"%.2f",fl];
}
- (void)addRadarNengLi{
    WS(ws);
    NSArray * itemtile = @[@"提取信息",@"整体感知",@"形成解释",@"作出评价",@"解决能力"];
    NSArray * gerenitem = @[[self BlockString:_readPower.myAbility.information],[self BlockString:_readPower.myAbility.feel],[self BlockString:_readPower.myAbility.explanvalue],[self BlockString:_readPower.myAbility.evaluation],[self BlockString:_readPower.myAbility.application]];
    NSArray * banjiitem = @[[self BlockString:_readPower.clazzAbility.information],[self BlockString:_readPower.clazzAbility.feel],[self BlockString:_readPower.clazzAbility.explanvalue],[self BlockString:_readPower.clazzAbility.evaluation],[self BlockString:_readPower.clazzAbility.application]];    
    
    ElementItem *item1 = [[ElementItem alloc]init];
    item1.itemName = @"个人数值";
    item1.itemPercent = gerenitem;
    item1.itemColor = RGBA(60, 91, 170, 0.5);
    
    ElementItem *item2 = [[ElementItem alloc]init];
    item2.itemName = @"班级均值";
    item2.itemPercent = banjiitem;
    item2.itemColor = RGBA(231, 133, 62, 0.5);
    
    LeiDaTuOnlyUser *radar = [[LeiDaTuOnlyUser alloc]initWithRadarElements:itemtile lengthColor:[UIColor colorWithRed:197/255.0 green:197/255.0 blue:197/255.0 alpha:1]];
    [radar addAbilitysWithElements:@[item1,item2]];
    radar.downts = YES;
    radar.backgroundColor = [UIColor clearColor];
    [self addSubview:radar];
    
    [radar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->title.mas_bottom).with.offset(LENGTH(24));
        make.centerX.mas_equalTo(ws);
        make.width.mas_equalTo(LENGTH(270));
        make.height.mas_offset(LENGTH(300));
    }];
    
    NSString * onefen = _readPower.myAbility.information;
    NSString * onefenbanfenbi = _readPower.overnum.overInformation;
    
    NSString * twofen = _readPower.myAbility.feel;
    NSString * twofenbanfenbi = _readPower.overnum.overFeel;
    
    NSString * threefen = _readPower.myAbility.explanvalue;
    NSString * threefenbanfenbi = _readPower.overnum.overExplanvalue;
    
    NSString * fourfen = _readPower.myAbility.evaluation;
    NSString * fourfenbanfenbi = _readPower.overnum.overEvaluation;
    
    NSString * fivefen = _readPower.myAbility.application;
    NSString * fivefenbanfenbi = _readPower.overnum.overApplication;
    
    if (_readPower.is_power == 0) {
        NSString * zt = @"“不达标";
        NSString * titdown = [NSString stringWithFormat:@"%@同学阅读能力%@",Me.name,zt];
        AttributedStringModel * model = [AttributedStringModel new];
        model.textString = titdown;
        model.bianString = zt;
        model.color = RGB(90,196,192);
        NSArray * modelarray = @[model];
        NSMutableAttributedString *AttributedStr = [BaseObject Attributed:modelarray];
        titleDown.attributedText = AttributedStr;
        
        
        NSString * all =[NSString stringWithFormat:@"不达标项有：\n得分 %@ 分，超过班级 %@%% 的同学\n得分 %@ 分，超过班级 %@%% 的同学\n得分 %@ 分，超过班级 %@%% 的同学\n得分 %@ 分，超过班级 %@%% 的同学\n得分 %@ 分，超过班级 %@%% 的同学",onefen,onefenbanfenbi,twofen,twofenbanfenbi,threefen,threefenbanfenbi,fourfen,fourfenbanfenbi,fivefen,fivefenbanfenbi];
        
        AttributedStringModel * onemodel = [AttributedStringModel new];
        onemodel.textString = all;
        onemodel.color = RGB(90,196,192);
        
        NSArray * downmodelarray = @[onefen,onefenbanfenbi,twofen,twofenbanfenbi,threefen,threefenbanfenbi,fourfen,fourfenbanfenbi,fivefen,fivefenbanfenbi];
        NSMutableAttributedString *AttributedStrsu = [BaseObject AttributedStringModel:onemodel StringArray:downmodelarray];
        subtitle.textAlignment = NSTextAlignmentCenter;
        subtitle.attributedText = AttributedStrsu;
        
//        subtitle.text = [NSString stringWithFormat:@"%@同学阅读能力不达标.\n不达标项有:\n提取信息能力:得分%@分,超过班级%@%%的同学\n整体感知能力:得分%@分,超过班级%@%%的同学\n形成解释能力:得分%@分,超过班级%@%%的同学\n作出评价能力:得分%@分,超过班级%@%%的同学\n解决问题能力:得分%@分,超过班级%@%%的同学",Me.name,_readPower.myAbility.information,_readPower.overnum.overInformation,_readPower.myAbility.feel,_readPower.overnum.overFeel,_readPower.myAbility.explanvalue,_readPower.overnum.overExplanvalue,_readPower.myAbility.evaluation,_readPower.overnum.overEvaluation,_readPower.myAbility.application,_readPower.overnum.overApplication];
    }else{
        NSString * zt = @"“达标”";
        NSString * titdown = [NSString stringWithFormat:@"%@同学阅读能力%@",Me.name,zt];
        AttributedStringModel * model = [AttributedStringModel new];
        model.textString = titdown;
        model.bianString = zt;
        model.color = RGB(90,196,192);
        NSArray * modelarray = @[model];
        NSMutableAttributedString *AttributedStr = [BaseObject Attributed:modelarray];
        titleDown.attributedText = AttributedStr;
        
        
        NSString * all =[NSString stringWithFormat:@"得分 %@ 分，超过班级 %@%% 的同学\n得分 %@ 分，超过班级 %@%% 的同学\n得分 %@ 分，超过班级 %@%% 的同学\n得分 %@ 分，超过班级 %@%% 的同学\n得分 %@ 分，超过班级 %@%% 的同学",onefen,onefenbanfenbi,twofen,twofenbanfenbi,threefen,threefenbanfenbi,fourfen,fourfenbanfenbi,fivefen,fivefenbanfenbi];
        AttributedStringModel * onemodel = [AttributedStringModel new];
        onemodel.textString = all;
        onemodel.color = RGB(90,196,192);
        
        NSArray * downmodelarray = @[onefen,onefenbanfenbi,twofen,twofenbanfenbi,threefen,threefenbanfenbi,fourfen,fourfenbanfenbi,fivefen,fivefenbanfenbi];
        NSMutableAttributedString *AttributedStrsu = [BaseObject AttributedStringModel:onemodel StringArray:downmodelarray];
        subtitle.textAlignment = NSTextAlignmentCenter;
        subtitle.attributedText = AttributedStrsu;
        
        
//        subtitle.text = [NSString stringWithFormat:@"%@同学阅读能力达标.\n\n提取信息能力:得分%@分,超过班级%@%%的同学\n整体感知能力:得分%@分,超过班级%@%%的同学\n形成解释能力:得分%@分,超过班级%@%%的同学\n作出评价能力:得分%@分,超过班级%@%%的同学\n解决问题能力:得分%@分,超过班级%@%%的同学",Me.name,_readPower.myAbility.information,_readPower.overnum.overInformation,_readPower.myAbility.feel,_readPower.overnum.overFeel,_readPower.myAbility.explanvalue,_readPower.overnum.overExplanvalue,_readPower.myAbility.evaluation,_readPower.overnum.overEvaluation,_readPower.myAbility.application,_readPower.overnum.overApplication];
    }
    
    [titleDown mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(radar.mas_bottom).with.offset(LENGTH(18));
        make.left.equalTo(ws).with.offset(LENGTH(22));
        make.right.equalTo(ws).with.offset(-LENGTH(22));
    }];
    
    [subtitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->titleDown.mas_bottom).with.offset(LENGTH(16));
        make.left.equalTo(ws).with.offset(LENGTH(22));
        make.right.equalTo(ws).with.offset(-LENGTH(22));
        make.bottom.mas_equalTo(ws).with.offset(-LENGTH(16));

    }];
    
    
    
}
- (void)addYueDuLiang{
    WS(ws);
    HistogramView * his = [HistogramView new];
    his.style = ChartStyleBarCharts;
    [self addSubview:his];
    
    HistItem *item1 = [[HistItem alloc]init];
    item1.itemName = @"个人数值";
    item1.itemPercent = @[_readNum.myReadNum,_readNum.classAllNum];
    item1.itemColor = RGBA(60, 91, 170, 0.5);
    
//    HistItem *item2 = [[HistItem alloc]init];
//    item2.itemName = @"班级均值";
//    item2.itemPercent = @[@"634"];
//    item2.itemColor = RGBA(231, 133, 62, 0.5);
    his.Xnumber = 2;
    his.FormColor = RGB(0x33, 0x33, 0x33);
    his.Xcoordinates = @[@"个人数值",@"班级均值",];
    his.MaxYvalue = [_readNum.maxBookNum integerValue];
    his.Ynumber = 10;
    his.histArray = @[item1];
    his.downts = NO;
    
    [his mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->title.mas_bottom).with.offset(LENGTH(12));
        make.left.equalTo(ws).with.offset(LENGTH(11));
        make.right.equalTo(ws).with.offset(-LENGTH(11));
        make.height.mas_equalTo(LENGTH(270));
    }];
    
    HistogramView * his1 = [HistogramView new];
    his1.style = ChartStyleBarLine;
    
    [self addSubview:his1];
    
    NSMutableArray * item11array = [NSMutableArray array];
    for (AcherPowerNumModel *m in _readNum.myMonthReadNum) {
        [item11array addObject:m.monthReadNum];
    }
    
    HistItem *item11 = [[HistItem alloc]init];
    item11.itemName = @"个人数值";
    item11.itemPercent = item11array;
    item11.itemColor = RGBA(60, 91, 170, 0.5);
    
    NSMutableArray * item22array = [NSMutableArray array];
    for (AcherPowerNumModel *m in _readNum.classBook) {
        [item22array addObject:m.monthReadNum];
    }
    HistItem *item22 = [[HistItem alloc]init];
    item22.itemName = @"班级均值";
    item22.itemPercent = item22array;
    item22.itemColor = RGBA(231, 133, 62, 0.5);
    
//    HistItem *item3 = [[HistItem alloc]init];
//    item3.itemName = @"班级均值";
//    item3.itemPercent = @[@"643",@"345",@"863",@"268",@"379",@"542",@"378",@"479",@"258",@"432",@"432",@"543"];
//    item3.itemColor = RGBA(156, 133, 62, 0.5);
    
    NSMutableArray * montharray = [NSMutableArray array];
    AcherPowerNumModel *ms = _readNum.myMonthReadNum[0];
    NSString * mon = ms.month;
    NSInteger b = 1;;

    if (_readNum.myMonthReadNum.count<6) {
        for (int i = 0; i<_readNum.myMonthReadNum.count + 5; i++) {
            if (i<_readNum.myMonthReadNum.count) {
                AcherPowerNumModel *m = _readNum.myMonthReadNum[i];
                [montharray addObject:[NSString stringWithFormat:@"%@月",m.month]];
            }else{
                NSInteger c = i - _readNum.myMonthReadNum.count+1;
                AcherSzScNRModel *m = _readNum.myMonthReadNum[_readNum.myMonthReadNum.count-1];
                NSInteger yue = [m.month integerValue]+c;
                if (yue >= 13) {
                    [montharray addObject:[NSString stringWithFormat:@"%ld月",b]];
                    b++;
                }else{
                    [montharray addObject:[NSString stringWithFormat:@"%ld月",yue]];
                }
            }
        }
    }else{
        for (AcherPowerNumModel *m in _readNum.myMonthReadNum) {
            [montharray addObject:[NSString stringWithFormat:@"%@月",m.month]];
        }
    }
    his1.FormColor = RGB(0x33, 0x33, 0x33);
    his1.Xcoordinates = montharray;
    NSInteger maxy = 0;
    for (NSInteger i = 0; i < item11array.count; i++) {
        NSString * she = item11array[i];
        if (maxy<[she integerValue]) {
            maxy = [she integerValue];
        }
    }
    for (NSInteger i = 0; i < item22array.count; i++) {
        NSString * she = item22array[i];
        if (maxy<[she integerValue]) {
            maxy = [she integerValue];
        }
    }
    maxy = maxy+100;
    his1.MaxYvalue = maxy;
    his1.Ynumber = 10;
    his1.histArray = @[item11,item22];
    his1.downts = YES;

    [his1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(his.mas_bottom).with.offset(LENGTH(12));
        make.left.equalTo(ws).with.offset(LENGTH(11));
        make.right.equalTo(ws).with.offset(-LENGTH(11));
        make.bottom.mas_equalTo(ws).with.offset(-LENGTH(16));
        make.height.mas_equalTo(LENGTH(270));
    }];
    
}

- (void)addShiZi{
    WS(ws);
    HistogramView * his = [HistogramView new];
    his.style = ChartStyleBarCharts;
    [self addSubview:his];
    
    NSMutableArray * item11array = [NSMutableArray array];
    
//    for (AcherSzScNRModel *m in _literacy.myMonthLiteracy) {
//        [item11array addObject:m.monthLiteracy];
//    }

    
    if (_literacy.myMonthLiteracy.count<6) {
        for (int i = 0; i<_literacy.myMonthLiteracy.count + 5; i++) {
            if (i<_literacy.myMonthLiteracy.count) {
                AcherSzScNRModel *m = _literacy.myMonthLiteracy[i];
                [item11array addObject:[NSString stringWithFormat:@"%@",m.monthLiteracy]];
            }else{

                [item11array addObject:[NSString stringWithFormat:@""]];
            }
        }
    }else{
        for (AcherSzScNRModel *m in _literacy.myMonthLiteracy) {
            [item11array addObject:[NSString stringWithFormat:@"%@",m.monthLiteracy]];
        }
    }
    
    HistItem *item1 = [[HistItem alloc]init];
    item1.itemName = @"个人数值";
    item1.itemPercent = item11array;
    item1.itemColor =RGBA(60, 91, 170, 0.5);

    AcherSzScNRModel *ms = _literacy.myMonthLiteracy[0];
    NSString * mon = ms.month;
    NSInteger b = 1;;
    
    NSMutableArray * montharray = [NSMutableArray array];
    if (_literacy.myMonthLiteracy.count<6) {
        for (int i = 0; i<_literacy.myMonthLiteracy.count + 5; i++) {
            if (i<_literacy.myMonthLiteracy.count) {
                AcherSzScNRModel *m = _literacy.myMonthLiteracy[i];
                [montharray addObject:[NSString stringWithFormat:@"%@月",m.month]];
            }else{
                NSInteger c = i - _literacy.myMonthLiteracy.count+1;
                AcherSzScNRModel *m = _literacy.myMonthLiteracy[_literacy.myMonthLiteracy.count-1];
                NSInteger yue = [m.month integerValue]+c;
                if (yue >= 13) {
                    [montharray addObject:[NSString stringWithFormat:@"%ld月",b]];
                    b++;
                }else{
                    [montharray addObject:[NSString stringWithFormat:@"%ld月",yue]];
                }
            }
        }
    }else{
        for (AcherSzScNRModel *m in _literacy.myMonthLiteracy) {
            [montharray addObject:[NSString stringWithFormat:@"%@月",m.month]];
        }
    }
    
    his.FormColor = RGB(0x33, 0x33, 0x33);
    his.Xcoordinates = montharray;
    NSInteger maxy = 0;
    for (NSInteger i = 0; i < item11array.count; i++) {
        NSString * she = item11array[i];
        if (maxy<[she integerValue]) {
            maxy = [she integerValue];
        }
    }
    maxy = maxy+200;
    his.MaxYvalue = maxy;
    his.Ynumber = 10;
    his.histArray = @[item1];
    his.ClassNume = _literacy.classAllLiteracy;
    his.BiaoZhunZhi = _literacy.standard;
    his.downts = YES;

    
    [his mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->title.mas_bottom).with.offset(LENGTH(12));
        make.left.equalTo(ws).with.offset(LENGTH(11));
        make.right.equalTo(ws).with.offset(-LENGTH(11));
        make.height.mas_equalTo(LENGTH(270));
    }];
    
    NSString * all = [NSString stringWithFormat:@"%@同学的识字量为 %ld 字。低于班级平均水平，班级平均水平是 %ld 字。高于标准值，标准值是 %.0f 字",Me.name,_literacy.myLiteracy,_literacy.classAllLiteracy,_literacy.standard];
    
    AttributedStringModel * onemodel = [AttributedStringModel new];
    onemodel.textString = all;
    onemodel.color = RGB(90,196,192);
    
    NSArray * downmodelarray = @[[NSString stringWithFormat:@"%ld",_literacy.myLiteracy],[NSString stringWithFormat:@"%ld",_literacy.classAllLiteracy],[NSString stringWithFormat:@"%.0f",_literacy.standard]];
    NSMutableAttributedString *AttributedStrsu = [BaseObject AttributedStringModel:onemodel StringArray:downmodelarray];
    subtitle.textAlignment = NSTextAlignmentLeft;
    subtitle.attributedText = AttributedStrsu;
    [subtitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(his.mas_bottom).with.offset(LENGTH(16));
        make.left.equalTo(ws).with.offset(LENGTH(11));
        make.right.equalTo(ws).with.offset(-LENGTH(11));
        make.bottom.mas_equalTo(ws).with.offset(-LENGTH(16));
    }];
}

- (void)addShiZC{
    WS(ws);
    HistogramView * his = [HistogramView new];
    his.style = ChartStyleBarCharts;
    [self addSubview:his];
    
    NSMutableArray * item11array = [NSMutableArray array];
    
    if (_glossary.myMonthGlossary.count<6) {
        for (int i = 0; i<_glossary.myMonthGlossary.count + 5; i++) {
            if (i<_glossary.myMonthGlossary.count) {
                AcherSzScNRModel *m = _glossary.myMonthGlossary[i];
                [item11array addObject:[NSString stringWithFormat:@"%@",m.monthGlossary]];
            }else{
                
                [item11array addObject:[NSString stringWithFormat:@""]];
            }
        }
    }else{
        for (AcherSzScNRModel *m in _glossary.myMonthGlossary) {
            [item11array addObject:[NSString stringWithFormat:@"%@",m.monthGlossary]];
        }
    }
    
    HistItem *item1 = [[HistItem alloc]init];
    item1.itemName = @"个人数值";
    item1.itemPercent = item11array;
    item1.itemColor =RGBA(60, 91, 170, 0.5);
    
    AcherSzScNRModel *ms = _glossary.myMonthGlossary[0];
    NSString * mon = ms.month;
    NSInteger b = 1;;
    
    NSMutableArray * montharray = [NSMutableArray array];
    if (_glossary.myMonthGlossary.count<6) {
        for (int i = 0; i<_glossary.myMonthGlossary.count + 5; i++) {
            if (i<_glossary.myMonthGlossary.count) {
                AcherSzScNRModel *m = _glossary.myMonthGlossary[i];
                [montharray addObject:[NSString stringWithFormat:@"%@月",m.month]];
            }else{
                NSInteger c = i - _glossary.myMonthGlossary.count+1;
                AcherSzScNRModel *m = _glossary.myMonthGlossary[_glossary.myMonthGlossary.count-1];
                NSInteger yue = [m.month integerValue]+c;
                if (yue+i >= 13) {
                    [montharray addObject:[NSString stringWithFormat:@"%ld月",b]];
                    b++;
                }else{
                    [montharray addObject:[NSString stringWithFormat:@"%ld月",yue]];
                }
            }
        }
    }else{
        for (AcherSzScNRModel *m in _glossary.myMonthGlossary) {
            [montharray addObject:[NSString stringWithFormat:@"%@月",m.month]];
        }
    }
    
    his.FormColor = RGB(0x33, 0x33, 0x33);
    his.Xcoordinates = montharray;
    NSInteger maxy = 0;
    for (NSInteger i = 0; i < item11array.count; i++) {
        NSString * she = item11array[i];
        if (maxy<[she integerValue]) {
            maxy = [she integerValue];
        }
    }
    maxy = maxy+200;
    his.MaxYvalue = maxy;
    his.Ynumber = 10;
    his.histArray = @[item1];
    his.ClassNume = _glossary.classAllGlossary;
    his.BiaoZhunZhi = _glossary.standard;
    his.downts = YES;
    
    
    [his mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->title.mas_bottom).with.offset(LENGTH(12));
        make.left.equalTo(ws).with.offset(LENGTH(11));
        make.right.equalTo(ws).with.offset(-LENGTH(11));
        make.height.mas_equalTo(LENGTH(270));
    }];
    
    NSString * all = [NSString stringWithFormat:@"%@同学的识词量为 %ld 字。低于班级平均水平，班级平均水平是 %ld 字。高于标准值，标准值是 %.0f 字",Me.name,_glossary.myGlossary,_glossary.classAllGlossary,_glossary.standard];
    
    AttributedStringModel * onemodel = [AttributedStringModel new];
    onemodel.textString = all;
    onemodel.color = RGB(90,196,192);
    
    NSArray * downmodelarray = @[[NSString stringWithFormat:@"%ld",_glossary.myGlossary],[NSString stringWithFormat:@"%ld",_glossary.classAllGlossary],[NSString stringWithFormat:@"%.0f",_glossary.standard]];
    NSMutableAttributedString *AttributedStrsu = [BaseObject AttributedStringModel:onemodel StringArray:downmodelarray];
    subtitle.textAlignment = NSTextAlignmentLeft;
    subtitle.attributedText = AttributedStrsu;
    [subtitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(his.mas_bottom).with.offset(LENGTH(16));
        make.left.equalTo(ws).with.offset(LENGTH(11));
        make.right.equalTo(ws).with.offset(-LENGTH(11));
        make.bottom.mas_equalTo(ws).with.offset(-LENGTH(16));
    }];
}

- (void)addBarCharts{
    WS(ws);
    HistogramView * his = [HistogramView new];
    his.style = ChartStyleBarCharts;
    [self addSubview:his];
    
    HistItem *item1 = [[HistItem alloc]init];
    item1.itemName = @"个人数值";
    item1.itemPercent = @[@"312",@"412",@"534",@"642",@"235",@"753",@"124",@"541",@"642",@"754",@"375",@"865"];
    item1.itemColor = RGBA(60, 91, 170, 0.5);
    
    HistItem *item2 = [[HistItem alloc]init];
    item2.itemName = @"班级均值";
    item2.itemPercent = @[@"634",@"345",@"234",@"568",@"234",@"754",@"435",@"765",@"423",@"743",@"865",@"541"];
    item2.itemColor = RGBA(231, 133, 62, 0.5);
    
    HistItem *item3 = [[HistItem alloc]init];
    item3.itemName = @"班级均值";
    item3.itemPercent = @[@"643",@"345",@"863",@"268",@"379",@"542",@"378",@"479",@"258",@"432",@"432",@"543"];
    item3.itemColor = RGBA(156, 133, 62, 0.5);
    
    
    his.FormColor = RGB(0x33, 0x33, 0x33);
    his.Xcoordinates = @[@"1月",@"2月",@"3月",@"4月",@"5月",@"6月",@"7月",@"8月",@"9月",@"10月",@"11月",@"12月",];
    his.MaxYvalue = 1000;
    his.Ynumber = 10;
    his.histArray = @[item1,item2,item3];
    his.downts = YES;

    
    [his mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->title.mas_bottom).with.offset(LENGTH(24));
        make.left.equalTo(ws).with.offset(LENGTH(42));
        make.right.equalTo(ws).with.offset(-LENGTH(42));
        make.height.mas_equalTo(LENGTH(350));
    }];
    
    [subtitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(his.mas_bottom).with.offset(LENGTH(26));
        make.left.equalTo(ws).with.offset(LENGTH(42));
        make.right.equalTo(ws).with.offset(-LENGTH(42));
        make.bottom.mas_equalTo(ws).with.offset(-LENGTH(32));
    }];
    
}

- (void)addCaeLine{
    WS(ws);
    HistogramView * his = [HistogramView new];
    his.style = ChartStyleBarLine;

    [self addSubview:his];
    
    HistItem *item1 = [[HistItem alloc]init];
    item1.itemName = @"个人数值";
    item1.itemPercent = @[@"312",@"412",@"534",@"642",@"235",@"753",@"124",@"541",@"642",@"754",@"375",@"865"];
    item1.itemColor = RGBA(60, 91, 170, 0.5);
    
    HistItem *item2 = [[HistItem alloc]init];
    item2.itemName = @"班级均值";
    item2.itemPercent = @[@"634",@"345",@"234",@"568",@"234",@"754",@"435",@"765",@"423",@"743",@"865",@"541"];
    item2.itemColor = RGBA(231, 133, 62, 0.5);
    
    HistItem *item3 = [[HistItem alloc]init];
    item3.itemName = @"班级均值";
    item3.itemPercent = @[@"643",@"345",@"863",@"268",@"379",@"542",@"378",@"479",@"258",@"432",@"432",@"543"];
    item3.itemColor = RGBA(156, 133, 62, 0.5);
    
    
    his.FormColor = RGB(0x33, 0x33, 0x33);
    his.Xcoordinates = @[@"1月",@"2月",@"3月",@"4月",@"5月",@"6月",@"7月",@"8月",@"9月",@"10月",@"11月",@"12月",];
    his.MaxYvalue = 1000;
    his.Ynumber = 10;
    his.histArray = @[item1,item2,item3];
    
    [his mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->title.mas_bottom).with.offset(LENGTH(24));
        make.left.equalTo(ws).with.offset(LENGTH(42));
        make.right.equalTo(ws).with.offset(-LENGTH(42));
        make.height.mas_equalTo(LENGTH(350));
    }];
    
    [subtitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(his.mas_bottom).with.offset(LENGTH(26));
        make.left.equalTo(ws).with.offset(LENGTH(42));
        make.right.equalTo(ws).with.offset(-LENGTH(42));
        make.bottom.mas_equalTo(ws).with.offset(-LENGTH(32));
    }];
}
@end
