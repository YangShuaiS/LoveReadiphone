//
//  SearchbookdataTableViewCell.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/2/20.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "SearchbookdataTableViewCell.h"
#import "SearchXGBookView.h"

@implementation SearchbookdataTableViewCell{
    SearchXGBookView * view;
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
    view = [SearchXGBookView new];
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
    if (_itemarray.count > 3) {
        inter = 3;
    }else{
        inter = _itemarray.count;
    }
    CGFloat height = LENGTH(51) + LENGTH(519)/3*inter;
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
