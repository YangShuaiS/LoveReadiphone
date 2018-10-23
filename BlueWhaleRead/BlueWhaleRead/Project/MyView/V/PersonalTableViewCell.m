//
//  PersonalTableViewCell.m
//  BoWanJuanForPad
//
//  Created by 杨帅 on 2018/6/5.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "PersonalTableViewCell.h"
#import "PersonTopView.h"
#import "PersonDownView.h"
@implementation PersonalTableViewCell{
    PersonTopView * topview;
    PersonDownView * downView;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier ViewStyle:(ViewStyle)styles{
    self =  [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addview:styles];
    }
    return self;
}
- (void)addview:(ViewStyle)style{
    switch (style) {
            case ViewTopStyle:
            [self top];
            break;
            case ViewDownClickStyle:
            [self down];
            [self downclick];
            break;
            case ViewDownStyle:
            [self down];
            downView.jt = NO;
            break;
            case ViewDownSwith:
            [self down];
            [self swith];
            break;
        default:
            break;
    }
}
- (void)top{
    WS(ws);
    topview = [PersonTopView new];
    [self addSubview:topview];
    [topview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
}
- (void)setModel:(MyZiLiaoModel *)model{
    _model = model;
    topview.model = model;
}
- (void)down{
    WS(ws);
    downView = [PersonDownView new];
    [self addSubview:downView];
    [downView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];

}

- (void)downclick{
    WS(ws);
    FLAnimatedImageView * rightview = [FLAnimatedImageView new];
    rightview.image = UIIMAGE(@"icon_个人资料_箭头");
    [self addSubview:rightview];
    [rightview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self->downView.mas_centerY);
        make.right.mas_equalTo(ws).with.offset(-LENGTH(28));
        make.width.mas_equalTo(LENGTH(8));
        make.height.mas_equalTo(LENGTH(14));
    }];
    
}

- (void)swith{
    WS(ws);
    UISwitch *switchView = [UISwitch new];
    switchView.on = NO;//设置初始为ON的一边
    switchView.onTintColor = RGB(90,196,192);
    [switchView addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];   // 开关事件切换通知
    [self addSubview: switchView];
    [switchView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(ws);
        make.right.mas_equalTo(ws).with.offset(-LENGTH(21));
        make.width.mas_equalTo(LENGTH(56));
        make.height.mas_equalTo(LENGTH(34));
    }];

}
-(void)switchAction:(id)sender
{
    UISwitch *switchButton = (UISwitch*)sender;
    BOOL isButtonOn = [switchButton isOn];
    if (isButtonOn) {
        switchButton.on = YES;
    }else {
        switchButton.on = NO;
    }
}

- (void)setTitle:(NSString *)title{
    _title = title;
    downView.title = title;
}

- (void)setSubtitle:(NSString *)subtitle{
    _subtitle = subtitle;
    downView.subtitle = subtitle;
}
- (void)setNav:(UINavigationController *)nav{
    if(topview!=nil){
        topview.nav = nav;
    }
    if(downView!=nil){
        downView.nav = nav;
    }
}
- (void)setBaseview:(UIView *)baseview{
    if(topview!=nil){
        topview.baseview = baseview;
    }
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
