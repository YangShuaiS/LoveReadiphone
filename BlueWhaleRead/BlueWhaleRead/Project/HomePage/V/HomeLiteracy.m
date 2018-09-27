//
//  HomeLiteracy.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/8.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "HomeLiteracy.h"

@implementation HomeLiteracy{
    FLAnimatedImageView * imageView;
    BaseLabel * title;
}

-(instancetype)init{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    imageView = [FLAnimatedImageView new];
    imageView.image = UIIMAGE(@"bg_识词量");
    [self addSubview:imageView];
    
    title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(7,97,120) LabelFont:TextFont(25) TextAlignment:NSTextAlignmentLeft Text:@""];
    [self addSubview:title];
    
    WS(ws);
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(ws);
    }];
    
}

- (void)setItemarray:(NSMutableArray *)itemarray{
    imageView.image = UIIMAGE(ZHANWEITU);
//    imageView.backgroundColor = RANDOMCOLOR;
    title.text = ZHANWEIZI;
    
}
- (void)setModel:(TestImgListModel *)model{
    _model = model;
    imageView.image = UIIMAGE(model.image);
    
    if ([model.image isEqualToString:@"bg_诵读检测"]) {
        title.text = @"敬请期待";
    }
//    [imageView sd_setImageWithURL:URLIMAGE(model.logo) placeholderImage:UIIMAGE(@"bg_识词量")];
}
@end
