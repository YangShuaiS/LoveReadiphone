//
//  VersionUpdateView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/5/8.
//  Copyright © 2019 YS. All rights reserved.
//

#import "VersionUpdateView.h"

@implementation VersionUpdateView{
    BaseLabel * label;
    UIView * v;
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
    self.backgroundColor = RGBA(0, 0, 0, 0.7);
    v = [UIView new];
    v.layer.cornerRadius = LENGTH(6);
    v.layer.masksToBounds = YES;
    [self addSubview:v];
    [v mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(ws);
    }];
    
    UIImageView * topimage = [UIImageView new];
    topimage.contentMode = UIViewContentModeScaleAspectFit;
    topimage.image = UIIMAGE(@"图层8");
    [v addSubview:topimage];
    [topimage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.and.top.mas_equalTo(self->v);
        make.size.mas_equalTo(CGSizeMake(LENGTH(304), LENGTH(172)));
    }];
    
    UIView * downv = [UIView new];
    downv.backgroundColor = [UIColor whiteColor];
    [v addSubview:downv];
    [downv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(topimage.mas_bottom);
        make.left.and.right.mas_equalTo(self->v);
        make.bottom.mas_equalTo(self->v);
    }];
    BaseLabel * title = [[BaseLabel alloc] initWithTxteColor:RGB(0, 0, 0) LabelFont:TextFontCu(16) TextAlignment:NSTextAlignmentLeft Text:@"发现新版本"];
    [downv addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self->v);
        make.top.mas_equalTo(topimage.mas_bottom).with.offset(LENGTH(0));
    }];
    
    label = [[BaseLabel alloc] initWithTxteColor:RGB(127, 127, 127) LabelFont:TextFont(14) TextAlignment:NSTextAlignmentLeft Text:@""];
    label.numberOfLines = 0;
    [downv addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(title.mas_bottom).with.offset(LENGTH(20));
        make.left.mas_equalTo(downv).with.offset(LENGTH(30));
        make.right.mas_equalTo(downv).with.offset(-LENGTH(30));
    }];
    
    BaseLabel * downlabel = [[BaseLabel alloc] initWithTxteColor:RGB(255, 255, 255) LabelFont:TextFontCu(14) TextAlignment:NSTextAlignmentCenter Text:@"立即升级"];
    downlabel.layer.masksToBounds = YES;
    downlabel.layer.cornerRadius = LENGTH(18);
    downlabel.backgroundColor = RGB(82,199,198);
    [downv addSubview:downlabel];
    [downlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->label.mas_bottom).with.offset(LENGTH(20));
        make.centerX.mas_equalTo(downv);
        make.bottom.mas_equalTo(downv).with.offset(-LENGTH(20));
        make.width.mas_equalTo(LENGTH(186));
        make.height.mas_equalTo(LENGTH(36));
    }];
    downlabel.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click)];
    [downlabel addGestureRecognizer:tap];
    

}
- (void)x{
    [self removeFromSuperview];
}
- (void)click{
    NSString * url ;
    url = [[NSString stringWithFormat:@"https://itunes.apple.com/cn/app/博万卷-学生中文课外阅读app/id1434054632?mt=8"] stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
}

- (void)setModel:(UpAppModel *)model{
    _model = model;
    label.text = model.updateInfo;
    NSInteger iosVersionCodes = [APP_BUILD integerValue];
    
    if ([model.iosVersionCode integerValue] > iosVersionCodes) {
        if ([model.isForceUpdate isEqualToString:@"1"]) {
        }else{
            UIImageView * x = [UIImageView new];
            x.contentMode = UIViewContentModeScaleAspectFit;
            x.image = UIIMAGE(@"icon_login_closebtn");
            [self addSubview:x];
            [x mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.mas_equalTo(self->v).with.offset(-LENGTH(14));
                make.top.mas_equalTo(self->v).with.offset(LENGTH(18));
                make.size.mas_equalTo(CGSizeMake(LENGTH(18), LENGTH(18)));
            }];
            
            x.userInteractionEnabled = YES;
            UITapGestureRecognizer * tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(x)];
            [x addGestureRecognizer:tap1];
        }
    }
//        [self qiangzhiup];
//        if ([model.isForceUpdate isEqualToString:@"1"]) {
//        }else{
//            [self willupview];
//        }
//    }else{
//        [self willupview];
//    }
}
@end
