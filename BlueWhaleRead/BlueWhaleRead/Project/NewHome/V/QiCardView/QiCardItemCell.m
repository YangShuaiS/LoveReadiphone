//
//  QiCardItemCell.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/4/14.
//  Copyright © 2019 YS. All rights reserved.
//

#import "QiCardItemCell.h"

@implementation QiCardItemCell{
    UIImageView * imageView;
    BaseLabel * time;
    BaseLabel * title;
    BaseLabel * LoveNum;
    UIImageView * Love;
    UIImageView * Share;
    BaseLabel * downlabel;
}
- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor whiteColor];
        [self addview];
    }
    return self;
}
- (void)addview{
    WS(ws);
    UIView * backView = [UIView new];
    backView.layer.cornerRadius = LENGTH(10);
    backView.layer.masksToBounds = YES;
    self.layer.shadowColor = RGB(48, 48, 48).CGColor;
    self.layer.shadowOffset = CGSizeMake(0,5);//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
    self.layer.shadowRadius = 24;
    self.layer.shadowOpacity = 0.26;
    self.backgroundColor = [UIColor whiteColor];
    self.layer.cornerRadius = LENGTH(10);

    [self addSubview:backView];
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
    
    imageView = [UIImageView new];
    imageView.layer.masksToBounds = YES;
    imageView.backgroundColor = RGB(152, 152, 152);
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    [backView addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.and.top.mas_equalTo(backView);
        make.height.mas_equalTo(LENGTH(183));
    }];
    
    time = [[BaseLabel alloc] initWithTxteColor:RGBA(152, 152, 152, 1) LabelFont:TextFont(13) TextAlignment:NSTextAlignmentLeft Text:@"2019/4/20"];
    [backView addSubview:time];
    [time mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->imageView.mas_bottom).with.offset(LENGTH(18));
        make.left.mas_equalTo(ws).with.offset(LENGTH(19));
    }];
    
    title = [[BaseLabel alloc] initWithTxteColor:RGBA(3, 3, 3, 1) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentLeft Text:@"乐观是希望的明灯，它指引着你从危险峡谷中步向坦途。\n使你得到新的生命新的希望，支持着你的理想永不泯灭。"];
    title.numberOfLines = 0;
    [backView addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(self->time.mas_bottom).with.offset(LENGTH(18));
        make.height.mas_equalTo(LENGTH(206)-LENGTH(18));
        make.left.mas_equalTo(backView).with.offset(LENGTH(19));
        make.right.mas_equalTo(backView).with.offset(-LENGTH(19));
        make.bottom.mas_equalTo(backView).with.offset(-LENGTH(67));
    }];
    
    downlabel = [[BaseLabel alloc] initWithTxteColor:RGBA(3, 3, 3, 1) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentRight Text:@""];
    [backView addSubview:downlabel];
    [downlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        //        make.top.mas_equalTo(self->time.mas_bottom).with.offset(LENGTH(18));
        make.right.mas_equalTo(backView).with.offset(-LENGTH(19));
        make.bottom.mas_equalTo(self->title.mas_bottom);
    }];
    
    
    UIView * v = [UIView new];
    [backView addSubview:v];
    [v mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.and.bottom.mas_equalTo(backView);
        make.height.mas_equalTo(LENGTH(57));
    }];
    
    Love = [UIImageView new];
    Love.contentMode = UIViewContentModeScaleAspectFit;
    Love.image = UIIMAGE(@"收藏-");
    [v addSubview:Love];
    [Love mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(v);
        make.left.mas_equalTo(v).with.offset(LENGTH(16));
        make.size.mas_equalTo(CGSizeMake(LENGTH(21), LENGTH(19)));
    }];
    
    LoveNum = [[BaseLabel alloc] initWithTxteColor:RGBA(152, 152, 152, 1) LabelFont:TextFont(13) TextAlignment:NSTextAlignmentLeft Text:@"298"];
    [backView addSubview:LoveNum];
    [LoveNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(v);
        make.left.mas_equalTo(self->Love.mas_right).with.offset(LENGTH(8));
    }];
    
    UIButton * lovebutton = [UIButton buttonWithType:UIButtonTypeCustom];
    [lovebutton addTarget:self action:@selector(lovebutton:) forControlEvents:UIControlEventTouchUpInside];
    [backView addSubview:lovebutton];
    [lovebutton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self->Love).with.insets(UIEdgeInsetsMake(-LENGTH(5), -LENGTH(5), -LENGTH(5), -LENGTH(50)));
    }];
    
    
    Share = [UIImageView new];
    Share.contentMode = UIViewContentModeScaleAspectFit;
    Share.image = UIIMAGE(@"转发");
    [v addSubview:Share];
    [Share mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(v);
        make.right.mas_equalTo(v).with.offset(-LENGTH(16));
        make.size.mas_equalTo(CGSizeMake(LENGTH(21), LENGTH(19)));
    }];
    
    _button = [UIButton buttonWithType:UIButtonTypeCustom];
    [_button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [backView addSubview:_button];
    [_button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self->Share).with.insets(UIEdgeInsetsMake(-LENGTH(5), -LENGTH(5), -LENGTH(5), -LENGTH(5)));
    }];
}
- (void)buttonClicked:(UIButton *)sender {
    
    if (_buttonClicked) {
        _buttonClicked(sender);
    }
}

- (void)lovebutton:(UIButton *)sender{
    if (_model.is_collect == 0) {
        [self shoucang];
    }else{
        [self yichushooucang];
    }
}

- (void)setModel:(NHProverbModel *)model{
    _model = model;
    [imageView sd_setImageWithURL:URLIMAGE(model.img)];
    time.text = [NSString stringWithFormat:@"%ld/%ld/%ld",model.timedate.year,model.timedate.month,model.timedate.day];
    title.text = model.content;
    if (model.is_collect == 0) {
        Love.image = UIIMAGE(@"收藏-");
    }else{
        Love.image = UIIMAGE(@"收藏-成功");
    }
    LoveNum.text = [NSString stringWithFormat:@"%ld",model.collection_num];
    if ([model.author isEqualToString:@""]) {
        
    }else{
        downlabel.text = [NSString stringWithFormat:@"—— %@",model.author];
    }
}

- (void)shoucang{
    WS(ws);
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_SHOUCANGZHISHITU];
    NSDictionary * dic = @{@"studentid":Me.ssid,@"collectionid":_model.ssid,@"collection_type":@"3"};
    [[BaseAppRequestManager manager] PostNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            UserLoginModel * m = [UserLoginModel mj_objectWithKeyValues:responseObject];
            if ([m.code isEqual:@200]) {
                ws.model.collection_num++;
                self->Love.image = UIIMAGE(@"收藏-成功");
                self->LoveNum.text = [NSString stringWithFormat:@"%ld",ws.model.collection_num];
                ws.model.is_collect = 1;
                MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[[[UIApplication sharedApplication] delegate] window]  animated:YES];
                hud.label.text = @"收藏成功";
                hud.mode = MBProgressHUDModeCustomView;
                UIImage *image = [[UIImage imageNamed:@"收藏成功"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
                UIImageView *imgView = [[UIImageView alloc] initWithImage:image];
                hud.customView = imgView;
                hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
                hud.bezelView.color = [UIColor colorWithWhite:0.0 alpha:0.8];
                //文字颜色
                hud.contentColor = [UIColor whiteColor];
                hud.animationType = MBProgressHUDAnimationFade;
                [hud hideAnimated:YES afterDelay:1];
            }
        }
    }];
}
- (void)yichushooucang{
    WS(ws);
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_YICHUSHOUCANGZHISHITU];
    NSDictionary * dic = @{@"delids":_model.ssid,@"studentid":Me.ssid};
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            LunBoTuXQModel * model = [LunBoTuXQModel mj_objectWithKeyValues:responseObject];
            if ([model.code isEqual:@200]) {
                ws.model.collection_num--;
                self->Love.image = UIIMAGE(@"收藏-");
                self->LoveNum.text = [NSString stringWithFormat:@"%ld",ws.model.collection_num];
                ws.model.is_collect = 0;
                MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[[[UIApplication sharedApplication] delegate] window]  animated:YES];
                hud.label.text = @"取消收藏";
                hud.mode = MBProgressHUDModeCustomView;
                UIImage *image = [[UIImage imageNamed:@"取消收藏"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
                UIImageView *imgView = [[UIImageView alloc] initWithImage:image];
                hud.customView = imgView;
                hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
                hud.bezelView.color = [UIColor colorWithWhite:0.0 alpha:0.8];
                //文字颜色
                hud.contentColor = [UIColor whiteColor];
                hud.animationType = MBProgressHUDAnimationFade;
                [hud hideAnimated:YES afterDelay:1];
            }
        }else{
            
        }
    }];
}

- (void)layoutSubviews{
    [super layoutSubviews];
}
@end
