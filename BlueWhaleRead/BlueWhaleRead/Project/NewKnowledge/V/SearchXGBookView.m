//
//  SearchXGBookView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/2/15.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "SearchXGBookView.h"
#import "SearchXGBookTableView.h"

@implementation SearchXGBookView{
    SearchXGBookTableView * tableview;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addview];
    }
    return self;
}
- (void)addview{
    WS(ws);
    BaseLabel * title = [[BaseLabel alloc] initWithTxteColor:RGB(31, 31, 31) LabelFont:TextFontCu(14) TextAlignment:NSTextAlignmentLeft Text:@"相关书籍"];
    [self addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws).with.offset(LENGTH(17));
        make.top.mas_equalTo(ws).with.offset(LENGTH(14));
    }];
    
    UIImageView * imageView = [UIImageView new];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.image = UIIMAGE(@"箭头");
    [self addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(ws).with.offset(-LENGTH(17));
        make.centerY.mas_equalTo(title);
        make.size.mas_equalTo(CGSizeMake(LENGTH(20), LENGTH(20)));
        
    }];
    
    UIView * click = [UIView new];
    [self addSubview:click];
    [click mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws);
        make.bottom.mas_equalTo(title.mas_bottom).with.offset(LENGTH(17));
        make.right.mas_equalTo(ws);
        make.left.mas_equalTo(imageView.mas_left).with.offset(-LENGTH(17));
    }];
    
    click.userInteractionEnabled = YES;
    UITapGestureRecognizer *backtap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click)];
    //将手势添加到需要相应的view中去
    [click addGestureRecognizer:backtap];
    
    tableview = [SearchXGBookTableView new];
    tableview.allinter = 3;
    [self addSubview:tableview];
    [tableview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(title.mas_bottom).with.offset(LENGTH(17));
        make.left.and.right.mas_equalTo(ws);
        make.height.mas_equalTo(LENGTH(10));
        make.bottom.mas_equalTo(ws);
    }];
}
- (void)click{
    self.pushblock(2);
}
- (void)setItemarray:(NSMutableArray *)itemarray{
    _itemarray = itemarray;
    tableview.itemarray = itemarray;

}
@end
