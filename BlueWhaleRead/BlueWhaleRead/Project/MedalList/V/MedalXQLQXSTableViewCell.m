//
//  MedalXQLQXSTableViewCell.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/13.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "MedalXQLQXSTableViewCell.h"
#import "MedalXQLQXSCellView.h"

@implementation MedalXQLQXSTableViewCell{
    MedalXQLQXSCellView * cellview;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self =  [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    return self;
}
- (void)setupUI{
    WS(ws);
    cellview = [MedalXQLQXSCellView new];
    [self addSubview:cellview];
    [cellview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(ws).with.insets(UIEdgeInsetsMake(LENGTH(0),LENGTH(5),LENGTH(6),LENGTH(5)));
    }];
    cellview.layer.shadowOpacity = 0.2;
    cellview.layer.shadowColor = [UIColor blackColor].CGColor;
    cellview.layer.shadowOffset = CGSizeMake(0,0);//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
    cellview.layer.shadowRadius = LENGTH(3);
}
- (void)setBooknumber:(NSInteger)Booknumber{
    _Booknumber = Booknumber;
    cellview.Booknumber = Booknumber;
}
- (void)setModel:(MedalStudentListModel *)model{
    _model = model;
    cellview.nav = self.nav;
    cellview.model = model;
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
