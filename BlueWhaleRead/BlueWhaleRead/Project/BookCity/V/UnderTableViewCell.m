//
//  UnderTableViewCell.m
//  BoWanJuanForPad
//
//  Created by 杨帅 on 2018/6/1.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "UnderTableViewCell.h"

@implementation UnderTableViewCell{
    BaseLabel * title;
    FLAnimatedImageView * imageView;
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self =  [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self addview];
    }
    return self;
}
- (void)addview{
    WS(ws);

    imageView = [FLAnimatedImageView new];
//    imageView.backgroundColor = RANDOMCOLOR;
//    imageView.image = UIIMAGE(@"duigou");
    [self addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws).with.offset(LENGTH(17));
        make.top.mas_equalTo(ws).with.offset(LENGTH(14));
        make.bottom.mas_equalTo(ws).with.offset(-LENGTH(14));
        make.width.mas_equalTo(LENGTH(15));
        make.height.mas_equalTo(LENGTH(14));
    }];
    
    title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(52,52,52) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentCenter Text:@""];
    [self addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(ws);
        make.left.equalTo(ws).with.offset(LENGTH(22));
    }];
    
}


- (void)setTypeModel:(CityTypeListModel *)TypeModel{
    _TypeModel = TypeModel;
    title.text = TypeModel.name;
    if (TypeModel.type == 0) {
        title.textColor = RGB(52,52,52);
        imageView.hidden = YES;
    }else{
        title.textColor = RGB(82,199,198);
        imageView.hidden = NO;
    }
}
- (void)setOrderModel:(CityOrderBookModel *)orderModel{
    _orderModel = orderModel;
    title.text = orderModel.sort;
    if (orderModel.type == 0) {
        title.textColor = RGB(52,52,52);
        imageView.hidden = YES;
    }else{
        title.textColor = RGB(82,199,198);
        imageView.hidden = NO;
    }
}
- (void)setFenjiModel:(BookFenjiModel *)fenjiModel{
    _fenjiModel = fenjiModel;
    title.text = fenjiModel.lv;
    if (fenjiModel.type == 0) {
        title.textColor = RGB(52,52,52);
        imageView.hidden = YES;
    }else{
        title.textColor = RGB(82,199,198);
        imageView.hidden = NO;
    }
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
