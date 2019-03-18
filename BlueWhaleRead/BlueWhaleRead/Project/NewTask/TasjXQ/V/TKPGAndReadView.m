//
//  TKPGAndReadView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/1/14.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "TKPGAndReadView.h"
#import "TKChooseCollectionView.h"
#import "HTaskWeekTableView.h"
@implementation TKPGAndReadView{
    UIView * topv;
    BaseLabel * paiming;
    UIImageView * jiantou;
    TKChooseCollectionView *collectview;
    HTaskWeekTableView * weektabview;
    NSMutableArray * allarray;

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
    self.backgroundColor = [UIColor clearColor];
    UIView * backview = [UIView new];
    backview.backgroundColor = RGB(255, 255, 255);
    [self addSubview:backview];
    [backview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws).with.insets(UIEdgeInsetsMake(0, LENGTH(20), LENGTH(14), LENGTH(20)));
    }];
    backview.layer.shadowOpacity = 0.24;
    backview.layer.shadowColor = RGB(171, 171, 171).CGColor;
    backview.layer.shadowRadius = LENGTH(8);
    backview.layer.shadowOffset = CGSizeMake(0,4);
    backview.layer.cornerRadius = LENGTH(10);

    UIImageView * backviews = [UIImageView new];
    backviews.userInteractionEnabled = YES;
    backviews.contentMode = UIViewContentModeScaleAspectFill;
    backviews.image = UIIMAGE(@"读书任务背景");
    backviews.backgroundColor = RGB(255, 255, 255);
    backviews.layer.masksToBounds = YES;
    backviews.layer.cornerRadius = LENGTH(10);
    [backview addSubview:backviews];
    [backviews mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(backview).with.insets(UIEdgeInsetsMake(0, LENGTH(0), LENGTH(0), LENGTH(0)));
    }];
    

    topv = [UIView new];
    [backviews addSubview:topv];
    [topv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.and.right.mas_equalTo(backviews);
        make.height.mas_equalTo(LENGTH(50));
    }];
    
    paiming = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255,163,81) LabelFont:TextFont(18) TextAlignment:NSTextAlignmentCenter Text:@"@“”"];
    [backviews addSubview:paiming];
    [paiming mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self->topv);
    }];
    
    jiantou = [UIImageView new];
    jiantou.contentMode = UIViewContentModeScaleAspectFit;
    [backviews addSubview:jiantou];
    [jiantou mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->paiming.mas_right).with.offset(LENGTH(20));
        make.centerY.mas_equalTo(self->topv);
        make.width.mas_equalTo(LENGTH(12));
        make.height.mas_equalTo(LENGTH(26));
    }];
    
    BaseLabel * bweektask = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(51,51,51) LabelFont:TextFontCu(19) TextAlignment:NSTextAlignmentCenter Text:@"- 读书任务 -"];
    [backviews addSubview:bweektask];
    [bweektask mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->topv.mas_bottom).with.offset(LENGTH(22));
        make.left.and.right.mas_equalTo(backviews);
    }];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(LENGTH(50),LENGTH(22));
    //定义每个UICollectionView 横向的间距
    flowLayout.minimumLineSpacing = LENGTH(12);
    //定义每个UICollectionView 纵向的间距
    flowLayout.minimumInteritemSpacing = LENGTH(12);
    //定义每个UICollectionView 的边距距
    flowLayout.sectionInset = UIEdgeInsetsMake(LENGTH(0), LENGTH(15), LENGTH(0), LENGTH(0));//上左下右
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    collectview = [[TKChooseCollectionView alloc] initWithFrame:CGRectMake(0, 0, 0,0) collectionViewLayout:flowLayout];
    collectview.decelerationRate = UIScrollViewDecelerationRateNormal;
    [backviews addSubview:collectview];
    [collectview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(bweektask.mas_bottom).with.offset(LENGTH(18));
        make.left.mas_equalTo(backviews);
        make.right.mas_equalTo(backviews);
        make.height.mas_equalTo(LENGTH(22));
    }];
    collectview.open = YES;
    [collectview setBlock:^(NSInteger inter) {
        [ws upweektableview:inter];
    }];
    
    weektabview = [HTaskWeekTableView new];
    [backviews addSubview:weektabview];
    [weektabview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->collectview.mas_bottom);
        make.left.and.right.mas_equalTo(backviews);
        make.bottom.mas_equalTo(backviews).with.offset(-LENGTH(18));
    }];
}
- (void)setModel:(TAKALLModel *)model{
    _model = model;
    topv.backgroundColor = _colorarray[4];
    paiming.textColor = _colorarray[0];
    collectview.neirongcolor = _colorarray[0];
    weektabview.colorarray = _colorarray;
    if ([model.mission.mission_type isEqualToString:@"1"]) {
        if ([model.mission.missionAssessment isEqualToString:@"0"]) {
            paiming.text = [NSString stringWithFormat:@"任务评估：下降"];
        }else{
            paiming.text = [NSString stringWithFormat:@"任务评估：上升"];
        }
    }else{
        paiming.text = [NSString stringWithFormat:@"任务评估：%@分",model.mission.missionAssessment];
    }
    if ([model.mission.rankInfo isEqualToString:@"1"]) {
        jiantou.image = UIIMAGE(@"上升");
    }else{
        jiantou.image = UIIMAGE(@"下降");
    }
    allarray = [NSMutableArray array];
    for (NHTimeListModel * reedbook in model.weeksInfo.weeks) {
        NSMutableArray * rwuarray = [NSMutableArray array];
        NHTimeListModel * reedbooks = [NHTimeListModel new];
        reedbooks.book_is_completed = reedbook.book_is_completed;
        reedbooks.name = [NSString stringWithFormat:@"阅读完成%@本书",model.missionRole.week_book_num];
        reedbooks.completed = [reedbook.book_is_completed integerValue];
        reedbooks.week_book_num = reedbook.book_num;
        reedbooks.allweek_book_num = model.missionRole.week_book_num;
        reedbooks.types = 1;
        reedbooks.book_Score = reedbook.book_Score;
        
        NHTimeListModel * share = reedbook;
        share.name = [NSString stringWithFormat:@"分享%@次",model.missionRole.week_share_num];
        share.completed = [reedbook.share_is_completed integerValue];
        share.week_share_num = reedbook.share_num;
        share.allweek_share_num = model.missionRole.week_share_num;
        share.types = 2;
        share.book_Score = reedbook.share_Score;
        
        [rwuarray addObject:reedbooks];
        [rwuarray addObject:share];
        [allarray addObject:rwuarray];
    }
    weektabview.frien = _frien;
    weektabview.ing = _ing;
    weektabview.noweek = 0;
    NSInteger nowwezhi;
    if ([model.weeksInfo.now_week integerValue] > allarray.count) {
        weektabview.itemarray = allarray[0];
        nowwezhi = 1;
    }else{
        weektabview.itemarray = allarray[[model.weeksInfo.now_week integerValue]-1];
        nowwezhi = [model.weeksInfo.now_week integerValue];
    }
    NSMutableArray * weekarray = [NSMutableArray array];

    for (int i = 1; i <= allarray.count; i++) {
        TKbuiltModel * model = [TKbuiltModel new];
        NSString * str = [NSString stringWithFormat:@"%d周",i];
        model.name =str;
        model.style = @"0";
        [weekarray addObject:model];
    }
    collectview.now_week = nowwezhi;
    collectview.itemArray = weekarray;
}
- (void)upweektableview:(NSInteger)inter{
    if (inter == [_model.weeksInfo.now_week integerValue]-1) {
        weektabview.noweek = 0;
    }else{
        weektabview.noweek = 1;
    }
    weektabview.itemarray = allarray[inter];
}
@end
