//
//  SzScXXCollectionViewCell.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/5.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "SzScXXCollectionViewCell.h"

@implementation SzScXXCollectionViewCell
{
    BaseLabel * namelabel;
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
    self.backgroundColor = WhitColor;
    self.layer.borderColor = WhitColor.CGColor;
    self.layer.borderWidth = LENGTH(2);
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = LENGTH(10);
    
    namelabel = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(85,137,230) LabelFont:TextFont(17) TextAlignment:NSTextAlignmentCenter Text:@""];
    namelabel.numberOfLines = 0;
    [self addSubview:namelabel];
    
    [namelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
}

- (void)setModel:(SZLListModel *)model{
    _model = model;
    namelabel.text = model.LiteracyWord;
}
- (void)color{
    self.backgroundColor = RGB(254,165,79);
    namelabel.textColor = WhitColor;
}
- (void)backcolor{
    self.backgroundColor = WhitColor;
    namelabel.textColor = RGB(85,137,230);
}
@end
