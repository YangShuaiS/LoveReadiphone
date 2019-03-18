//
//  TKWeeKCSView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/1/14.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "TKWeeKCSView.h"
#import "HTaskWeekTableView.h"

@implementation TKWeeKCSView{
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
    backviews.image = UIIMAGE(@"测试任务背景");
    backviews.backgroundColor = RGB(255, 255, 255);
    backviews.layer.masksToBounds = YES;
    backviews.layer.cornerRadius = LENGTH(10);
    [backview addSubview:backviews];
    [backviews mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(backview).with.insets(UIEdgeInsetsMake(0, LENGTH(0), LENGTH(0), LENGTH(0)));
    }];
    
    BaseLabel * bweektask = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(51,51,51) LabelFont:TextFontCu(19) TextAlignment:NSTextAlignmentCenter Text:@"- 测试任务 -"];
    [backviews addSubview:bweektask];
    [bweektask mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws).with.offset(LENGTH(15));
        make.left.and.right.mas_equalTo(backviews);
    }];
    
    weektabview = [HTaskWeekTableView new];
    [backviews addSubview:weektabview];
    [weektabview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(bweektask.mas_bottom).with.offset(LENGTH(10));
        make.left.and.right.mas_equalTo(backviews);
        make.bottom.mas_equalTo(backviews).with.offset(-LENGTH(18));
    }];
}
- (void)setModel:(TAKALLModel *)model{
    _model = model;
    weektabview.colorarray = _colorarray;
    weektabview.frien = _frien;
    weektabview.ing = _ing;
    
    NSMutableArray * szarray = [NSMutableArray array];
    NHTimeListModel * szmodel = [NHTimeListModel new];
    szmodel.name = [NSString stringWithFormat:@"识字量测试"];
    szmodel.completed = [model.weeksInfo.literacyNum integerValue];
    szmodel.literacy_is_completed = model.weeksInfo.literacyNum;
    szmodel.book_Score = model.weeksInfo.literacyScore;
    szmodel.types = 3;
    
    NHTimeListModel * scmodel = [NHTimeListModel new];
    scmodel.name = [NSString stringWithFormat:@"识词量测试"];
    scmodel.completed = [model.weeksInfo.glossaryNum integerValue];
    scmodel.glossary_is_completed = model.weeksInfo.glossaryNum;
    scmodel.book_Score = model.weeksInfo.glossaryScore;
    scmodel.types = 4;
    
    [szarray addObject:szmodel];
    [szarray addObject:scmodel];
    weektabview.itemarray = szarray;

}
@end
