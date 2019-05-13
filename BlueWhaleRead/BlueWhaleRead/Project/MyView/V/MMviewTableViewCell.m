//
//  MMviewTopTableViewCell.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/28.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "MMviewTableViewCell.h"

@implementation MMviewTableViewCell{
    FLAnimatedImageView * imageview;
    BaseLabel * name;
    UIView * dowxxian;
    
    BaseLabel * rightlabel;
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
    self.backgroundColor = [UIColor clearColor];
    imageview = [FLAnimatedImageView new];
    imageview.contentMode = UIViewContentModeScaleAspectFit;
//    imageview.backgroundColor = RANDOMCOLOR;
    [self addSubview:imageview];
    [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(LENGTH(17));
        make.top.mas_equalTo(ws).with.offset(LENGTH(16));
        make.bottom.mas_equalTo(ws).with.offset(-LENGTH(16));
        make.width.and.height.mas_equalTo(LENGTH(26));
    }];
    
    name = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(38, 38, 38) LabelFont:TextFont(13) TextAlignment:NSTextAlignmentLeft Text:@""];
    [self addSubview:name];
    [name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->imageview.mas_right).with.offset(LENGTH(8));
        make.centerY.mas_equalTo(ws);
    }];
    
    dowxxian = [UIView new];
    dowxxian.backgroundColor = RGB(229,229,229);
    [self addSubview:dowxxian];
    [dowxxian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(ws).with.offset(-1);
        make.height.mas_equalTo(1);
        make.left.mas_equalTo(ws).with.offset(LENGTH(25));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(25));
    }];
    
    FLAnimatedImageView * bakimage = [FLAnimatedImageView new];
    bakimage.image = UIIMAGE(@"MY箭头");
    [self addSubview:bakimage];
    [bakimage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(ws.mas_right).with.offset(-LENGTH(17));
        make.centerY.mas_equalTo(ws);
        make.width.mas_equalTo(LENGTH(6));
        make.height.mas_equalTo(LENGTH(10));
    }];
    
    rightlabel = [[BaseLabel alloc] initWithTxteColor:RGB(255,99,99) LabelFont:TextFont(12) TextAlignment:NSTextAlignmentRight Text:@"免费获得vip"];
    [self addSubview:rightlabel];
    [rightlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(bakimage.mas_left).with.offset(-LENGTH(8));
        make.centerY.mas_equalTo(bakimage);
    }];
    rightlabel.hidden = YES;
    
}

- (void)setNamestring:(NSString *)namestring{
    _namestring = namestring;
    name.text = namestring;
}
- (void)setImagestring:(NSString *)imagestring{
    _imagestring = imagestring;
    imageview.image = UIIMAGE(imagestring);
}

- (void)setInter:(NSInteger)inter{
    _inter = inter;
    if (inter == 6 && dowxxian.hidden == NO) {
        dowxxian.hidden = YES;
    }else if (dowxxian.hidden == YES){
        dowxxian.hidden = NO;
    }
    
    if (inter == 1) {
        rightlabel.textColor = RGB(255,99,99);
        rightlabel.hidden = NO;
        rightlabel.text = @"免费获得vip";
    }else if (inter == 5){
        rightlabel.hidden = NO;
        NSInteger iosVersionCodes = [APP_BUILD integerValue];
        
        if (iosVersionCode > iosVersionCodes) {
            rightlabel.textColor = RGB(255,99,99);
            rightlabel.text = @"去更新";
        }else{
            rightlabel.textColor = RGB(171,171,171);
            rightlabel.text = @"已是最新版";
        }

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
