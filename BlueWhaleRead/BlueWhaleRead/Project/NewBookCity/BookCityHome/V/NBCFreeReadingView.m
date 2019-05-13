//
//  NBCFreeReadingView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/4/10.
//  Copyright © 2019 YS. All rights reserved.
//

#import "NBCFreeReadingView.h"
#import "NBCFreeBookViewController.h"
@implementation NBCFreeReadingView{
    BaseLabel * subtitle;
    NSMutableArray * bookarray;
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
    UIImageView * backimageview = [UIImageView new];
    backimageview.contentMode = UIViewContentModeScaleToFill;
    backimageview.image = UIIMAGE(@"免费阅读");
    backimageview.layer.masksToBounds = YES;
    backimageview.layer.cornerRadius = LENGTH(5);
    [self addSubview:backimageview];
    [backimageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws).with.offset(LENGTH(17));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(17));
        make.bottom.mas_equalTo(ws).with.offset(-LENGTH(14));
        make.height.mas_equalTo(LENGTH(100));
        make.top.mas_equalTo(ws).with.offset(LENGTH(28));
    }];
    
    BaseLabel * title = [[BaseLabel alloc] initWithTxteColor:RGB(116,98,85) LabelFont:TextFontCu(17) TextAlignment:NSTextAlignmentCenter Text:@"本周可免费阅读图书"];
    [backimageview addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(backimageview).with.offset(LENGTH(22));
        make.right.mas_equalTo(backimageview).with.offset(-LENGTH(30));
    }];
    
    UIImageView * jiantou = [UIImageView new];
    jiantou.contentMode = UIViewContentModeScaleAspectFit;
    jiantou.image = UIIMAGE(@"圆箭头");
    [backimageview addSubview:jiantou];
    [jiantou mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(backimageview).with.offset(-LENGTH(30));
        make.top.mas_equalTo(title.mas_bottom).with.offset(LENGTH(15));
        make.size.mas_equalTo(CGSizeMake(LENGTH(27), LENGTH(27)));
    }];
    
    subtitle = [[BaseLabel alloc] initWithTxteColor:RGB(116,98,85) LabelFont:TextFont(13) TextAlignment:NSTextAlignmentCenter Text:@"全部 (180)"];
    [backimageview addSubview:subtitle];
    [subtitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(jiantou.mas_left).with.offset(-LENGTH(14));
        make.centerY.mas_equalTo(jiantou);
    }];
    self.backgroundColor = [UIColor whiteColor];
    bookarray = [NSMutableArray array];
    for (int i = 0;  i< 3; i++) {
        UIImageView * imageView = [UIImageView new];
        imageView.backgroundColor = [UIColor whiteColor];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        imageView.image = UIIMAGE(@"发现_你的同学_书缺省位置");
        imageView.layer.shadowOpacity = 0.16;
        imageView.layer.shadowColor = [UIColor blackColor].CGColor;
        imageView.layer.shadowRadius = LENGTH(4);
        imageView.layer.shadowOffset = CGSizeMake(0,0);
        imageView.layer.cornerRadius = LENGTH(5);
        [self addSubview:imageView];
        [bookarray addObject:imageView];
        
        UIImageView * xian = [UIImageView new];
        xian.image = UIIMAGE(@"书线");
        [imageView addSubview:xian];
        [xian mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.and.bottom.and.left.mas_equalTo(imageView);
            make.width.mas_equalTo(LENGTH(9));
        }];
    }
    
    UIImageView * lastimageview ;
    for (int i = 0;  i< bookarray.count; i++) {
        UIImageView * imageView = bookarray[i];
        if (i == 0) {
            [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.mas_equalTo(title.mas_left).with.offset(-LENGTH(20));
                make.top.mas_equalTo(backimageview).with.offset(-LENGTH(11));
                make.size.mas_equalTo(CGSizeMake(LENGTH(62), LENGTH(89)));
            }];
        }else if (i == 1){
            [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.mas_equalTo(title.mas_left).with.offset(-LENGTH(40));
                make.top.mas_equalTo(backimageview).with.offset(-LENGTH(19));
                make.size.mas_equalTo(CGSizeMake(LENGTH(70), LENGTH(100)));
            }];
        }else{
            [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.mas_equalTo(title.mas_left).with.offset(-LENGTH(62));
                make.top.mas_equalTo(backimageview).with.offset(-LENGTH(28));
                make.size.mas_equalTo(CGSizeMake(LENGTH(78), LENGTH(111)));
            }];
        }
        lastimageview = imageView;
    }
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(push)];
    [self addGestureRecognizer:tap];
}

- (void)setModel:(NBCALLModel *)model{
    _model = model;
    NSMutableArray * array = model.freeBookList;
    for (int i = 0; i < array.count; i++) {
        if (i < 3) {
            AllBookListModel * model = array[i];
            UIImageView * imageView = bookarray[2-i];
            [imageView sd_setImageWithURL:URLIMAGE(model.cover)];
        }

    }
    [self removiewview:array.count];
    subtitle.text = [NSString stringWithFormat:@"全部 (%ld)",model.freeBookList.count];
}
- (void)removiewview:(NSInteger)inter{
    for (NSInteger i = inter; i < bookarray.count; i++) {
        if (i < 3) {
            UIImageView * imageView = bookarray[2-i];
            [imageView removeFromSuperview];
        }
    }
}

- (void)push{
    NBCFreeBookViewController * vc = [NBCFreeBookViewController new];
    vc.itemArray = _model.freeBookList;
    [[self viewController].navigationController pushViewController:vc animated:YES];
}
@end
