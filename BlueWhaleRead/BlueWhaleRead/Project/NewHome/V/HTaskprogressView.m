//
//  HTaskprogressView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/1/9.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "HTaskprogressView.h"

@implementation HTaskprogressView{
    CAShapeLayer * downlayer;
    CAShapeLayer * toplayer;
    BaseLabel * onelabel;
    
    UIView * onev;
    UIView * twov;
    UIView * threv;
    UIImageView * onedj;
    UIImageView * twodj;
    UIImageView * threedj;
    
    UIImageView * zxc;
    FLAnimatedImageView * jpview;
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

    jpview = [FLAnimatedImageView new];
    jpview.contentMode = UIViewContentModeScaleAspectFit;
    NSString  *filePath = [[NSBundle bundleWithPath:[[NSBundle mainBundle] bundlePath]]pathForResource:@"礼物盒" ofType:@"gif"];
    NSData  *imageData = [NSData dataWithContentsOfFile:filePath];
    jpview.animatedImage = [FLAnimatedImage animatedImageWithGIFData:imageData];
    [self addSubview:jpview];
    [jpview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(ws);
        make.width.and.height.mas_equalTo(LENGTH(50));
        
    }];
    
    zxc = [UIImageView new];
    zxc.contentMode = UIViewContentModeScaleAspectFit;
    zxc.image = UIIMAGE(@"小人儿");
    [self addSubview:zxc];
    [zxc mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(LENGTH(38));
        make.height.mas_equalTo(LENGTH(38));
        make.left.mas_equalTo(LENGTH(16));
    }];
    downlayer = [CAShapeLayer layer];
    downlayer.lineJoin = kCALineJoinRound;
    downlayer.lineCap = kCALineCapRound;
    downlayer.lineWidth = LENGTH(5);
    downlayer.fillColor = [UIColor clearColor].CGColor;
    [self.layer addSublayer:downlayer];
    
    toplayer = [CAShapeLayer layer];
    toplayer.lineJoin = kCALineJoinRound;
    toplayer.lineCap = kCALineCapRound;
    toplayer.shadowOpacity = 1;
    toplayer.shadowRadius = LENGTH(3);
    toplayer.shadowOffset = CGSizeMake(0,1);
    toplayer.lineWidth = LENGTH(5);
    toplayer.fillColor = [UIColor clearColor].CGColor;
    [self.layer addSublayer:toplayer];
    
    onev = [UIView new];
    onev.layer.masksToBounds = YES;
    onev.layer.cornerRadius = LENGTH(9);
    [self addSubview:onev];
    [onev mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->zxc.mas_bottom).with.offset(-LENGTH(6.5));
        make.left.mas_equalTo(LENGTH(16));
        make.width.and.height.mas_equalTo(LENGTH(18));
    }];
    onedj = [UIImageView new];
    onedj.contentMode = UIViewContentModeScaleAspectFit;
    [onev addSubview:onedj];
    [onedj mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self->onev);
        make.width.and.height.mas_equalTo(LENGTH(11));
    }];
    
    twov = [UIView new];
    twov.layer.masksToBounds = YES;
    twov.layer.cornerRadius = LENGTH(9);
    [self addSubview:twov];
    [twov mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->zxc.mas_bottom).with.offset(-LENGTH(6.5));
        make.width.and.height.mas_equalTo(LENGTH(18));
        make.centerX.mas_equalTo(ws);
    }];
    twodj = [UIImageView new];
    twodj.contentMode = UIViewContentModeScaleAspectFit;
    [twov addSubview:twodj];
    [twodj mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self->twov);
        make.width.and.height.mas_equalTo(LENGTH(11));
    }];
    
    threv = [UIView new];
    threv.layer.masksToBounds = YES;
    threv.layer.cornerRadius = LENGTH(9);
    [self addSubview:threv];
    [threv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->zxc.mas_bottom).with.offset(-LENGTH(6.5));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(16));
        make.bottom.mas_equalTo(ws).with.offset(-LENGTH(20));
        make.width.and.height.mas_equalTo(LENGTH(18));
    }];
    threedj = [UIImageView new];
    threedj.contentMode = UIViewContentModeScaleAspectFit;
    [threv addSubview:threedj];
    [threedj mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self->threv);
        make.width.and.height.mas_equalTo(LENGTH(11));
    }];
    
    onelabel = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(236,138,53) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentCenter Text:@"0%"];
    [self addSubview:onelabel];
    [onelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->threv.mas_bottom).with.offset(LENGTH(9));
        make.left.mas_equalTo(LENGTH(16));
    }];
}
- (void)setMission_type:(NSInteger)mission_type{
    _mission_type = mission_type;
    UIColor * downcolor;
    UIColor * topcolor;
    UIColor * yopshacolor;
    WS(ws);
    if (mission_type == 1) {
        [jpview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(ws);
        }];
        [zxc mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(ws).with.offset(LENGTH(18));
        }];
    }else{
        [jpview removeFromSuperview];
        [zxc mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(ws).with.offset(LENGTH(18));
        }];
    }
    if (_inter == 0) {
        downcolor = _colorarray[2];
        topcolor = _colorarray[1];
        yopshacolor = _colorarray[3];
        onelabel.textColor = _colorarray[0];
    }else{
        downcolor = _colorarray[1];
        topcolor = [UIColor whiteColor];
        yopshacolor = _colorarray[3];
        onelabel.textColor = [UIColor whiteColor];
    }
    downlayer.strokeColor = downcolor.CGColor;
    toplayer.strokeColor = topcolor.CGColor;
    toplayer.shadowColor = yopshacolor.CGColor;
    onev.backgroundColor = downcolor;
    twov.backgroundColor = downcolor;
    threv.backgroundColor = downcolor;
    [self.superview layoutIfNeeded];
    [self xian];

}

- (void)xian{
    UIBezierPath *downpath = [UIBezierPath bezierPath];
    CGPoint stars = CGPointMake(LENGTH(16)+LENGTH(9), zxc.frame.origin.y+zxc.frame.size.height+LENGTH(2.5));
    CGPoint ends = CGPointMake(self.frame.size.width-LENGTH(16)-LENGTH(9), zxc.frame.origin.y+zxc.frame.size.height+LENGTH(2.5));
    [downpath moveToPoint:stars];
    [downpath addLineToPoint:ends];
    downlayer.path = downpath.CGPath;
    
    CGFloat bili = _jindu/100.00;
    UIBezierPath *toppath = [UIBezierPath bezierPath];
    CGPoint starstop = CGPointMake(LENGTH(16)+LENGTH(9), zxc.frame.origin.y+zxc.frame.size.height+LENGTH(2.5));
    CGFloat toplayheig = self.frame.size.width-LENGTH(32)-LENGTH(18);
    toplayheig = toplayheig*bili;
    CGPoint endstop = CGPointMake(LENGTH(16)+LENGTH(9)+toplayheig, zxc.frame.origin.y+zxc.frame.size.height+LENGTH(2.5));
    [toppath moveToPoint:starstop];
    [toppath addLineToPoint:endstop];
    toplayer.path = toppath.CGPath;
    
    
    if (bili>0.0) {
        onedj.image = UIIMAGE(@"对勾白色");
        onedj.image = [onedj.image imageWithRenderingMode:(UIImageRenderingModeAlwaysTemplate)];
        
        if (_inter == 0) {
            onev.backgroundColor = _colorarray[1];
            onedj.tintColor = [UIColor whiteColor];
        }else{
            onev.backgroundColor = [UIColor whiteColor];
            onedj.tintColor = _colorarray[1];
        }
    }
    if (bili>=0.5){
        twodj.image = UIIMAGE(@"对勾白色");
        twodj.image = [twodj.image imageWithRenderingMode:(UIImageRenderingModeAlwaysTemplate)];
        if (_inter == 0) {
            twov.backgroundColor = _colorarray[1];
            twodj.tintColor = [UIColor whiteColor];
        }else{
            twov.backgroundColor = [UIColor whiteColor];
            twodj.tintColor = _colorarray[1];
        }
    }
    if (bili>=1){
        threedj.image = UIIMAGE(@"对勾白色");
        threedj.image = [threedj.image imageWithRenderingMode:(UIImageRenderingModeAlwaysTemplate)];
        
        if (_inter == 0) {
            threv.backgroundColor = _colorarray[1];
            threedj.tintColor = [UIColor whiteColor];
        }else{
            threv.backgroundColor = [UIColor whiteColor];
            threedj.tintColor = _colorarray[1];
        }
    }
    WS(ws);
    [UIView animateWithDuration:2 animations:^{
        [self->onelabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(ws).with.offset(LENGTH(16)+toplayheig);
        }];
        [self->zxc mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(ws).with.offset(LENGTH(16)+toplayheig);
        }];
        [self.superview layoutIfNeeded];
    } completion:^(BOOL finished) {
        
    }];
    
    onelabel.text = [NSString stringWithFormat:@"%.0f%%",_jindu];
}
- (void)layoutSubviews{
    [super layoutSubviews];
}
@end
