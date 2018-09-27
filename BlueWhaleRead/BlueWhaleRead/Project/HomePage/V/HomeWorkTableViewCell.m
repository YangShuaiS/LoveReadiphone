//
//  HomeWorkTableViewCell.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/23.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "HomeWorkTableViewCell.h"

@implementation HomeWorkTableViewCell{
    BaseLabel * title;
    BaseLabel * time;
//    FLAnimatedImageView * userimage;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self =  [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addview];
    }
    return self;
}
- (void)addview{
    self.backgroundColor = [UIColor clearColor];
    time = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:ChangYongTitLe LabelFont:TextFont(11) TextAlignment:NSTextAlignmentRight Text:@""];
    [self addSubview:time];
    
//    userimage = [FLAnimatedImageView new];
//    userimage.image = UIIMAGE(ZHANWEITUTX);
//    userimage.layer.masksToBounds = YES;
//    userimage.layer.cornerRadius = LENGTH(7);
//    [self addSubview:userimage];
    
    title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:ChangYongTitLe LabelFont:TextFont(12) TextAlignment:NSTextAlignmentLeft Text:@""];
    [self addSubview:title];
    
    WS(ws);
    [time mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(ws).with.offset(-LENGTH(11.5));
//        make.centerY.mas_equalTo(self->userimage.mas_centerY);
        make.centerY.mas_equalTo(ws);
    }];
    
//    [userimage mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(ws).with.offset(0);
//        make.centerY.mas_equalTo(ws);
//        make.height.mas_offset(LENGTH(28));
//        make.width.mas_offset(LENGTH(28));
//    }];
    
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(0);
        make.right.equalTo(self->time.mas_left).with.offset(-LENGTH(6));
        make.centerY.mas_equalTo(ws);
    }];
}
- (void)setModel:(DynamicListModel *)model{
    //    rightImage.text = model.time;
//    UIImage * img;
//    if (model.sex == 1) {
//        img = UIIMAGE(ZHANWEITUTXN);
//    }else{
//        img = UIIMAGE(ZHANWEITUTXV);
//    }
//    [userimage sd_setImageWithURL:URLIMAGE(model.avatar) placeholderImage:img];
//    
    if ([model.dynamic.milestone isEqualToString:@""]) {
        title.text = [NSString stringWithFormat:@"%@刚刚完成了""%@""勋章",model.name,model.dynamic.name];
    }else{
        title.text = [NSString stringWithFormat:@"%@刚刚完成了第%@个里程碑",model.name,model.dynamic.milestone];
    }
    time.text = [BaseObject TiemArray:model.dynamic.create_time String:@" "][0];
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
