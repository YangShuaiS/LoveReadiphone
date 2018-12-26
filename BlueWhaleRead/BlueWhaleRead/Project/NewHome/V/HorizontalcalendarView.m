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
    NSDate * ksdate;
    NSDate * jsdate;
    
    BaseLabel * nowweek;
    UIImageView * last;
    UIImageView * next;
    HorizontalcalCollectionView * collectionview;
    
    
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
    self.backgroundColor = RGBA(112,202,199,0.3);
    
    nowweek = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(54,142,137) LabelFont:TextFont(10) TextAlignment:NSTextAlignmentLeft Text:@"第 0 周"];
    [self addSubview:nowweek];
    [nowweek mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws).with.offset(LENGTH(2));
        make.left.mas_equalTo(ws).with.offset(LENGTH(12));
    }];
    
    NSArray * weekarray = @[@"一",@"二",@"三",@"四",@"五",@"六",@"日"];
    BaseLabel * lastlabel;
    for (int i = 0 ; i < weekarray.count; i++) {
        BaseLabel * week = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255,255,255) LabelFont:TextFont(14) TextAlignment:NSTextAlignmentCenter Text:weekarray[i]];
        [self addSubview:week];
        if (lastlabel == nil) {
            [week mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(ws).with.offset(LENGTH(30));
            }];
        }else{
            [week mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(lastlabel.mas_right);
                make.width.mas_equalTo(lastlabel);
            }];
        }
        [week mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(ws).with.offset(LENGTH(13));
        }];
        if (i == weekarray.count-1) {
            [week mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.mas_equalTo(ws).with.offset(-LENGTH(30));
            }];
        }
        lastlabel = week;
    }
    
    last = [UIImageView new];
    last.image = UIIMAGE(@"矩形18拷贝2");
    [self addSubview:last];
    [last mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws).with.offset(LENGTH(5));
        make.top.mas_equalTo(ws).with.offset(LENGTH(28));
        make.width.mas_equalTo(LENGTH(20));
        make.height.mas_equalTo(LENGTH(36));
    }];
    
    next = [UIImageView new];
    next.image = UIIMAGE(@"矩形18拷贝");
    [self addSubview:next];
    [next mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(ws).with.offset(-LENGTH(5));
        make.top.mas_equalTo(ws).with.offset(LENGTH(28));
        make.width.mas_equalTo(LENGTH(20));
        make.height.mas_equalTo(LENGTH(36));
    }];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake((WIDTH-LENGTH(60))/7,LENGTH(55));
    //定义每个UICollectionView 横向的间距
    flowLayout.minimumLineSpacing = LENGTH(0);
    //定义每个UICollectionView 纵向的间距
    flowLayout.minimumInteritemSpacing = LENGTH(0);
    //定义每个UICollectionView 的边距距
    flowLayout.sectionInset = UIEdgeInsetsMake(LENGTH(0), LENGTH(0), 0, LENGTH(0));//上左下右
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    collectionview = [[HorizontalcalCollectionView alloc] initWithFrame:CGRectMake(0, 0, 0,0) collectionViewLayout:flowLayout];
    [self addSubview:collectionview];
    [collectionview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(lastlabel.mas_bottom).with.offset(LENGTH(5));
        make.left.mas_equalTo(self->last.mas_right).with.offset(LENGTH(5));
        make.right.mas_equalTo(self->next.mas_left).with.offset(-LENGTH(5));
        make.height.mas_equalTo(LENGTH(55));
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

- (void)lastview{
    if (wz == 10) {
        wz = 3;
    }else if (wz == 17){
        wz = 10;
    }else{
        wz = 3;
    }
    [collectionview scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:wz inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
}

- (void)nextview{
    if (wz == 3) {
        wz = 10;
    }else if (wz == 10){
        wz = 17;
    }else{
        wz = 17;
    }
    [collectionview scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:wz  inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
}

- (void)setModel:(NHMissionModel *)model{
    _model = model;
    ksdate = [BaseObject TimeStringForDate:model.thisWeekInfo.received_time];
    jsdate = [BaseObject TimeStringForDate:model.thisWeekInfo.completed_time];
    
//    NSString * ksday = [BaseObject weekDayStr:ksdate];
//    NSString * jsday = [BaseObject weekDayStr:ksdate];
//    NSInteger ksinter = [self LastDay:ksday];
//    NSInteger jsinter = [self NextDay:jsday];
//
//    ksdate = [BaseObject LastDays:ksdate Days:ksinter];
    
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"yyyy-MM-dd"];
    NSString *currentDateStr = [format stringFromDate:[NSDate date]];
    NSDate * nowdate = [BaseObject TimeStringForDate:currentDateStr];
    NSString * nowday = [BaseObject weekDayStr:nowdate];
    NSInteger stareinter = [self LastDay:nowday];
    NSInteger endinter = [self NextDay:nowday];
    NSDate * stareday = [BaseObject LastDays:nowdate Days:stareinter+7];
    NSDate * endday = [BaseObject NextDays:nowdate Days:endinter+7];
    
    NSMutableArray * dayarray = [NSMutableArray array];
    
    NSDate * kasddate= [BaseObject TimeStringForDate:model.thisWeekInfo.lottery_time];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSDate * lastdate = stareday;

        for (int i = 0 ; i < 21; i++) {
            NHthisReadbokModel * models = [NHthisReadbokModel new];
            NSDate * date = lastdate;
            models.timedate = date;
            
            NSDateFormatter *format = [[NSDateFormatter alloc] init];
            [format setDateFormat:@"yyyy-MM-dd"];
            NSString *nowstr = [format stringFromDate:[NSDate date]];
            NSDate * nowdate = [BaseObject TimeStringForDate:nowstr];
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
                models.types = 4;
                models.lottery_timedate = kasddate;
                models.periods_num = model.mission.periods_num;
            }
            
            
            [dayarray addObject:models];
            lastdate = [BaseObject NextDays:lastdate Days:1];
        }
        
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSCalendarUnit unit = NSCalendarUnitDay;//只比较天数差异
        NSDateComponents *delta = [calendar components:unit fromDate:self->ksdate toDate:nowdate options:0];
        NSInteger chaday = delta.day + 1;
        NSInteger week = chaday/7+1;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self->nowweek.text = [NSString stringWithFormat:@"第 %ld 周",week];
            self->collectionview.itemArray = dayarray;
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                WS(ws);
                [ws weizhi];
            });
        });
    });
    
}

- (void)weizhi{
    wz = 10;
    [collectionview scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:10 inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];

}
- (NSInteger)LastDay:(NSString *)day{
    NSInteger dayinter = 0;
    if ([day isEqualToString:@"一"]) {
        dayinter = 0;
    }else if ([day isEqualToString:@"二"]){
        dayinter = 1;
    }else if ([day isEqualToString:@"三"]){
        dayinter = 2;
    }else if ([day isEqualToString:@"四"]){
        dayinter = 3;
    }else if ([day isEqualToString:@"五"]){
        dayinter = 4;
    }else if ([day isEqualToString:@"六"]){
        dayinter = 5;
    }else if ([day isEqualToString:@"日"]){
        dayinter = 6;
    }else{
        dayinter = 0;
    }
    return dayinter;
}
- (NSInteger)NextDay:(NSString *)day{
    NSInteger dayinter = 0;
    if ([day isEqualToString:@"一"]) {
        dayinter = 6;
    }else if ([day isEqualToString:@"二"]){
        dayinter = 5;
    }else if ([day isEqualToString:@"三"]){
        dayinter = 4;
    }else if ([day isEqualToString:@"四"]){
        dayinter = 3;
    }else if ([day isEqualToString:@"五"]){
        dayinter = 2;
    }else if ([day isEqualToString:@"六"]){
        dayinter = 1;
    }else if ([day isEqualToString:@"日"]){
        dayinter = 0;
    }else{
        dayinter = 0;
    }
    return dayinter;
}
@end
