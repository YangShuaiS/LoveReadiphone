//
//  HorizontalcalendarView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/1.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "HorizontalcalendarView.h"
#import "HorizontalcalCollectionView.h"
@implementation HorizontalcalendarView{
    BaseLabel * nowweek;
    UIImageView * last;
    UIImageView * next;
    HorizontalcalCollectionView * collectionview;
    NSMutableArray * dayarray ;
    
    NSInteger wz;//位置
    NSInteger allwz;//位置
    NSInteger sfkzl;//是否跨周

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
    self.layer.cornerRadius = LENGTH(12);
    
    nowweek = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(51,51,51) LabelFont:TextFontCu(15) TextAlignment:NSTextAlignmentCenter Text:@"第 0 周"];
    [self addSubview:nowweek];
    [nowweek mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws).with.offset(LENGTH(18));
        make.centerX.mas_equalTo(ws);
    }];
    
    last = [UIImageView new];
    last.contentMode = UIViewContentModeScaleAspectFit;
    last.image = UIIMAGE(@"日历箭头左");
    last.image = [last.image imageWithRenderingMode:(UIImageRenderingModeAlwaysTemplate)];
    [self addSubview:last];
    [last mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self->nowweek.mas_left).with.offset(-LENGTH(36));
        make.centerY.mas_equalTo(self->nowweek);
        make.width.mas_equalTo(LENGTH(16));
        make.height.mas_equalTo(LENGTH(12));
    }];
    
    next = [UIImageView new];
    next.contentMode = UIViewContentModeScaleAspectFit;
    next.image = UIIMAGE(@"日历箭头左");
    next.image = [last.image imageWithRenderingMode:(UIImageRenderingModeAlwaysTemplate)];
    [self addSubview:next];
    [next mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->nowweek.mas_right).with.offset(LENGTH(36));
        make.centerY.mas_equalTo(self->nowweek);
        make.width.mas_equalTo(LENGTH(16));
        make.height.mas_equalTo(LENGTH(12));
    }];
    next.transform = CGAffineTransformMakeRotation(M_PI);

    
    NSArray * weekarray = @[@"日",@"一",@"二",@"三",@"四",@"五",@"六"];
    BaseLabel * lastlabel;
    for (int i = 0 ; i < weekarray.count; i++) {
        BaseLabel * week = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(153,153,153) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentCenter Text:weekarray[i]];
        [self addSubview:week];
        if (lastlabel == nil) {
            [week mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(ws);
            }];
        }else{
            [week mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(lastlabel.mas_right);
                make.width.mas_equalTo(lastlabel);
            }];
        }
        [week mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self->nowweek.mas_bottom).with.offset(LENGTH(22));
        }];
        if (i == weekarray.count-1) {
            [week mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.mas_equalTo(ws);
            }];
        }
        lastlabel = week;
    }
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake((WIDTH-LENGTH(40))/7,LENGTH(45));
    //定义每个UICollectionView 横向的间距
    flowLayout.minimumLineSpacing = LENGTH(0);
    //定义每个UICollectionView 纵向的间距
    flowLayout.minimumInteritemSpacing = LENGTH(0);
    //定义每个UICollectionView 的边距距
    flowLayout.sectionInset = UIEdgeInsetsMake(LENGTH(0), LENGTH(0), 0, LENGTH(0));//上左下右
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    collectionview = [[HorizontalcalCollectionView alloc] initWithFrame:CGRectMake(0, 0, 0,0) collectionViewLayout:flowLayout];
    collectionview.pagingEnabled = YES;
    [self addSubview:collectionview];
    [collectionview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(lastlabel.mas_bottom).with.offset(LENGTH(14));
        make.left.mas_equalTo(ws);
        make.right.mas_equalTo(ws);
        make.height.mas_equalTo(LENGTH(45));
        make.bottom.mas_equalTo(ws).with.offset(-LENGTH(18));
    }];
    [collectionview setBlock:^(NSInteger week) {
        [ws nowweek:week];
    }];
    self.userInteractionEnabled = YES;
    
    last.userInteractionEnabled = YES;
    next.userInteractionEnabled = YES;
    UITapGestureRecognizer * lasttap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(lastview)];
    //将手势添加到需要相应的view中去
    [last addGestureRecognizer:lasttap];
    
    UITapGestureRecognizer * nexttap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(nextview)];
    //将手势添加到需要相应的view中去
    [next addGestureRecognizer:nexttap];
}
- (void)nowweek:(NSInteger)week{
    if (week >= allwz) {
        if (sfkzl == 1) {
            week --;
        }
    }
    nowweek.text = [NSString stringWithFormat:@"第 %ld 周",week];
}
- (void)lastview{

    if (wz == 0) {
        wz = 0;
    }else{
        wz--;
    }
    [collectionview setIndext:3+wz*7];
//    nowweek.text = [NSString stringWithFormat:@"第 %ld 周",wz+1];
}

- (void)nextview{
    if (wz < allwz-1) {
        wz ++;
    }else{
        wz = allwz-1;
    }
    
    [collectionview setIndext:3+wz*7];
//    nowweek.text = [NSString stringWithFormat:@"第 %ld 周",wz+1];

}

- (void)setModel:(NHMissionModel *)model{
    _model = model;
    collectionview.colorarray = _colorarray;
    
    NSDate * kasddate= [BaseObject TimeStringForDate:model.thisWeekInfo.lottery_time];
    
    NSDate * nowdate = [BaseObject TimeStringForDate:model.now_time];
    NSString * nowday = [BaseObject weekDayStr:nowdate];
    NSInteger nowinter = [self NextDay:nowday];

    
    NSDate * ksdate= [BaseObject TimeStringForDate:model.thisWeekInfo.received_time];
    NSString * ksday = [BaseObject weekDayStr:ksdate];
    NSInteger stareinter = [self LastDay:ksday];
    NSDate * stareday = [BaseObject LastDays:ksdate Days:stareinter+model.now_week*7-7];
    
    if (nowinter + stareinter >= 6) {
        sfkzl =1;
    }else{
        sfkzl = 0;
    }
    dayarray = [NSMutableArray array];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSDate * lastdate = stareday;
        if (self->sfkzl == 0) {
            self->allwz = model.now_week;
        }else{
            self->allwz = model.now_week +1;
        }
        
        for (int i = 0 ; i <self->allwz*7; i++) {
            NHthisReadbokModel * models = [NHthisReadbokModel new];
            NSDate * date = lastdate;
            models.timedate = date;
            NSCalendar *calendar = [NSCalendar currentCalendar];
            NSCalendarUnit unit = NSCalendarUnitDay;//只比较天数差异
            NSDateComponents *deltas = [calendar components:unit fromDate:models.timedate toDate:nowdate options:0];
            if (deltas.day<0) {
                models.type = 2;
            }else if (deltas.day ==0){
                models.type = 1;
            }else{
                models.type = 0;
            }

            for (NHthisReadbokModel * readmodel in model.thisWeekInfo.readBookInfo) {
                NSDate * nowdates = [BaseObject TimeStringForDate:readmodel.read_time];
                if ([nowdates isEqual:date]) {
                    models.types = 3;
                    models.readbook = readmodel.book_num;
                    [model.thisWeekInfo.readBookInfo removeObject:readmodel];
                    break;
                }
            }

            if ([kasddate isEqual:date]) {
                models.types = 5;
                models.lottery_timedate = kasddate;
                models.periods_num = model.mission.periods_num;
            }
            
            [self->dayarray addObject:models];
            lastdate = [BaseObject NextDays:lastdate Days:1];
        }

        
        dispatch_async(dispatch_get_main_queue(), ^{
            self->collectionview.itemArray = self->dayarray;
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                WS(ws);
                [ws weizhi];
            });
        });
    });
    
    last.tintColor = _colorarray[1];
    next.tintColor = _colorarray[1];

}

- (void)weizhi{
    wz = 0;
    [collectionview setIndext:3+wz*7];
    nowweek.text = [NSString stringWithFormat:@"第 %ld 周",wz+1];
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
- (NSInteger)NextDay:(NSString *)day{
    NSInteger dayinter = 0;
    if ([day isEqualToString:@"一"]) {
        dayinter = 5;
    }else if ([day isEqualToString:@"二"]){
        dayinter = 4;
    }else if ([day isEqualToString:@"三"]){
        dayinter = 3;
    }else if ([day isEqualToString:@"四"]){
        dayinter = 2;
    }else if ([day isEqualToString:@"五"]){
        dayinter = 1;
    }else if ([day isEqualToString:@"六"]){
        dayinter = 0;
    }else if ([day isEqualToString:@"日"]){
        dayinter = 6;
    }else{
        dayinter = 0;
    }
    return dayinter;
}
@end
