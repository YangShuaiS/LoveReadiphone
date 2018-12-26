//
//  TKChooseCollectionViewCell.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/4.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "TKChooseCollectionViewCell.h"

@implementation TKChooseCollectionViewCell{
    BaseLabel * title;
}
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    WS(ws);
    self.layer.borderColor = RGB(73,172,171).CGColor;
    self.layer.borderWidth = LENGTH(1);
    title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(49,87,86) LabelFont:TextFont(14) TextAlignment:NSTextAlignmentCenter Text:@""];
    [self addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
}

- (void)setString:(NSString *)string{
    _string = string;
    title.text = string;
}
- (void)xz{
    self.backgroundColor = RGB(73,172,171);
}
- (void)wxz{
    self.backgroundColor = [UIColor whiteColor];
}

- (void)setModel:(TKbuiltModel *)model{
    _model = model;
    title.text = model.name;
    if ([model.style isEqualToString:@"1"]) {
        [self xz];
    }else{
        [self wxz];
    }
}
@end
