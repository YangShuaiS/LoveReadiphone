//
//  SearchknowledgedataTableViewCell.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/2/20.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "SearchknowledgedataTableViewCell.h"
#import "SearchClassificationView.h"

@implementation SearchknowledgedataTableViewCell{
    SearchClassificationView * view;
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
    view = [SearchClassificationView new];
    [self addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
    [view setPushblock:^(NSInteger inter) {
        ws.pushblock(inter);
    }];
}
- (void)setItemarray:(NSMutableArray *)itemarray{    
    _itemarray = itemarray;
    view.itemarray = itemarray;
    NSInteger inter = 0;
    if (_itemarray.count <= 2) {
        inter =1;
    }else{
        inter = 2;
    }
//    else if (_itemarray.count <=4){
//        inter =2;
//    }
//    else{
//        CGFloat a = itemarray.count/2*1.0;
//        CGFloat viewcont = ceilf(a);
//        inter = viewcont;
//    }
    CGFloat height = LENGTH(51) + LENGTH(14)+ (LENGTH(162*0.610561)+LENGTH(15)+LENGTH(20)+LENGTH(5)+LENGTH(16))*inter + (inter-1)*LENGTH(7);
    [view mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(height);
    }];
    
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
