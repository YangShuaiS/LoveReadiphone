//
//  TKIssueTableViewCell.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/29.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "TKIssueTableViewCell.h"
#import "TKIssueView.h"
#import "TKIssueTwoView.h"
#import "TkIssueThreeView.h"
@implementation TKIssueTableViewCell{
    TKIssueView * oneview;
    TKIssueTwoView * twoview;
    TkIssueThreeView * threeview;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self =  [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        if ([reuseIdentifier isEqualToString:@"cell0"]) {
            [self addviewone];
        }else if ([reuseIdentifier isEqualToString:@"cell1"]){
            [self addviewtwo];
        }else if ([reuseIdentifier isEqualToString:@"cell2"]){
            [self addviewthree];
        }
    }
    return self;
}
- (void)addviewone{
    WS(ws);
    oneview = [TKIssueView new];
    [self addSubview:oneview];
    [oneview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
}

- (void)addviewtwo{
    WS(ws);
    twoview = [TKIssueTwoView new];
    [self addSubview:twoview];
    [twoview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
}

- (void)addviewthree{
    WS(ws);
    threeview = [TkIssueThreeView new];
    [self addSubview:threeview];
    [threeview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
}

- (void)setModel:(TKPWQpastLottery1InfoModel *)model{
    _model = model;
    oneview.model = model;
    twoview.model = model;
    threeview.model = model;
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
