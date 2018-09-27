//
//  JInDuHeadImage.m
//  BoWanJuanForPad
//
//  Created by 杨帅 on 2018/5/29.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "JInDuHeadImage.h"
@interface JInDuHeadImage()

@property (nonatomic, strong) CAShapeLayer *circleLayer;
@property (nonatomic, strong) UIBezierPath *path;

@end
@implementation JInDuHeadImage{
    FLAnimatedImageView * backimage;
}

-(instancetype)init{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    WS(ws);
    _touxiang = [FLAnimatedImageView new];
    _touxiang.layer.masksToBounds = YES;
    _touxiang.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:_touxiang];
    [_touxiang mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws).with.offset(LENGTH(0));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(0));
        make.top.mas_equalTo(ws).with.offset(LENGTH(0));
        make.bottom.mas_equalTo(ws).with.offset(-LENGTH(0));

//        make.height.mas_equalTo(ws.mas_width).multipliedBy(0.8678);
//        make.edges.mas_equalTo(ws);
    }];
    
    backimage = [FLAnimatedImageView new];
    backimage.layer.masksToBounds = YES;
    backimage.contentMode = UIViewContentModeScaleAspectFit;
    [_touxiang addSubview:backimage];
    [backimage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws.touxiang);
    }];
    
    self.circleLayer = [CAShapeLayer layer];
    self.circleLayer.strokeEnd = 1;
    self.circleLayer.strokeColor = [[UIColor colorWithRed:6.0f/255.0f green:6.0f/255.0f blue:6.0f/255.0f alpha:0.5f] CGColor];
    self.circleLayer.fillColor = [UIColor clearColor].CGColor;
    [_touxiang.layer addSublayer:self.circleLayer];
//
}
- (void)layoutSubviews{
    [super layoutSubviews];
    _touxiang.layer.cornerRadius = _touxiang.frame.size.width/2;
//    if (!_path) {
//        CGFloat width = self.frame.size.width;
//        CGPoint center = CGPointMake(width/2, width/2);
//        _path = [UIBezierPath bezierPathWithArcCenter:center radius:(width/2 - _progressWidth/2) startAngle:-M_PI_2 endAngle:3*M_PI/2 clockwise:YES];
//        self.circleLayer.path = _path.CGPath;
//    }
//    self.circleLayer.lineWidth = _progressWidth;
 
}

- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;

    CGPoint center = CGPointMake(width/2, height/2);
    UIBezierPath *progressPath = [UIBezierPath bezierPathWithArcCenter:center radius:(width)/ 2 startAngle:- M_PI_2 endAngle: -M_PI*5/2 clockwise:NO];
    self.circleLayer.lineWidth = width;
    self.circleLayer.frame = self.bounds;
    self.circleLayer.path = progressPath.CGPath;


}
- (void)setProgressColor:(UIColor *)progressColor {
//    self.circleLayer.strokeColor = progressColor.CGColor;
}
- (void)setProgress:(CGFloat)progress {
    _progress = MIN(1, MAX(0, progress));
    self.circleLayer.strokeEnd = _progress;
    
//    if (_progress>=0&&_progress<=0.13) {
//        if (_progress == 0) {
//        }else{
//            backimage.image = UIIMAGE(@"78");
//        }
//    }else if (_progress>0.13&&_progress<=0.25){
//        backimage.image = UIIMAGE(@"68");
//    }else if (_progress>0.25&&_progress<=0.38){
//        backimage.image = UIIMAGE(@"58");
//    }else if (_progress>0.38&&_progress<=0.5){
//        backimage.image = UIIMAGE(@"48");
//    }else if (_progress>0.5&&_progress<=0.63){
//        backimage.image = UIIMAGE(@"38");
//    }else if (_progress>0.63&&_progress<=0.75){
//        backimage.image = UIIMAGE(@"28");
//    }else if (_progress>0.75&&_progress<=1){
//        if (_progress==1) {
//            backimage.image = UIIMAGE(@"88");
//
//        }else{
//            backimage.image = UIIMAGE(@"18");
//
//        }
//    }
//
//    WS(ws);
//    if (_progress == 0) {
//        _touxiang.contentMode = UIViewContentModeScaleAspectFit;
//
//        [_touxiang mas_remakeConstraints:^(MASConstraintMaker *make) {
//            make.top.mas_equalTo(ws).with.offset(LENGTH(0));
//            make.left.mas_equalTo(ws).with.offset(LENGTH(0));
//            make.right.mas_equalTo(ws).with.offset(-LENGTH(0));
//            //                    make.bottom.mas_equalTo(ws).with.offset(-LENGTH(5));
//            make.height.mas_equalTo(ws.mas_width).multipliedBy(0.8678);
//        }];
//    }else{
//        _touxiang.contentMode = UIViewContentModeScaleAspectFill;
//
//        [_touxiang mas_remakeConstraints:^(MASConstraintMaker *make) {
//            make.edges.mas_equalTo(ws);
//        }];
//    }
    
}
- (void)setProgressWidth:(CGFloat)progressWidth {
    _progressWidth = progressWidth;

}

-(void)setUpjl:(NSInteger)upjl{
    _upjl = upjl;
    WS(ws);
    [_touxiang mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws).with.offset(LENGTH(upjl));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(upjl));
        make.top.mas_equalTo(ws).with.offset(LENGTH(upjl));
        make.bottom.mas_equalTo(ws).with.offset(-LENGTH(upjl));
    }];
}
@end
