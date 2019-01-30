//
//  TKXQRLView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/5.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "TKXQRLView.h"
#import "TKXQRLCollectionView.h"

@implementation TKXQRLView{
    TKXQRLCollectionView * collectionview;
    NSMutableArray * itemarray;
    NSDate * nowdate;
    NSInteger stareinter;
    NSDate * monthchu;//月初
    NSDate * lastmonth;//月初
    NSDate * nextmonth;//月初
    NSDate * titmonth;//title日期

    
    NSMutableArray * linshi;
    BaseLabel *rltime;
    UIImageView * last;
    UIImageView * next;
    
    NSInteger wz;//位置
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
    rltime = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(51, 51, 51) LabelFont:TextFontCu(15) TextAlignment:NSTextAlignmentCenter Text:@""];
    [self addSubview:rltime];
    [rltime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(ws);
        make.top.mas_equalTo(ws).with.offset(LENGTH(13));
    }];
    
    last = [UIImageView new];
    last.contentMode = UIViewContentModeScaleAspectFit;
    last.image = UIIMAGE(@"backhei");
//    last.image = [last.image imageWithRenderingMode:(UIImageRenderingModeAlwaysTemplate)];
    [self addSubview:last];
    [last mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws).with.offset(LENGTH(24));
        make.centerY.mas_equalTo(self->rltime);
        make.width.mas_equalTo(LENGTH(8));
        make.height.mas_equalTo(LENGTH(14));
    }];
    
    next = [UIImageView new];
    next.contentMode = UIViewContentModeScaleAspectFit;
    next.image = UIIMAGE(@"backhei");
//    next.image = [last.image imageWithRenderingMode:(UIImageRenderingModeAlwaysTemplate)];
    [self addSubview:next];
    [next mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(ws).with.offset(-LENGTH(24));
        make.centerY.mas_equalTo(self->rltime);
        make.width.mas_equalTo(LENGTH(8));
        make.height.mas_equalTo(LENGTH(14));
    }];
    next.transform = CGAffineTransformMakeRotation(M_PI);
    
    last.userInteractionEnabled = YES;
    next.userInteractionEnabled = YES;
    UITapGestureRecognizer * lasttap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(lastview)];
    //将手势添加到需要相应的view中去
    [last addGestureRecognizer:lasttap];
    
    UITapGestureRecognizer * nexttap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(nextview)];
    //将手势添加到需要相应的view中去
    [next addGestureRecognizer:nexttap];
    
    NSArray * weekarray = @[@"日",@"一",@"二",@"三",@"四",@"五",@"六"];
    BaseLabel * lastlabel;
    for (int i = 0 ; i < weekarray.count; i++) {
        BaseLabel * week = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(153,153,153) LabelFont:TextFont(14) TextAlignment:NSTextAlignmentCenter Text:weekarray[i]];
        [self addSubview:week];
        if (lastlabel == nil) {
            [week mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(ws).with.offset(LENGTH(10));
            }];
        }else{
            [week mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(lastlabel.mas_right);
                make.width.mas_equalTo(lastlabel);
            }];
        }
        [week mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self->rltime.mas_bottom).with.offset(LENGTH(20));
        }];
        if (i == weekarray.count-1) {
            [week mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.mas_equalTo(ws).with.offset(-LENGTH(10));
            }];
        }
        lastlabel = week;
    }
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(WIDTH-LENGTH(40),LENGTH(55)*6);
    //定义每个UICollectionView 横向的间距
    flowLayout.minimumLineSpacing = LENGTH(0);
    //定义每个UICollectionView 纵向的间距
    flowLayout.minimumInteritemSpacing = LENGTH(0);
    //定义每个UICollectionView 的边距距
    flowLayout.sectionInset = UIEdgeInsetsMake(LENGTH(0), LENGTH(0), 0, LENGTH(0));//上左下右
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    collectionview = [[TKXQRLCollectionView alloc] initWithFrame:CGRectMake(0, 0, 0,0) collectionViewLayout:flowLayout];
    collectionview.pagingEnabled = YES;
    [self addSubview:collectionview];
    [collectionview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(lastlabel.mas_bottom).with.offset(LENGTH(20));
        make.left.mas_equalTo(ws);
        make.right.mas_equalTo(ws);
        make.height.mas_equalTo(LENGTH(55)*6);
        make.bottom.mas_equalTo(ws).with.offset( LENGTH(0));
    }];
    self.userInteractionEnabled = YES;
    
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"yyyy-MM-dd"];
    NSString *currentDateStr = [format stringFromDate:[NSDate date]];
    nowdate = [BaseObject TimeStringForDate:currentDateStr];
    
    [collectionview setBlock:^(NSInteger inter) {
        [ws upril:inter];

    }];
    
//    [collectionview reloadData];
}
- (void)upril:(NSInteger)inter{
    if (inter == 0) {
        [self lastmonth];
        [self weizhi];
    }else if (inter == itemarray.count-1){
        [self nextmonth];
    }
    [self lastmonths:inter];
}
- (void)weizhi{
    wz = 1;
    collectionview.now = 1;
    [collectionview scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];

}
- (void)lastmonth{
    lastmonth = [BaseObject LastMonth:lastmonth];
    TKXQRLModel * model = [self newModel:lastmonth];
    [itemarray insertObject:model atIndex:0];
    [collectionview reloadData];


}
- (void)nextmonth{
    nextmonth = [BaseObject NextMonth:nextmonth];
    TKXQRLModel * model = [self newModel:nextmonth];
    [itemarray insertObject:model atIndex:itemarray.count];
    [collectionview reloadData];
}

- (TKXQRLModel *)newModel:(NSDate *)month{
    TKXQRLModel * rlmodel = [TKXQRLModel new];
    
    NSDate * old_lottery_time= [BaseObject TimeStringForDate:_model.old_lottery_time];
    NSDate * lottery_time= [BaseObject TimeStringForDate:_model.lottery_time];

//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSDateFormatter *format = [[NSDateFormatter alloc] init];
        [format setDateFormat:@"yyyy-MM-dd"];
        
        NSMutableArray * dayarray = [NSMutableArray array];
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSCalendarUnit unit = NSCalendarUnitDay;//只比较天数差异
        NSDate * lastdate = month;
        NSInteger monthlength = [BaseObject MonthDayLength:lastdate];
        NSString * nowday = [BaseObject weekDayStr:lastdate];
        NSInteger starinter = [self LastDay:nowday];
        for (int i = 0 ; i < monthlength; i++) {
            NHthisReadbokModel * models = [NHthisReadbokModel new];
            NSDate * date = lastdate;
            models.timedate = date;
            NSDateComponents *deltas = [calendar components:unit fromDate:models.timedate toDate:self->nowdate options:0];
            if (deltas.day<0) {
                models.type = 2;
            }else if (deltas.day ==0){
                models.type = 1;
            }else{
                models.type = 0;
            }
            for (TKXQRLModel * nowmodel in self->linshi) {
                NSArray * arr = [BaseObject TiemArray:nowmodel.read_time String:@"-"];
                NSString * nowstr = [format stringFromDate:lastdate];
                NSArray * nowarr = [BaseObject TiemArray:nowstr String:@"-"];
                if ([arr[0] isEqualToString:nowarr[0]]&&[arr[1] isEqualToString:nowarr[1]]) {
                    for (TKXQRLModel * modelss in nowmodel.itemarray) {
                        NSDate * nowdates = [BaseObject TimeStringForDate:modelss.read_time];
                         if ([nowdates isEqual:date]) {
                            models.types = 3;
                            models.readbook = @"1";
                            break;
                        }
                        
                    }
                }
                
            }
            if ([old_lottery_time isEqual:date]) {
                models.types = 4;
                models.lottery_timedate = old_lottery_time;
                models.periods_num = [NSString stringWithFormat:@"%ld",[self->_model.mission.periods_num integerValue]-1];
            }
            if ([lottery_time isEqual:date]) {
                models.types = 5;
                models.lottery_timedate = lottery_time;
                models.periods_num = self->_model.mission.periods_num;
            }
            [dayarray addObject:models];
            lastdate = [BaseObject NextDays:lastdate Days:1];
        }
        rlmodel.qiwz = starinter;
        rlmodel.day =month;
        rlmodel.itemarray = dayarray;
//    });
    return rlmodel;

}
- (NSInteger)LastDay:(NSString *)day{
    NSInteger dayinter = 0;
    if ([day isEqualToString:@"一"]) {
        dayinter = 1;
    }else if ([day isEqualToString:@"二"]){
        dayinter = 2;
    }else if ([day isEqualToString:@"三"]){
        dayinter = 3;
    }else if ([day isEqualToString:@"四"]){
        dayinter = 4;
    }else if ([day isEqualToString:@"五"]){
        dayinter = 5;
    }else if ([day isEqualToString:@"六"]){
        dayinter = 6;
    }else if ([day isEqualToString:@"日"]){
        dayinter = 0;
    }else{
        dayinter = 0;
    }
    return dayinter;
}
- (void)setStyle:(TaxkXqStyele)style{
    _style = style;
//    if (_style == TaxkXqStyelenoviceingStyle || _style == TaxkXqStyelenoviceendStyle || _style == TaxkXqStyelenoviceendStyle) {
//        self.backgroundColor = RGBA(112,202,199,0.3);
//    }else{
//        self.backgroundColor = RGBA(99,159,211,0.3);
//    }
//    [self shuju];
}
- (void)shuju{

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSDateFormatter *format = [[NSDateFormatter alloc] init];
        [format setDateFormat:@"yyyy-MM-dd"];
        
        NSMutableArray * dayarray = [NSMutableArray array];
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSCalendarUnit unit = NSCalendarUnitDay;//只比较天数差异
        NSDate * lastdate = self->monthchu;
        NSInteger monthlength = [BaseObject MonthDayLength:lastdate];

        for (int i = 0 ; i < monthlength; i++) {
            NHthisReadbokModel * models = [NHthisReadbokModel new];
            NSDate * date = lastdate;
            models.timedate = date;
            NSDateComponents *deltas = [calendar components:unit fromDate:models.timedate toDate:self->nowdate options:0];
            if (deltas.day<0) {
                models.type = 2;
            }else if (deltas.day ==0){
                models.type = 1;
            }else{
                models.type = 0;
            }
            for (TKXQRLModel * nowmodel in self->linshi) {
                NSArray * arr = [BaseObject TiemArray:nowmodel.read_time String:@"-"];
                NSString * nowstr = [format stringFromDate:lastdate];
                NSArray * nowarr = [BaseObject TiemArray:nowstr String:@"-"];
                if ([arr[0] isEqualToString:nowarr[0]]&&[arr[1] isEqualToString:nowarr[1]]) {
                    for (TKXQRLModel * modelss in nowmodel.itemarray) {
                        NSDate * nowdates = [BaseObject TimeStringForDate:modelss.read_time];
                        if ([nowdates isEqual:date]) {
                            models.types = 3;
                            models.readbook = @"1";
                            break;
                        }

                    }
                }

            }
            
//            if ([kasddate isEqual:date]) {
//                models.types = 4;
//                models.lottery_timedate = kasddate;
//                models.periods_num = model.mission.periods_num;
//            }
            [dayarray addObject:models];
            lastdate = [BaseObject NextDays:lastdate Days:1];
        }
        NSString * nowday = [BaseObject weekDayStr:self->monthchu];
        self->stareinter = [self LastDay:nowday];
        self->nowdate = [BaseObject NextMonth:self->nowdate];
        dispatch_async(dispatch_get_main_queue(), ^{
            self->collectionview.qishi = self->stareinter;
            self->collectionview.itemArray = dayarray;
        });

    });
}


- (void)setModel:(TAKALLModel *)model{
    _model = model;
    linshi = [NSMutableArray array];
    collectionview.colorarray = _colorarray;
    for (TKXQRLModel * model in _model.weeksInfo.read_time) {
        NSArray * arr = [BaseObject TiemArray:model.read_time String:@"-"];
        NSInteger zt = 0;
        for (TKXQRLModel * models in linshi) {
            NSArray * arrs = [BaseObject TiemArray:models.read_time String:@"-"];
            if ([arr[0] isEqualToString:arrs[0]]&&[arr[1] isEqualToString:arrs[1]]) {
                zt = 1;
                [models.itemarray addObject:model];
                break;
            }
        }
        if (zt == 0) {
            TKXQRLModel * monthmodel = [TKXQRLModel new];
            monthmodel.read_time = model.read_time;
            monthmodel.itemarray = [NSMutableArray array];
            [monthmodel.itemarray addObject:model];
            [linshi addObject:monthmodel];
        }
        
    }
    NSArray * arr = [BaseObject TiemArray:_model.received_time String:@"-"];
    NSString * monthchustr = [NSString stringWithFormat:@"%@-%@-01",arr[0],arr[1]];
    rltime.text = [NSString stringWithFormat:@"%@年%@月",arr[0],arr[1]];
    monthchu = [BaseObject TimeStringForDate:monthchustr];
    lastmonth = monthchu;
    nextmonth = monthchu;
    titmonth = monthchu;
    
    
    itemarray = [NSMutableArray array];
    TKXQRLModel * models = [self newModel:monthchu];
    [itemarray addObject:models];
    [self lastmonth];
    [self nextmonth];
    wz = 0;
    collectionview.itemArray = itemarray;
    //GCD延迟
    WS(ws);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [ws weizhi];
    });
}


- (void)lastview{
    if (collectionview.now <= 1) {
        [self lastmonth];
        [self weizhi];
    }else{
        collectionview.now--;
        [collectionview scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:collectionview.now inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    }
    [self lastmonths:collectionview.now];


}
- (void)lastmonths:(NSInteger)now{
    TKXQRLModel * model = itemarray[now];
    NSDate * nowdate = model.day;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString * str = [dateFormatter stringFromDate:nowdate];
    NSArray * arr = [BaseObject TiemArray:str String:@"-"];
    rltime.text = [NSString stringWithFormat:@"%@年%@月",arr[0],arr[1]];
}

- (void)nextview{
    
    if (collectionview.now < itemarray.count-1) {
        collectionview.now++;
        [collectionview scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:collectionview.now inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    }else{
        [self nextmonth];
        collectionview.now++;
        [collectionview scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:collectionview.now inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];

    }
    [self lastmonths:collectionview.now];

}
@end
