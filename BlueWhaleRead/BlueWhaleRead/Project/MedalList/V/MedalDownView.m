//
//  MedalDownView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/9.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "MedalDownView.h"
@implementation MedalDownView{
    BaseLabel * titlelabel;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addView];
    }
    return self;
}
- (void)addView{
    
}

- (void)setStyle:(DownStyle)style{
    _style = style;
    switch (_style) {
        case DownStyleGoLightUp:
            [self LightUp];
            [self lightUp];
            break;
        case DownStyleLightUping:
            [self LightUping];
            [self lightUping];
            break;
        case DownStyleYiDianLiang:
            [self LightUping];
            [self lightEnd];
            break;
            
        default:
            break;
    }
}
- (void)LightUp{
    WS(ws);
    BaseView * view = [BaseView new];
    view.backgroundColor = RGBA(1,78,136,0.4);
    [self addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
        make.height.mas_equalTo(LENGTH(49));
    }];
    titlelabel = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:WhitColor LabelFont:TextFont(16) TextAlignment:NSTextAlignmentCenter Text:@""];
    titlelabel.backgroundColor = RGB(1,195,193);
    titlelabel.layer.masksToBounds = YES;
    titlelabel.layer.cornerRadius = LENGTH(40)/2;
    [self addSubview:titlelabel];
    [titlelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws).with.offset(LENGTH(30));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(30));
        make.centerY.mas_equalTo(view.mas_centerY);
        make.height.mas_equalTo(LENGTH(40));
    }];
    titlelabel.userInteractionEnabled = YES;
    UITapGestureRecognizer * tapGesture1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture1)];
    //将手势添加到需要相应的view中去
    [titlelabel addGestureRecognizer:tapGesture1];
}
- (void)lightUp{
    titlelabel.text = @"去点亮";
}


- (void)LightUping{
    WS(ws);
    BaseView * view = [BaseView new];
    view.backgroundColor = RGBA(1,78,136,0.4);
    [self addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws).with.offset(LENGTH(0));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(0));
        make.bottom.mas_equalTo(ws).with.offset(-LENGTH(0));
        make.height.mas_equalTo(LENGTH(49));
    }];
    titlelabel = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:WhitColor LabelFont:TextFont(16) TextAlignment:NSTextAlignmentCenter Text:@""];
    titlelabel.backgroundColor = RGB(1,195,193);
    titlelabel.layer.masksToBounds = YES;
    titlelabel.layer.cornerRadius = LENGTH(40)/2;
    [self addSubview:titlelabel];
    [titlelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws).with.offset(LENGTH(30));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(30));
        make.centerY.mas_equalTo(view.mas_centerY);
        make.height.mas_equalTo(LENGTH(40));
    }];
    titlelabel.userInteractionEnabled = YES;
    UITapGestureRecognizer * tapGesture1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture1)];
    //将手势添加到需要相应的view中去
    [titlelabel addGestureRecognizer:tapGesture1];
    
    _joinDown = [JoinDownView new];
    _joinDown.nav = self.nav;
    _joinDown.backgroundColor = RGBA(1,78,136,0.7);
    _joinDown.stylejia = 1;
    _joinDown.models = _model;
    _joinDown.itemarray = _itemarray;
    [self addSubview:_joinDown];
    [_joinDown mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws).with.offset(0);
        make.right.mas_equalTo(ws).with.offset(0);
        make.top.mas_equalTo(ws).with.offset(0);
        make.bottom.mas_equalTo(view.mas_top).with.offset(0);
        make.height.mas_equalTo(LENGTH(67));
    }];
    [_joinDown setBlock:^{
        [ws tapGesture1];
    }];
    
}
- (void)lightUping{
    titlelabel.text = @"点亮中";
}

- (void)lightEnd{
    titlelabel.text = @"已点亮";

}
- (void)tapGesture1{
    self.block();
}
- (void)setItemarray:(NSMutableArray *)itemarray{
    _itemarray = itemarray;
}
- (void)setModel:(MedalListXqModel *)model{
    _model = model;
}
@end
