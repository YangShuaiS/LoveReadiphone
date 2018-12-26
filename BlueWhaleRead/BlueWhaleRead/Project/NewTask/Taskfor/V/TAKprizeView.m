//
//  TAKprizeView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/4.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "TAKprizeView.h"
#import "TKPrizeViewController.h"
@implementation TAKprizeView{
    UIImageView * onejp;
    BaseLabel * onetitle;
    BaseLabel * onesubtitle;
    
    UIImageView * twojp;
    BaseLabel * twotitle;
    BaseLabel * twosubtitle;
    
    UIImageView * threejp;
    BaseLabel * threetitle;
    BaseLabel * threesubtitle;
    
    BaseLabel * alljp;

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
    
    onejp = [UIImageView new];
    onejp.contentMode = UIViewContentModeScaleAspectFit;
    onejp.image = UIIMAGE(@"车");
    [self addSubview:onejp];
    [onejp mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(ws);
        make.top.mas_equalTo(ws);
        make.width.and.height.mas_equalTo(LENGTH(140));
    }];
    
    onetitle = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(75,127,127) LabelFont:TextFontCu(17) TextAlignment:NSTextAlignmentCenter Text:@"一等奖奖品"];
    [self addSubview:onetitle];
    [onetitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->onejp.mas_bottom).with.offset(LENGTH(2));
        make.centerX.mas_equalTo(self->onejp);
    }];
    
    onesubtitle = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(75,127,127) LabelFont:TextFont(12) TextAlignment:NSTextAlignmentCenter Text:@"小米平衡车一台"];
    [self addSubview:onesubtitle];
    [onesubtitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->onetitle.mas_bottom).with.offset(LENGTH(2));
        make.centerX.mas_equalTo(self->onejp);
    }];
    
    twojp = [UIImageView new];
    twojp.contentMode = UIViewContentModeScaleAspectFit;
    twojp.image = UIIMAGE(@"车");
    [self addSubview:twojp];
    [twojp mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws).with.offset(LENGTH(22));
        make.top.mas_equalTo(ws).with.offset(LENGTH(78));
        make.width.and.height.mas_equalTo(LENGTH(100));
    }];
    
    twotitle = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(75,127,127) LabelFont:TextFontCu(15) TextAlignment:NSTextAlignmentCenter Text:@"二等奖奖品"];
    [self addSubview:twotitle];
    [twotitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->twojp.mas_bottom).with.offset(LENGTH(2));
        make.centerX.mas_equalTo(self->twojp);
    }];
    
    twosubtitle = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(75,127,127) LabelFont:TextFont(10) TextAlignment:NSTextAlignmentCenter Text:@"小米平衡车一台"];
    [self addSubview:twosubtitle];
    [twosubtitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->twotitle.mas_bottom).with.offset(LENGTH(2));
        make.centerX.mas_equalTo(self->twojp);
    }];
    
    
    threejp = [UIImageView new];
    threejp.contentMode = UIViewContentModeScaleAspectFit;
    threejp.image = UIIMAGE(@"车");
    [self addSubview:threejp];
    [threejp mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(ws).with.offset(-LENGTH(22));
        make.top.mas_equalTo(ws).with.offset(LENGTH(78));
        make.width.and.height.mas_equalTo(LENGTH(100));
    }];
    
    threetitle = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(75,127,127) LabelFont:TextFontCu(15) TextAlignment:NSTextAlignmentCenter Text:@"三等奖奖品"];
    [self addSubview:threetitle];
    [threetitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->threejp.mas_bottom).with.offset(LENGTH(2));
        make.centerX.mas_equalTo(self->threejp);
    }];
    
    threesubtitle = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(75,127,127) LabelFont:TextFont(10) TextAlignment:NSTextAlignmentCenter Text:@"小米平衡车一台"];
    [self addSubview:threesubtitle];
    [threesubtitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->threetitle.mas_bottom).with.offset(LENGTH(2));
        make.centerX.mas_equalTo(self->threejp);
        make.bottom.mas_equalTo(ws);
    }];
    
    alljp = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255,118,26) LabelFont:TextFontCu(14) TextAlignment:NSTextAlignmentCenter Text:@"全部奖品 >"];
    [self addSubview:alljp];
    [alljp mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(ws).with.offset(-LENGTH(15));
        make.top.mas_equalTo(ws).with.offset(LENGTH(29));
    }];
    
    alljp.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(qbjp)];
    //将手势添加到需要相应的view中去
    [alljp addGestureRecognizer:tap];
    
}

- (void)qbjp{
    TKPrizeViewController * vc = [TKPrizeViewController new];
    [[self viewController].navigationController pushViewController:vc animated:YES];
}
- (void)setModel:(TAKALLModel *)model{
    _model = model;
    [onejp sd_setImageWithURL:URLIMAGE(model.mission.first_prize.prize_img)];
    onesubtitle.text = [NSString stringWithFormat:@"%@%@台",model.mission.first_prize.prize_name,model.mission.first_prize_num];
    
    [twojp sd_setImageWithURL:URLIMAGE(model.mission.second_prize.prize_img)];
    twosubtitle.text = [NSString stringWithFormat:@"%@%@台",model.mission.second_prize.prize_name,model.mission.second_prize_num];
    
    [threejp sd_setImageWithURL:URLIMAGE(model.mission.third_prize.prize_img)];
    threesubtitle.text = [NSString stringWithFormat:@"%@%@台",model.mission.third_prize.prize_name,model.mission.third_prize_num];
    
}
@end
