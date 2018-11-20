//
//  NBCGoodBookListTableViewCell.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/7.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "NBCGoodBookListTableViewCell.h"
#import "NBCGoodBookView.h"

@implementation NBCGoodBookListTableViewCell{
    NBCGoodBookView * goodbook;
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
    goodbook = [NBCGoodBookView new];
    [self addSubview:goodbook];
    [goodbook mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
}
- (void)setModel:(TypeListModel *)model{
    _model = model;
    goodbook.nav= self.nav;
    goodbook.model = model;
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
