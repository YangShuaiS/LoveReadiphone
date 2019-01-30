//
//  TAKJPView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/1/11.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "TAKJPView.h"

@implementation TAKJPView{
    UIImageView * onejp;
    BaseLabel * onetitle;
    BaseLabel * onesubtitle;
}

//- (instancetype)init
//{
//    self = [super init];
//    if (self) {
//        [self addview];
//    }
//    return self;
//}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addview];
    }
    return self;
}

- (void)addview{
    self.backgroundColor = RGB(255,248,242);
    self.layer.shadowOpacity = 0.2;
    self.layer.shadowColor = RGB(250, 112, 0).CGColor;
    self.layer.shadowRadius = 10.0f;
    self.layer.shadowOffset = CGSizeMake(4.47,6.63);
    self.layer.cornerRadius = LENGTH(12);

    WS(ws);
    
    UIImageView * backimage = [UIImageView new];
    backimage.contentMode = UIViewContentModeScaleAspectFill;
    backimage.image = UIIMAGE(@"一等奖二等奖三等奖背景");
    backimage.layer.cornerRadius = LENGTH(12);
    backimage.layer.masksToBounds = YES;
    [self addSubview:backimage];
    
    onejp = [UIImageView new];
    onejp.layer.cornerRadius = LENGTH(12);
    onejp.layer.masksToBounds = YES;
    onejp.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:onejp];
    [onejp mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(ws);
        make.top.mas_equalTo(ws).with.offset(LENGTH(15));
        make.width.and.height.mas_equalTo(LENGTH(140));
    }];
    
    UIView * backv = [UIView new];
    backv.backgroundColor = RGB(255,192,132);
    backv.layer.masksToBounds = YES;
    backv.layer.cornerRadius = LENGTH(5);
    [self addSubview:backv];
    
    onetitle = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(115,77,32) LabelFont:TextFontCu(15) TextAlignment:NSTextAlignmentCenter Text:@"一等奖奖品"];
    [self addSubview:onetitle];
    [onetitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->onejp.mas_bottom).with.offset(LENGTH(2));
        make.centerX.mas_equalTo(self->onejp);
    }];
    
    [backv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self->onetitle.mas_bottom).with.offset(LENGTH(2));
        make.left.and.right.mas_equalTo(self->onetitle);
        make.height.mas_equalTo(LENGTH(10));
    }];
    
    onesubtitle = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(115,77,32) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentCenter Text:@"小米平衡车一台"];
    [self addSubview:onesubtitle];
    [onesubtitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->onetitle.mas_bottom).with.offset(LENGTH(11));
        make.centerX.mas_equalTo(self->onejp);
    }];
    
    [backimage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.and.bottom.mas_equalTo(ws);
    }];
}

- (void)setImage:(NSString *)image{
    _image = image;
    [onejp sd_setImageWithURL:URLIMAGE(image)];
}
- (void)setName:(NSString *)name{
    _name = name;
    onesubtitle.text = name;
}
- (void)setTitles:(NSString *)titles{
    _titles = titles;
    onetitle.text = titles;
}
@end
