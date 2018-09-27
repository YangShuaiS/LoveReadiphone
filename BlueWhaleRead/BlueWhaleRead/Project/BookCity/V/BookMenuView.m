//
//  BookMenuView.m
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/5/4.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BookMenuView.h"

@implementation BookMenuView{
    BaseLabel * sjlx;
    BaseLabel * ydfj;
    BaseLabel * mrpx;
    
    FLAnimatedImageView * oneImage;
    FLAnimatedImageView * twoImage;
    FLAnimatedImageView * threeImage;
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
    self.backgroundColor = RGB(234,244,244);
    BaseView * oneView = [BaseView new];
    [self addSubview:oneView];
    
    //添加手势
    UITapGestureRecognizer * tapGesture1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture1)];
    //将手势添加到需要相应的view中去
    [oneView addGestureRecognizer:tapGesture1];
    
    BaseView * centerView = [BaseView new];
    [self addSubview:centerView];
    
    //添加手势
    UITapGestureRecognizer * tapGesture2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture2)];
    //将手势添加到需要相应的view中去
    [centerView addGestureRecognizer:tapGesture2];
    
    BaseView * rightView = [BaseView new];
    [self addSubview:rightView];
    
    //添加手势
    UITapGestureRecognizer * tapGesture3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture3)];
    //将手势添加到需要相应的view中去
    [rightView addGestureRecognizer:tapGesture3];
    

    [oneView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(0);
        make.top.equalTo(ws).with.offset(0);
        make.bottom.equalTo(ws).with.offset(0);
        make.right.equalTo(centerView.mas_left).with.offset(0);
        make.width.mas_equalTo(centerView.mas_width);
    }];
    [centerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(oneView.mas_right).with.offset(0);
        make.top.equalTo(ws).with.offset(0);
        make.bottom.equalTo(ws).with.offset(0);
        make.right.equalTo(rightView.mas_left).with.offset(0);
        make.width.mas_equalTo(rightView.mas_width);
    }];
    [rightView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(centerView.mas_right).with.offset(0);
        make.top.equalTo(ws).with.offset(0);
        make.bottom.equalTo(ws).with.offset(0);
        make.right.equalTo(ws).with.offset(0);
    }];
    ydfj = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(4,51,50) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentLeft Text:@"阅读分级"];
    [centerView addSubview:ydfj];

    [ydfj mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(centerView);
    }];

    sjlx = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(4,51,50) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentLeft Text:@"书籍类型"];
    [oneView addSubview:sjlx];

    [sjlx mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(oneView);

    }];

    mrpx = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(4,51,50) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentLeft Text:@"默认排序"];
    [self addSubview:mrpx];

    [mrpx mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(rightView);
    }];
    
    
    oneImage = [FLAnimatedImageView new];
    oneImage.image = UIIMAGE(@"icon_下三角");
    [oneView addSubview:oneImage];
    
    twoImage = [FLAnimatedImageView new];
    twoImage.image = UIIMAGE(@"icon_下三角");
    [centerView addSubview:twoImage];
    
    threeImage = [FLAnimatedImageView new];
    threeImage.image = UIIMAGE(@"icon_下三角");
    [rightView addSubview:threeImage];
    
    [oneImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->ydfj.mas_right).with.offset(5);
        make.centerY.mas_equalTo(self->ydfj.mas_centerY);
        make.width.mas_equalTo(8);
        make.height.mas_equalTo(5);
    }];
    
    [twoImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->sjlx.mas_right).with.offset(5);
        make.centerY.mas_equalTo(self->sjlx.mas_centerY);
        make.width.mas_equalTo(8);
        make.height.mas_equalTo(5);
    }];
    
    [threeImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->mrpx.mas_right).with.offset(5);
        make.centerY.mas_equalTo(self->mrpx.mas_centerY);
        make.width.mas_equalTo(8);
        make.height.mas_equalTo(5);
    }];
}


- (void)tapGesture1{
    ydfj.textColor = RGB(4,51,50);
    oneImage.image = UIIMAGE(@"icon_下三角");
    
    mrpx.textColor = RGB(4,51,50);
    threeImage.image = UIIMAGE(@"icon_下三角");
    
    sjlx.textColor = RGB(254,138,45);
    twoImage.image = UIIMAGE(@"icon_上三角");
    
    [self.delegete BackButtonIndext:1];
}
- (void)tapGesture2{
    mrpx.textColor = RGB(4,51,50);
    threeImage.image = UIIMAGE(@"icon_下三角");
    
    sjlx.textColor = RGB(4,51,50);
    twoImage.image = UIIMAGE(@"icon_下三角");
    
    ydfj.textColor = RGB(254,138,45);
    oneImage.image = UIIMAGE(@"icon_上三角");
    [self.delegete BackButtonIndext:2];
}
- (void)tapGesture3{
    sjlx.textColor = RGB(4,51,50);
    twoImage.image = UIIMAGE(@"icon_下三角");
    
    ydfj.textColor = RGB(4,51,50);
    oneImage.image = UIIMAGE(@"icon_下三角");
    
    mrpx.textColor = RGB(254,138,45);
    threeImage.image = UIIMAGE(@"icon_上三角");
    [self.delegete BackButtonIndext:3];
}
- (void)Refresh:(NSInteger)Weizhi Title:(NSString *)string{
    if (Weizhi == 1) {
        sjlx.textColor = RGB(4,51,50);
        twoImage.image = UIIMAGE(@"icon_下三角");
        sjlx.text = string;
    }else if (Weizhi == 2){
        ydfj.textColor = RGB(4,51,50);
        oneImage.image = UIIMAGE(@"icon_下三角");
        ydfj.text = string;
    }else{
        mrpx.textColor = RGB(4,51,50);
        threeImage.image = UIIMAGE(@"icon_下三角");
        mrpx.text = string;
    }
}
- (void)UpText{
    sjlx.textColor = RGB(4,51,50);
    ydfj.textColor = RGB(4,51,50);
    mrpx.textColor = RGB(4,51,50);
    twoImage.image = UIIMAGE(@"icon_下三角");
    oneImage.image = UIIMAGE(@"icon_下三角");
    threeImage.image = UIIMAGE(@"icon_下三角");
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
