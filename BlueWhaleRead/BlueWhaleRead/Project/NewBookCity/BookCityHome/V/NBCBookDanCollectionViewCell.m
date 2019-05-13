//
//  NBCBookDanCollectionViewCell.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/4/11.
//  Copyright © 2019 YS. All rights reserved.
//

#import "NBCBookDanCollectionViewCell.h"
#import "NBCBookDanTableView.h"

@implementation NBCBookDanCollectionViewCell{
    UIImageView * imageView;
    BaseLabel * title;
    BaseLabel * subtitle;
    NBCBookDanTableView * tableview;
}
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    WS(ws);
    self.layer.shadowOpacity = 1;
    self.layer.shadowColor = RGBA(47,52,71,0.1).CGColor;
    self.layer.shadowRadius = LENGTH(12);
    self.layer.shadowOffset = CGSizeMake(0,LENGTH(9));
    
    UIView * backview = [UIView new];
    backview.layer.masksToBounds = YES;
    backview.backgroundColor = [UIColor whiteColor];
    backview.layer.cornerRadius = LENGTH(5);
    [self addSubview:backview];
    [backview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
    
    imageView = [UIImageView new];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.backgroundColor = RGB(153,153,153);
    [backview addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.and.top.mas_equalTo(backview);
        make.height.mas_equalTo(LENGTH(76));
    }];
    
    UIView * v= [UIView new];
    v.backgroundColor = RGBA(0, 0, 0, 0.52);
    [imageView addSubview:v];
    [v mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self->imageView);
    }];
    
    title = [[BaseLabel alloc] initWithTxteColor:RGB(255, 255, 255) LabelFont:TextFontCu(18) TextAlignment:NSTextAlignmentLeft Text:@"书单"];
    [imageView addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->imageView).with.offset(LENGTH(19));
        make.left.mas_equalTo(self->imageView).with.offset(LENGTH(14));
        make.right.mas_equalTo(self->imageView).with.offset(-LENGTH(14));
    }];
    
    subtitle = [[BaseLabel alloc] initWithTxteColor:RGB(255, 255, 255) LabelFont:TextFont(12) TextAlignment:NSTextAlignmentLeft Text:@"推荐图书 | 共0册"];
    [imageView addSubview:subtitle];
    [subtitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->title.mas_bottom).with.offset(LENGTH(11));
        make.left.mas_equalTo(self->imageView).with.offset(LENGTH(14));
        make.right.mas_equalTo(self->imageView).with.offset(-LENGTH(14));
    }];
    
    tableview = [NBCBookDanTableView new];
    tableview.userInteractionEnabled = NO;
    [backview addSubview:tableview];
    [tableview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.mas_equalTo(backview);
        make.top.mas_equalTo(self->imageView.mas_bottom).with.offset(LENGTH(18));
        make.bottom.mas_equalTo(backview);
    }];
    
}

- (void)setModel:(NBCclassificationModel *)model{
    _model = model;
    [imageView sd_setImageWithURL:URLIMAGE(model.rank_theme_img)];
    tableview.itemArray = model.bookList;
    title.text = model.name;
    subtitle.text = [NSString stringWithFormat:@"推荐图书 | 共%@册",model.bookCount];
}
@end
