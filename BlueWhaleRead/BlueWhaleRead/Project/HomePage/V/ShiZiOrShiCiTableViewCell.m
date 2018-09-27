//
//  ShiZiOrShiCiTableViewCell.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/27.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "ShiZiOrShiCiTableViewCell.h"
#import "DTShiZiCiView.h"
@implementation ShiZiOrShiCiTableViewCell{
    DTShiZiCiView * dtsz;
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    dtsz = [DTShiZiCiView new];
    dtsz.delegate = self;
    [self addSubview:dtsz];
    WS(ws);
    [dtsz mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
}
- (void)setEndCell:(NSInteger)EndCell{
    _EndCell = EndCell;
    dtsz.EndCell = _EndCell;
}
- (void)setStyle:(DaTiStyle)style{
    _style = style;
    switch (style) {
        case DTSHiZiOrShiCi:
            dtsz.inter = 0;

            break;
        case DTSHiZiOrShiCiTu:
            dtsz.inter = 1;

            break;
        default:
            break;
    }
}

- (void)setSzorci:(SZLListModel *)szorci{
    _szorci = szorci;
    switch (_style) {
        case DTSHiZiOrShiCi:
            dtsz.model = szorci;
            break;
        case DTSHiZiOrShiCiTu:
            dtsz.model = szorci;
            break;
        default:
            break;
    }
}

- (void)setScorci:(SCLListMOdel *)scorci{
    _scorci = scorci;
    switch (_style) {
        case DTSHiZiOrShiCi:
            dtsz.scmodel = scorci;
            break;
        case DTSHiZiOrShiCiTu:
            dtsz.scmodel = scorci;
            break;
        default:
            break;
    }
}
#pragma mark ------- 点击事件
- (void)PushFriendViewCOntroller:(PushModel *)model{
    self.clickTag(model);
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}



@end
