//
//  NBClistAllView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/7.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "NBClistAllView.h"
#import "NBCmenuView.h"
#import "HomeActivityViewController.h"
@implementation NBClistAllView{
    NSMutableArray * viewarray;
    
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
    NBCmenuView * menu = [NBCmenuView new];
    menu.label.text = @"名校书单";
//    menu.styles = NBCmenuViewStyleimage;
    [self addSubview:menu];
    [menu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.and.right.mas_equalTo(ws);
    }];
    [menu setBlock:^{
        [ws push];
    }];
    
    viewarray = [NSMutableArray array];
    UIImageView * lastimageview;
    for (int i = 0 ; i < 8; i++) {
        UIImageView * imageview = [UIImageView new];
        imageview.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:imageview];
        if (i == 0) {
            [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(menu.mas_bottom);
                make.left.mas_equalTo(ws).with.offset(LENGTH(38));
                make.width.mas_equalTo(LENGTH(141));
            }];
        }else if (i == 1){
            [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(menu.mas_bottom);
                make.left.mas_equalTo(lastimageview.mas_right).with.offset(LENGTH(23));
                make.width.mas_equalTo(LENGTH(145));
            }];
        }else if (i == 2){
            [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(lastimageview.mas_bottom).with.offset(LENGTH(15));
                make.left.mas_equalTo(ws).with.offset(LENGTH(21));
                make.width.mas_equalTo(LENGTH(169));
            }];
        }else if (i == 3){
            [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(lastimageview);
                make.left.mas_equalTo(lastimageview.mas_right).with.offset(LENGTH(16));
                make.width.mas_equalTo(LENGTH(142));
            }];
        }else if (i == 4){
            [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(lastimageview.mas_bottom).with.offset(LENGTH(15));
                make.left.mas_equalTo(ws).with.offset(LENGTH(27));
                make.width.mas_equalTo(LENGTH(145));
            }];
        }else if (i == 5){
            [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(lastimageview);
                make.left.mas_equalTo(lastimageview.mas_right).with.offset(LENGTH(13));
                make.width.mas_equalTo(LENGTH(169));
            }];
        }else if (i == 6){
            [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(lastimageview.mas_bottom).with.offset(LENGTH(15));
                make.left.mas_equalTo(ws).with.offset(LENGTH(21));
                make.width.mas_equalTo(LENGTH(169));
            }];
        }else if (i == 7){
            [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(lastimageview);
                make.left.mas_equalTo(lastimageview.mas_right).with.offset(LENGTH(12));
                make.width.mas_equalTo(LENGTH(142));
                make.bottom.mas_equalTo(ws).with.offset(-LENGTH(15));
            }];
        }
        [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(LENGTH(38));
        }];
        imageview.userInteractionEnabled = self;
        BaseButton * oneButton = [BaseButton buttonWithType:UIButtonTypeCustom];
        [oneButton addTarget:self action:@selector(oneButton:) forControlEvents:UIControlEventTouchUpInside];
        oneButton.tag = 100+i;
        [imageview addSubview:oneButton];
        [oneButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(imageview);
        }];
        lastimageview = imageview;
        [viewarray addObject:imageview];
    }

}
- (void)push{
}
- (void)setModel:(NBCALLModel *)model{
    _model = model;
    
    for (int i = 0 ; i <  model.rankList.count; i++) {
        NBCclassificationModel * mo = model.rankList[i];
        UIImageView * image = viewarray[i];
        [image sd_setImageWithURL:URLIMAGE(mo.rank_theme_img)];
    }
}
- (void)oneButton:(BaseButton * )button{
    NSInteger i = button.tag-100;
    NBCclassificationModel * mode = _model.rankList[i];
    HomeActivityViewController * vc = [HomeActivityViewController new];
    vc.hiden = YES;
    vc.itemid = mode.ssid;
    [[self viewController].navigationController pushViewController:vc animated:YES];

}
@end
