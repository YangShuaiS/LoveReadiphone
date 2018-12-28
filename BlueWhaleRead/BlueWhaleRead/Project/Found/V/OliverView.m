//
//  OliverView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/8.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "OliverView.h"

@implementation OliverView{
    FLAnimatedImageView * backView;
    BaseLabel * title;
    BaseLabel * subTitle;
}

-(instancetype)init{
    self = [super init];
    if (self) {
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    
//                self.layer.shadowOpacity = 0.7;
//                self.layer.shadowColor = [UIColor blackColor].CGColor;
//                self.layer.shadowRadius = 8.f;
//                self.layer.shadowOffset = CGSizeMake(0,0);
    
    backView = [FLAnimatedImageView new];
    backView.layer.cornerRadius = LENGTH(10);
    backView.layer.masksToBounds = YES;
    backView.image = UIIMAGE(ZHANWEITUWENZHANG);

    [self addSubview:backView];
    
    WS(ws);
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(LENGTH(14));
        make.top.equalTo(ws).with.offset(LENGTH(0));
        make.right.equalTo(ws).with.offset(-LENGTH(14));
        make.bottom.equalTo(ws).with.offset(-LENGTH(0));
        make.height.mas_equalTo(self->backView.mas_width).multipliedBy(0.306);
    }];
    
    title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(51,51,51) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentLeft Text:@""];
    title.numberOfLines = 3;
    [self addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->backView.mas_left).with.offset(LENGTH(26));
        make.right.mas_equalTo(self->backView.mas_right).with.offset(-LENGTH(26));
        make.top.mas_equalTo(LENGTH(20));
        make.bottom.mas_equalTo(self->backView).with.offset(-LENGTH(20));
    }];
    
//    NSString * str1 = @"北京市第二小学    朱摇摇 ";
//    subTitle = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:WhitColor LabelFont:[UIFont fontWithName:@"HYYaYaJ" size:FontSize(LENGTH(16))] TextAlignment:NSTextAlignmentLeft Text:str1];
//    [self addSubview:subTitle];
//    [subTitle mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(self->backView.mas_left).with.offset(LENGTH(53));
//        make.right.mas_equalTo(self->backView.mas_right).with.offset(-LENGTH(220));
//        make.bottom.mas_equalTo(self->backView).with.offset(-LENGTH(40));
//    }];
}

- (void)setModel:(FoundGoodArticleModel *)model{
    [backView sd_setImageWithURL:URLIMAGE(model.article_img) placeholderImage:UIIMAGE(ZHANWEITUWENZHANG)];
    title.text = model.content;

}
- (void)getAllFont{
//    NSArray *familyNames = [UIFont familyNames];
//    for( NSString *familyName in familyNames ){
//        NSArray *fontNames = [UIFont fontNamesForFamilyName:familyName];
//        for( NSString *fontName in fontNames ){
//        }
//    }
}
@end
