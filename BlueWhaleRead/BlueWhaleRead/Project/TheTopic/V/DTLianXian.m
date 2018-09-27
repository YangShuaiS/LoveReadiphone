//
//  DTLianXian.m
//  BoWanJuanForPad
//
//  Created by 杨帅 on 2018/5/25.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "DTLianXian.h"
#import "DTLianXUanXIang.h"
#import "DTTiMuView.h"
#import "DTLianXIanTiView.h"

@implementation DTLianXian{
    UIScrollView * scrollView;
    DTTiMuView * tiMu;
    DTLianXIanTiView * LianXianti;
    BaseLabel *Confirm;
    NSMutableArray * tiitemarray;
    NSMutableArray * daanitemarray;

    DTDownLasOrNextView * downView;

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
    _zqdaarray =[NSMutableArray array];
    scrollView = [UIScrollView new];
    scrollView.backgroundColor = [UIColor clearColor];
    scrollView.delegate = self;
    scrollView.userInteractionEnabled = YES;
    [self addSubview:scrollView];

    downView = [DTDownLasOrNextView new];
    downView.delegate = self;
    [self addSubview:downView];
    
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(LENGTH(75)+NavHeight);
        make.left.equalTo(ws).with.offset(0);
        make.right.equalTo(ws).with.offset(0);
        make.bottom.equalTo(ws).with.offset(0);
        make.bottom.equalTo(self->downView.mas_top).with.offset(0);


    }];

    tiMu = [DTTiMuView new];
    tiMu.style = DTLianXianStyle;
    tiMu.TiMuText = @"我是题我是题我是题我是题我是题我是题我是题我是题我是题我是题我是题我是题我是题我是题我是题我是题我是题我是题我是题我是题我是题我是题我是题";
    [scrollView addSubview:tiMu];
    [tiMu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->scrollView.mas_top).with.offset(0);
        make.left.equalTo(ws).with.offset(LENGTH(15));
        make.right.equalTo(ws).with.offset(-LENGTH(15));
    }];

    LianXianti = [DTLianXIanTiView new];
    [scrollView addSubview:LianXianti];
    [LianXianti mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self->tiMu.mas_bottom).with.offset(LENGTH(15));
            make.left.equalTo(ws).with.offset(LENGTH(16));
            make.right.equalTo(ws).with.offset(-LENGTH(16));
        make.bottom.equalTo(self->scrollView.mas_bottom).with.offset(-LENGTH(50));
    }];


    [downView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self->LianXianti.mas_bottom).with.offset(LENGTH(80));
        make.left.equalTo(ws).with.offset(0);
        make.right.equalTo(ws).with.offset(0);
        make.bottom.equalTo(ws.mas_bottom).with.offset(-LENGTH(42));
    }];
}
-(void)layoutSubviews{
    [super layoutSubviews];
    
}
- (void)DtDownClick:(PushModel *)model{
    [self.delegate PushFriendViewCOntroller:model];
}

-(void)setDtdownstyle:(DtLastOrNext)dtdownstyle{
    if (downView.dtdownstyle==0) {
        _dtdownstyle = dtdownstyle;
        downView.dtdownstyle = dtdownstyle;
    }
}
- (void)setModel:(BookProblemsModel *)model{
    if (tiitemarray.count == 0) {
        _model = model;
        tiMu.TiMuText = model.question;
        tiitemarray = [NSMutableArray array];
        daanitemarray = [NSMutableArray array];
        if (![model.option1 isEqualToString:@""]) {
            TiMuModel * models = [TiMuModel new];
            models.TiMu = @"option1";
            models.DaAn = model.option1;
            [tiitemarray addObject:models];
        }
        if (![model.option2 isEqualToString:@""]){
            TiMuModel * models = [TiMuModel new];
            models.TiMu = @"option2";
            models.DaAn = model.option2;
            [daanitemarray addObject:models];        }
        if (![model.option3 isEqualToString:@""]){
            TiMuModel * models = [TiMuModel new];
            models.TiMu = @"option3";
            models.DaAn = model.option3;
            [tiitemarray addObject:models];        }
        if (![model.option4 isEqualToString:@""]){
            TiMuModel * models = [TiMuModel new];
            models.TiMu = @"option4";
            models.DaAn = model.option4;
            [daanitemarray addObject:models];        }
        if (![model.option5 isEqualToString:@""]){
            TiMuModel * models = [TiMuModel new];
            models.TiMu = @"option5";
            models.DaAn = model.option5;
            [tiitemarray addObject:models];        }
        if (![model.option6 isEqualToString:@""]){
            TiMuModel * models = [TiMuModel new];
            models.TiMu = @"option6";
            models.DaAn = model.option6;
            [daanitemarray addObject:models];        }
        if (![model.option7 isEqualToString:@""]){
            TiMuModel * models = [TiMuModel new];
            models.TiMu = @"option7";
            models.DaAn = model.option7;
            [tiitemarray addObject:models];        }
        if (![model.option8 isEqualToString:@""]){
            TiMuModel * models = [TiMuModel new];
            models.TiMu = @"option8";
            models.DaAn = model.option8;
            [daanitemarray addObject:models];        }
        if (![model.option9 isEqualToString:@""]){
            TiMuModel * models = [TiMuModel new];
            models.TiMu = @"option9";
            models.DaAn = model.option9;
            [tiitemarray addObject:models];        }
        if (![model.optionx isEqualToString:@""]){
            TiMuModel * models = [TiMuModel new];
            models.TiMu = @"optionx";
            models.DaAn = model.optionx;
            [daanitemarray addObject:models];
        }
//        NSMutableArray * tiarray = [NSMutableArray array];
//        NSMutableArray * daanarray = [NSMutableArray array];
//        [tiarray addObjectsFromArray:tiitemarray];
//        [daanarray addObjectsFromArray:daanitemarray];
//        NSMutableArray * zqarray = [NSMutableArray array];
//        [zqarray addObject:tiarray];
//        [zqarray addObject:daanarray];

        for (int i = 0 ; i < tiitemarray.count; i++) {
            NSMutableArray * zqarr = [NSMutableArray array];
            TiMuModel *model1 = tiitemarray[i];
            TiMuModel *model2 = daanitemarray[i];
            [zqarr addObject:model1];
            [zqarr addObject:model2];
            [_zqdaarray addObject:zqarr];
        }
        
        daanitemarray = (NSMutableArray *)[daanitemarray sortedArrayUsingComparator:(NSComparator)^(id obj1, id obj2) {
            return (arc4random() % 3) - 1;
        }];

        NSMutableArray * array = [NSMutableArray array];
        [array addObject:tiitemarray];
        [array addObject:daanitemarray];
        _timuarray = array;
        
        LianXianti.tiitemarray = tiitemarray;
        LianXianti.daanitemarray = daanitemarray;
        [LianXianti mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(LENGTH(100)*self->tiitemarray.count);
        }];
    }
    
}

- (NSMutableArray * )yhxzarray{
    NSMutableArray * arr = [LianXianti yhxzarray];
    return arr;
}
@end
