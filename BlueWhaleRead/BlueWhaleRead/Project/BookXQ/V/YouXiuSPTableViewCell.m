//
//  YouXiuSPTableViewCell.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/13.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "YouXiuSPTableViewCell.h"
#import "YouXiuShuPingView.h"

@implementation YouXiuSPTableViewCell{
    YouXiuShuPingView * msdd;
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
//    frame.size.height = frame.size.height - LENGTH(0);
//    [super setFrame:frame];
//
//}
- (void)setupUI{
    WS(ws);
    
    msdd = [YouXiuShuPingView new];
    msdd.backgroundColor = [UIColor whiteColor];
    [self addSubview:msdd];
    [msdd mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws).with.insets(UIEdgeInsetsMake(LENGTH(5), LENGTH(5), LENGTH(5), LENGTH(5)));
    }];
    [msdd setBlock:^{
        ws.block();
    }];
}
- (void)layoutSubviews{
    [super layoutSubviews];
    msdd.layer.shadowOpacity = 0.2;
    msdd.layer.shadowColor = [UIColor blackColor].CGColor;
    msdd.layer.shadowOffset = CGSizeMake(0,0);//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
    msdd.layer.shadowRadius = LENGTH(5);
    //    self.layer.masksToBounds = YES;
    msdd.layer.cornerRadius = LENGTH(3);
}
- (void)setModel:(BookXQBookReview *)model{
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
