//
//  MingShiDDTableViewCell.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/12.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "MingShiDDTableViewCell.h"
#import "MingShiDDView.h"
@implementation MingShiDDTableViewCell{
    MingShiDDView * msdd;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self =  [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    return self;
}
//- (void)setFrame:(CGRect)frame{
//    frame.origin.x =  frame.origin.x + LENGTH(5);
//    frame.origin.y =  frame.origin.y + LENGTH(5);
//    frame.size.width = frame.size.width - LENGTH(10);
//    frame.size.height = frame.size.height - LENGTH(10);
//    [super setFrame:frame];
//    
//}
- (void)setupUI{
    WS(ws);
    msdd = [MingShiDDView new];
    msdd.backgroundColor = RGB(254,243,213);
    [self addSubview:msdd];
    [msdd mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.mas_equalTo(ws);
        make.left.mas_equalTo(ws).with.offset(LENGTH(5));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(5));
        make.top.mas_equalTo(ws).with.offset(LENGTH(10));
        make.bottom.mas_equalTo(ws).with.offset(-LENGTH(10));

    }];
    [msdd setBlock:^{
        ws.block();
    }];
}
- (void)setModel:(BookXQReadThoughtModel *)model{
    msdd.model = model;

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
