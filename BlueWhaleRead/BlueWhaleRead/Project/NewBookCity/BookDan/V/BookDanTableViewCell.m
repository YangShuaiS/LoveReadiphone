//
//  BookDanTableViewCell.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/6.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BookDanTableViewCell.h"
#import "BookDanView.h"
@implementation BookDanTableViewCell{
    BookDanView * view;
    BaseLabel * sz;
    
    BaseLabel * lb;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self =  [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addview];
    }
    return self;
}
- (void)addview{
    WS(ws);
    sz = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(223,239,236) LabelFont:TextFont(94) TextAlignment:NSTextAlignmentCenter Text:@""];
    sz.adjustsFontSizeToFitWidth = YES;
//    sz.backgroundColor = [UIColor redColor];
    [self addSubview:sz];
    [sz mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws);
        make.left.mas_equalTo(-LENGTH(10));
        make.width.mas_equalTo(LENGTH(74)+LENGTH(20));
        make.height.mas_equalTo(LENGTH(100));
    }];
    

    
    view = [BookDanView new];
    [self addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws).with.offset(LENGTH(50));
        make.right.and.top.and.bottom.mas_equalTo(ws);
    }];
    
    lb = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(109,142,136) LabelFont:TextFont(16) TextAlignment:NSTextAlignmentRight Text:@""];
    lb.numberOfLines = 2;
    [self addSubview:lb];
    [lb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->sz.mas_bottom);
        make.right.mas_equalTo(self->view.mas_left).with.offset(LENGTH(12));
        make.width.mas_equalTo(LENGTH(34));
    }];
}
- (void)setDj:(NSString *)dj{
    _dj = dj;
    sz.text = dj;
}
- (void)setModel:(CityBookListModel *)model{
    _model = model;
    lb.text = model.catalogs;
//    view.bookCase = BookCaseStyleHomeYD;
    view.model = _model;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
