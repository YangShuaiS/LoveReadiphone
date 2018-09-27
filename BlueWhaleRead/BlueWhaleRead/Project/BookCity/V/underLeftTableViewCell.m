//
//  underLeftTableViewCell.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/3.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "underLeftTableViewCell.h"

@implementation underLeftTableViewCell{
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
    self.backgroundColor = RGB(244,249,249);
    
    imageView = [FLAnimatedImageView new];
    imageView.image = UIIMAGE(@"icon_书城_全部_未选中");

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
        make.left.equalTo(self->imageView.mas_right).with.offset(LENGTH(10));
    }];
    

    
}
- (void)setTypeModel:(CityTypeListModel *)TypeModel{
    _TypeModel = TypeModel;
    title.text = TypeModel.name;
    [imageView sd_setImageWithURL:URLIMAGE(TypeModel.logo) placeholderImage:UIIMAGE(@"icon_书城_全部_未选中")];

}
- (void)setOrderModel:(CityOrderBookModel *)orderModel{
    _orderModel = orderModel;
    title.text = orderModel.sort;

}
- (void)setFenjiModel:(BookFenjiModel *)fenjiModel{
    _fenjiModel = fenjiModel;
    title.text = fenjiModel.lv;
}
- (void)cellclick{
    self.backgroundColor = RGB(255,255,255);
    title.textColor = RGB(254,138,45);
    [imageView sd_setImageWithURL:URLIMAGE(_TypeModel.logo) placeholderImage:UIIMAGE(@"icon_书城_全部_未选中")];

//    imageView.image = UIIMAGE(@"icon_书城_全部_选中");
}
- (void)backcellclick{
    self.backgroundColor = RGB(244,249,249);
    title.textColor = RGB(52,52,52);
    [imageView sd_setImageWithURL:URLIMAGE(_TypeModel.logo) placeholderImage:UIIMAGE(@"icon_书城_全部_未选中")];
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
