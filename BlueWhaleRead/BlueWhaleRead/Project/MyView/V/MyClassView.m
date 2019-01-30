//
//  MyClassView.m
//  BoWanJuanForPad
//
//  Created by 杨帅 on 2018/6/1.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "MyClassView.h"
#import "MyClassTableView.h"
#import "MyClassLabel.h"
@interface MyClassView ()
@property (strong, nonatomic) MyClassTableView *tableView;

@end
@implementation MyClassView{
    FLAnimatedImageView * imageView;
    MyClassLabel * Title;
    MyClassLabel * subTitle;
}

-(instancetype)init{
    self = [super init];
    if (self) {
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    WS(ws);
    imageView = [FLAnimatedImageView new];
    [self addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws);
        make.left.mas_equalTo(ws);
        make.right.mas_equalTo(ws);
        make.height.mas_equalTo(LENGTH(94));
    }];
    
    Title = [MyClassLabel new];
    Title.outLineWidth = 2;
    Title.outLinetextColor = [UIColor whiteColor];
    Title.labelTextColor = RGB(254,200,76);
    Title.font = [UIFont fontWithName:@"JSaoEr" size:FontSize(LENGTH(18))];
    Title.textAlignment = NSTextAlignmentCenter;
    [imageView addSubview:Title];
    [Title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self->imageView.mas_centerX);
        make.top.mas_equalTo(self->imageView.mas_top).with.offset(LENGTH(24));

    }];
    
    subTitle = [MyClassLabel new];
    subTitle.outLineWidth = 2;
    subTitle.outLinetextColor = [UIColor whiteColor];
    subTitle.labelTextColor = RGB(254,200,76);
    subTitle.font = [UIFont fontWithName:@"JSaoEr" size:FontSize(LENGTH(18))];
    subTitle.textAlignment = NSTextAlignmentCenter;
    [imageView addSubview:subTitle];
    [subTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self->imageView.mas_centerX);
        make.bottom.mas_equalTo(self->imageView.mas_bottom).with.offset(-LENGTH(24));
    }];
    
    
    
    _tableView = [MyClassTableView new];
    [self addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->imageView.mas_bottom).with.offset(0);
        make.left.equalTo(ws).with.offset(0);
        make.right.equalTo(ws).with.offset(0);
        make.bottom.equalTo(ws).with.offset(0);
    }];
    
}
- (void)setModel:(MyClassListModel *)model{
    _model = model;
    [imageView sd_setImageWithURL:URLIMAGE(model.myclassImg)];
    Title.text = model.school.name;
    subTitle.text = [NSString stringWithFormat:@"%@%@",model.grade.name,model.clazz.name];
}
- (void)setNav:(UINavigationController *)nav{
    _tableView.nav = nav;
}
- (void)setItemarray:(NSMutableArray *)itemarray{
    _itemarray = itemarray;
    _tableView.weizhi = _weizhi;
    _tableView.itemarray = itemarray;

}
@end
