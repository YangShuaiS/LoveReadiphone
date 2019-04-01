//
//  TPHBTableViewCell.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/30.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "TPHBTableViewCell.h"
#import "TPHBView.h"

@implementation TPHBTableViewCell{
    TPHBView * topView;
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
    topView = [TPHBView new];
    [self addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws).with.insets(UIEdgeInsetsMake(LENGTH(5), LENGTH(10), 0, LENGTH(10)));
    }];
}
- (void)setModel:(TFVUserModel *)model{
    _model = model;
    if ([_bianse isEqualToString:@"1"]) {
        if (_inter == 0) {
            topView.backgroundColor = RGB(254,246,220);
        }else{
            topView.backgroundColor = [UIColor whiteColor];
        }
    }else{
        topView.backgroundColor = [UIColor whiteColor];
    }
    topView.bianse = _bianse;
    topView.inter = _inter;
    topView.model = model;
    
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
