//
//  MyFavoritesDownView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/3/21.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "MyFavoritesDownView.h"

@implementation MyFavoritesDownView{
    UIImageView * dg;
    NSInteger inter;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        inter = 0;
        [self addview];
    }
    return self;
}

- (void)addview{
    WS(ws);
    self.backgroundColor = [UIColor whiteColor];
    UIView * xian = [UIView new];
    xian.backgroundColor = RGB(235,235,235);
    [self addSubview:xian];
    [xian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.and.right.mas_equalTo(ws);
        make.height.mas_equalTo(1);
    }];
    
    UIView * dgview = [UIView new];
    dgview.layer.cornerRadius = LENGTH(3);
    dgview.layer.borderColor = RGB(204,204,204).CGColor;
    dgview.layer.borderWidth = 1;
    [self addSubview:dgview];
    [dgview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws).with.offset(LENGTH(16));
        make.left.mas_equalTo(ws).with.offset(LENGTH(20));
        make.size.mas_equalTo(CGSizeMake(LENGTH(18), LENGTH(18)));
    }];
    
    BaseLabel * qxuan = [[BaseLabel alloc] initWithTxteColor:RGB(102,102,102) LabelFont:TextFont(14) TextAlignment:NSTextAlignmentLeft Text:@"全选"];
    [self addSubview:qxuan];
    [qxuan mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(dgview);
        make.left.mas_equalTo(dgview.mas_right).with.offset(LENGTH(10));
    }];
    
    dg = [UIImageView new];
    dg.contentMode = UIViewContentModeScaleAspectFit;
    [dgview addSubview:dg];
    [dg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(dgview);
        make.size.mas_equalTo(CGSizeMake(LENGTH(11), LENGTH(7)));
    }];
    
    UIView * allxuan = [UIView new];
    [self addSubview:allxuan];
    [allxuan mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.top.and.bottom.mas_equalTo(ws);
        make.width.mas_equalTo(LENGTH(100));
    }];
    allxuan.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(quanxuan)];
    [allxuan addGestureRecognizer:tap];
    
    BaseLabel * shanchu = [[BaseLabel alloc] initWithTxteColor:RGB(255,255,255) LabelFont:TextFont(14) TextAlignment:NSTextAlignmentCenter Text:@"删除"];
    shanchu.layer.masksToBounds = YES;
    shanchu.layer.cornerRadius = LENGTH(15);
    shanchu.backgroundColor = RGB(82,198,197);
    [self addSubview:shanchu];
    [shanchu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(dgview);
        make.right.mas_equalTo(ws).with.offset(-LENGTH(20));
        make.size.mas_equalTo(CGSizeMake(LENGTH(68), LENGTH(30)));
    }];
    
    shanchu.userInteractionEnabled = YES;
    UITapGestureRecognizer * shanchutap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(shanchu)];
    [shanchu addGestureRecognizer:shanchutap];
}
- (void)quanxuan{
    if (inter == 0) {
        dg.image = UIIMAGE(@"全选");
        inter = 1;
    }else{
        inter = 0;
        dg.image = UIIMAGE(@"");
    }
    self.block();
}

- (void)shanchu{
    [self yichushooucang];
    inter = 0;
    dg.image = UIIMAGE(@"");
}

- (void)yichushooucang{
    NSString * str = @"";
    NSInteger inter = 0;
    for (int i = 0; i < _itemarray.count; i++) {
        NKRKnowledgeModel * model = _itemarray[i];
        if (model.duigou == 1) {
            if (inter == 0) {
                inter ++;
                str = [str stringByAppendingString:model.ssid];
            }else{
                str = [str stringByAppendingString:[NSString stringWithFormat:@",%@",model.ssid]];
            }
        }
    }

    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_YICHUSHOUCANGZHISHITU];
    NSDictionary * dic = @{@"delids":str,@"studentid":Me.ssid};
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            LunBoTuXQModel * model = [LunBoTuXQModel mj_objectWithKeyValues:responseObject];
            if ([model.code isEqual:@200]) {
                self.blocks();
            }
        }else{
            
        }
    }];
}
@end
