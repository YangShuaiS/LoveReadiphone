//
//  TKXQGZView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/5.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "TKXQGZView.h"
#import "TAKGZView.h"

#import "TKPrizeViewController.h"
#import "TKMytaskViewController.h"
@implementation TKXQGZView{
    BaseLabel * alljp;//全部奖品
    TAKGZView * guize;//规则
    BaseLabel * fqrw;//放弃任务
    BaseLabel * cklsrw;//查看历史任务
    BaseLabel * goreadbook;//去读书


}

- (void)setStyle:(TaxkXqStyele)style{
    _style = style;
    self.userInteractionEnabled = YES;
    switch (style) {
        case TaxkXqStyelenoviceingStyle:
            [self addTaxkXqStyelenoviceingStyle];
            break;
        case TaxkXqStyelenoviceendStyle:
            [self addTaxkXqStyelenoviceendStyle];

            break;
        case TaxkXqStyelenovicefqStyle:
            [self addTaxkXqStyelenoviceendStyle];
            break;
            
        case TaxkXqStyeUserOthering:
            [self addTaxkXqStyeUserOthering];
            break;
        case TaxkXqStyeUserOtherend:
            [self addTaxkXqStyeUserOtherend];
            break;
        case TaxkXqStyeUserOtherfq:
            [self addTaxkXqStyeUserOtherend];
            break;
        default:
            break;
    }
}
- (void)addTaxkXqStyeUserOtherend{
    [self addguize];
    [self addcklsrw];
    [self TaxkXqStyeUserOtherendLayout];

}
- (void)addTaxkXqStyeUserOthering{
    [self addguize];
    [self addfqrw];
    [self addcklsrw];
    [self addgoreadbook];
    [self TaxkXqStyeUserOtheringLayout];
}
- (void)addTaxkXqStyelenoviceingStyle{
    [self addalljp];
    [self addguize];
    [self addfqrw];
    [self addgoreadbook];
    [self TaxkXqStyelenoviceingStyleLayout];
}
- (void)addTaxkXqStyelenoviceendStyle{
    [self addalljp];
    [self addguize];
    [self addgoreadbook];
    [self TaxkXqStyelenoviceendStyleLayout];

}
- (void)TaxkXqStyeUserOtherendLayout{
    WS(ws);
    [guize mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws).with.offset(LENGTH(20));
        make.left.and.right.mas_equalTo(ws);
    }];
    [cklsrw mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->guize.mas_bottom).with.offset(LENGTH(16));
        make.centerX.mas_equalTo(ws);
        make.bottom.mas_equalTo(ws).with.offset(-LENGTH(20));
    }];
}

- (void)TaxkXqStyeUserOtheringLayout{
    WS(ws);
    [guize mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws).with.offset(LENGTH(20));
        make.left.and.right.mas_equalTo(ws);
    }];
    [fqrw mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->guize.mas_bottom).with.offset(LENGTH(16));
        make.centerX.mas_equalTo(ws);
        make.width.mas_equalTo(LENGTH(126));
        make.height.mas_equalTo(LENGTH(32));
    }];
    [cklsrw mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->fqrw.mas_bottom).with.offset(LENGTH(16));
        make.centerX.mas_equalTo(ws);
    }];
    
    [goreadbook mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->cklsrw.mas_bottom).with.offset(LENGTH(10));
        make.left.and.right.mas_equalTo(ws);
        make.height.mas_equalTo(TabBarHeight);
        make.bottom.mas_equalTo(ws);
    }];

}

- (void)TaxkXqStyelenoviceingStyleLayout{
    WS(ws);
    [alljp mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws).with.offset(LENGTH(20));
        make.centerX.mas_equalTo(ws);
        make.width.mas_equalTo(LENGTH(126));
        make.height.mas_equalTo(LENGTH(32));
    }];
    [guize mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->alljp.mas_bottom).with.offset(LENGTH(16));
        make.left.and.right.mas_equalTo(ws);
    }];
    [fqrw mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->guize.mas_bottom).with.offset(LENGTH(16));
        make.centerX.mas_equalTo(ws);
        make.width.mas_equalTo(LENGTH(126));
        make.height.mas_equalTo(LENGTH(32));
    }];
    [goreadbook mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->fqrw.mas_bottom).with.offset(LENGTH(10));
        make.left.and.right.mas_equalTo(ws);
        make.height.mas_equalTo(TabBarHeight);
        make.bottom.mas_equalTo(ws);
    }];
}

- (void)TaxkXqStyelenoviceendStyleLayout{
    WS(ws);
    [alljp mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws).with.offset(LENGTH(20));
        make.centerX.mas_equalTo(ws);
        make.width.mas_equalTo(LENGTH(126));
        make.height.mas_equalTo(LENGTH(32));
    }];
    [guize mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->alljp.mas_bottom).with.offset(LENGTH(16));
        make.left.and.right.mas_equalTo(ws);
        make.bottom.mas_equalTo(ws).with.offset(-LENGTH(20));
    }];
    
}

-(void)addalljp{
    alljp = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255,255,255) LabelFont:TextFont(16) TextAlignment:NSTextAlignmentCenter Text:@"查看全部奖品"];
    alljp.backgroundColor = RGB(124,165,232);
    [self addSubview:alljp];
    alljp.userInteractionEnabled = YES;
    UITapGestureRecognizer * tapviewtap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(lingqujiangpin)];
    //将手势添加到需要相应的view中去
    [alljp addGestureRecognizer:tapviewtap];
}
- (void)addguize{
    guize = [TAKGZView new];
    [self addSubview:guize];
}
- (void)addfqrw{
    fqrw = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255,255,255) LabelFont:TextFont(16) TextAlignment:NSTextAlignmentCenter Text:@"放弃任务"];
    fqrw.backgroundColor = RGB(124,165,232);
    [self addSubview:fqrw];
    fqrw.userInteractionEnabled = YES;
    UITapGestureRecognizer * tapviewtap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(fangqirenwu)];
    //将手势添加到需要相应的view中去
    [fqrw addGestureRecognizer:tapviewtap];
}
- (void)addcklsrw{
    cklsrw = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(124,165,232) LabelFont:TextFont(16) TextAlignment:NSTextAlignmentCenter Text:@"查看历史任务→"];
    [self addSubview:cklsrw];
    cklsrw.userInteractionEnabled = YES;
    UITapGestureRecognizer * tapviewtap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cklsrw)];
    //将手势添加到需要相应的view中去
    [cklsrw addGestureRecognizer:tapviewtap];
}
- (void)addgoreadbook{
    goreadbook = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255,255,255) LabelFont:TextFont(16) TextAlignment:NSTextAlignmentCenter Text:@"去读书"];
    goreadbook.backgroundColor = RGB(91,199,198);
    [self addSubview:goreadbook];
}

- (void)lingqujiangpin{
    TKPrizeViewController * vc = [TKPrizeViewController new];
    [[self viewController].navigationController pushViewController:vc animated:YES];
}

- (void)cklsrw{
    TKMytaskViewController * vc = [TKMytaskViewController new];
    [[self viewController].navigationController pushViewController:vc animated:YES];
}

- (void)fangqirenwu{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_FQTASK];
    NSDictionary * dic = @{@"studentid":Me.ssid,@"missionid":_model.mission.ssid};
    //    NSDictionary * dic = @{@"studentid":@"12"};
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            TFameViewModel * model = [TFameViewModel mj_objectWithKeyValues:responseObject];
            if ([model.code isEqual:@200]) {
                [[self viewController].navigationController popViewControllerAnimated:YES];
            }else if ([model.code isEqual:@Notloggedin]){
                [self UpDengLu];
            }
        }else{
            
        }
    }];
}


- (void)setModel:(TAKALLModel *)model{
    _model = model;
    guize.model = model;
}
@end
