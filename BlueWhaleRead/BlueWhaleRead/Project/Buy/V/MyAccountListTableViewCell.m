//
//  MyAccountListTableViewCell.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/4/26.
//  Copyright © 2019 YS. All rights reserved.
//

#import "MyAccountListTableViewCell.h"

@implementation MyAccountListTableViewCell{
    BaseLabel * name;
    BaseLabel * money;
    BaseLabel * BuyTime;
    BaseLabel * Buyway;
    BaseLabel * order;
    UIView * downxian;
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
    name = [[BaseLabel alloc] initWithTxteColor:RGB(171,171,171) LabelFont:TextFont(12) TextAlignment:NSTextAlignmentLeft Text:@"购买商品：博万卷会员服务（年度会员）"];
    [self addSubview:name];
    [name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws).with.offset(LENGTH(20));
        make.left.mas_equalTo(ws).with.offset(LENGTH(14));
        make.right.mas_equalTo(ws).with.offset(LENGTH(14));
    }];
    
    money = [[BaseLabel alloc] initWithTxteColor:RGB(171,171,171) LabelFont:TextFont(12) TextAlignment:NSTextAlignmentLeft Text:@"购买金额：￥100"];
    [self addSubview:money];
    [money mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->name.mas_bottom).with.offset(LENGTH(6));
        make.left.mas_equalTo(ws).with.offset(LENGTH(14));
        make.right.mas_equalTo(ws).with.offset(LENGTH(14));
    }];
    
    BuyTime = [[BaseLabel alloc] initWithTxteColor:RGB(171,171,171) LabelFont:TextFont(12) TextAlignment:NSTextAlignmentLeft Text:@"购买时间：2019-09-12  13：20"];
    [self addSubview:BuyTime];
    [BuyTime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->money.mas_bottom).with.offset(LENGTH(6));
        make.left.mas_equalTo(ws).with.offset(LENGTH(14));
        make.right.mas_equalTo(ws).with.offset(LENGTH(14));
    }];
    
    Buyway = [[BaseLabel alloc] initWithTxteColor:RGB(171,171,171) LabelFont:TextFont(12) TextAlignment:NSTextAlignmentLeft Text:@"购买方式：兑换码"];
    [self addSubview:Buyway];
    [Buyway mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->BuyTime.mas_bottom).with.offset(LENGTH(6));
        make.left.mas_equalTo(ws).with.offset(LENGTH(14));
        make.right.mas_equalTo(ws).with.offset(LENGTH(14));
    }];
    
    order = [[BaseLabel alloc] initWithTxteColor:RGB(171,171,171) LabelFont:TextFont(12) TextAlignment:NSTextAlignmentLeft Text:@""];
    [self addSubview:order];
    [order mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->Buyway.mas_bottom).with.offset(LENGTH(6));
        make.left.mas_equalTo(ws).with.offset(LENGTH(14));
        make.right.mas_equalTo(ws).with.offset(LENGTH(14));
        make.bottom.mas_equalTo(ws).with.offset(-LENGTH(20));
    }];
    
    downxian = [UIView new];
    [self addSubview:downxian];
    [downxian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws).with.offset(LENGTH(14));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(14));
        make.bottom.mas_equalTo(ws);
        make.height.mas_equalTo(LENGTH(1));
    }];
}

- (void)setModel:(OrderModel *)model{
    _model = model;
    name.text = [NSString stringWithFormat:@"购买商品：博万卷会员服务（%@）",model.product_name];
    money.text = [NSString stringWithFormat:@"购买金额：￥%ld",model.payment_amount];
    BuyTime.text = [NSString stringWithFormat:@"购买时间：%@",model.payment_time];
    NSString * buywa = @"";
    if ([model.pay_method isEqualToString:@"1"]) {
        buywa = @"微信支付";
    }else if ([model.pay_method isEqualToString:@"2"]){
        buywa = @"苹果支付";
    }else if ([model.pay_method isEqualToString:@"3"]){
        buywa = @"兑换码";
    }else{
        buywa = @"免费获取";
    }
    Buyway.text = [NSString stringWithFormat:@"购买方式：%@",buywa];
    order.text = [NSString stringWithFormat:@"订单编号：%@",model.order_number];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self addBorderToLayer:downxian];

}
- (void)addBorderToLayer:(UIView *)view
{
    CAShapeLayer *border = [CAShapeLayer layer];
    //  线条颜色
    border.strokeColor = RGB(232,232,232).CGColor;
    border.fillColor = nil;
    UIBezierPath *pat = [UIBezierPath bezierPath];
    [pat moveToPoint:CGPointMake(0, 0)];
    if (CGRectGetWidth(view.frame) > CGRectGetHeight(view.frame)) {
        [pat addLineToPoint:CGPointMake(view.bounds.size.width, 0)];
    }else{
        [pat addLineToPoint:CGPointMake(0, view.bounds.size.height)];
    }
    border.path = pat.CGPath;
    
    border.frame = view.bounds;
    
    // 不要设太大 不然看不出效果
    border.lineWidth = 0.5;
    border.lineCap = @"butt";
    
    //  第一个是 线条长度   第二个是间距    nil时为实线
    border.lineDashPattern = @[@3, @2];
    
    [view.layer addSublayer:border];
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
