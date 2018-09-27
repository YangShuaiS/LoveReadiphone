//
//  DCCycleScrollViewCell.m
//  DCCycleScrollView
//
//  Created by cheyr on 2018/2/27.
//  Copyright © 2018年 cheyr. All rights reserved.
//

#import "DCCycleScrollViewCell.h"
#import <AVFoundation/AVFoundation.h>
#import "FiendOrMedalView.h"
@interface DCCycleScrollViewCell()

@end

@implementation DCCycleScrollViewCell{
    BaseLabel * title;
    BaseLabel * name;
    BaseLabel * zaidu;
    
    FiendOrMedalView * touxiang;

}

-(instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
//            self.layer.shadowOpacity = 0.5;
//            self.layer.shadowColor = [UIColor blackColor].CGColor;
//            self.layer.shadowRadius = 8.f;
//            self.layer.shadowOffset = CGSizeMake(4,4);
        
        FLAnimatedImageView * view = [FLAnimatedImageView new];
        view.image = UIIMAGE(@"bg_同学最爱");
        view.contentMode = UIViewContentModeScaleAspectFill;
        view.frame = self.bounds;
        view.layer.cornerRadius = LENGTH(5);
//        view.layer.borderWidth = 1;
//        view.layer.borderColor = [UIColor blackColor].CGColor;
//        view.layer.backgroundColor = [[UIColor colorWithRed:255.0f/255.0f green:255.0f/255.0f blue:255.0f/255.0f alpha:1.0f] CGColor];
//        view.alpha = 1;
        [self addSubview:view];
//
        
        [self addSubview:self.imageView];
        
        title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:WhitColor LabelFont:TextFont(17) TextAlignment:NSTextAlignmentLeft Text:@""];
        [self addSubview:title];
        
        name = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:WhitColor LabelFont:TextFont(13) TextAlignment:NSTextAlignmentLeft Text:@""];
        [self addSubview:name];
        
        zaidu = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:WhitColor LabelFont:TextFont(11) TextAlignment:NSTextAlignmentLeft Text:@""];
        [self addSubview:zaidu];
        
        
        
        _imageView.layer.masksToBounds = YES;
//        _imageView.layer.cornerRadius = LENGTH(10);
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        _imageView.image = UIIMAGE(ZHANWEITUSHU);
        WS(ws);
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(view.mas_left).with.offset(LENGTH(19));
            make.top.mas_equalTo(view.mas_top).with.offset(LENGTH(22));
            make.bottom.mas_equalTo(view.mas_bottom).with.offset(-LENGTH(22));
            make.width.mas_equalTo(LENGTH(55));
        }];
        
        [title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(ws.imageView.mas_top).with.offset(LENGTH(3.5));
            make.left.mas_equalTo(ws.imageView.mas_right).with.offset(LENGTH(12.5));
            make.width.mas_equalTo(140);
//            make.right.mas_equalTo(self->zaidu.mas_left).with.offset(-LENGTH(10));

        }];
        
        [name mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self->title.mas_bottom).with.offset(LENGTH(2.5));
            make.left.mas_equalTo(ws.imageView.mas_right).with.offset(LENGTH(12.5));
            make.right.mas_equalTo(ws.mas_right).with.offset(-LENGTH(10));

        }];
        
        [zaidu mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.mas_equalTo(view.mas_top).with.offset(LENGTH(22.5));
            make.centerY.mas_equalTo(self->title);
            make.right.mas_equalTo(view.mas_right).with.offset(-LENGTH(14));
        }];
        
        UICollectionViewFlowLayout *flowLayouts = [[UICollectionViewFlowLayout alloc] init];
        flowLayouts.itemSize = CGSizeMake(LENGTH(23),LENGTH(23));
        //定义每个UICollectionView 横向的间距
        flowLayouts.minimumLineSpacing = LENGTH(2);
        //定义每个UICollectionView 纵向的间距
        flowLayouts.minimumInteritemSpacing = LENGTH(2);
        //定义每个UICollectionView 的边距距
        flowLayouts.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);//上左下右
        flowLayouts.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        touxiang = [[FiendOrMedalView alloc] initWithLayOut:flowLayouts];
        touxiang.backgroundColor = [UIColor clearColor];
        [self addSubview:touxiang];
        [touxiang mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(ws.imageView.mas_right).with.offset(LENGTH(12.5));
            make.right.equalTo(view.mas_right).with.offset(-LENGTH(43));
            make.bottom.equalTo(ws.imageView.mas_bottom).with.offset(LENGTH(5));
            make.height.mas_equalTo(LENGTH(23));
        }];
        
//        FriendTouXIangView * touxiang = [FriendTouXIangView new];
//        //    view.backgroundColor = RANDOMCOLOR;
//        NSMutableArray * a = [NSMutableArray array];
//        for (int i=0; i<60;i++) {
//            [a addObject:@"123"];
//        }
//        touxiang.itemarray = a;
//        [self addSubview:touxiang];
//
//        [touxiang mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.mas_equalTo(ws.imageView.mas_right).with.offset(LENGTH(25));
//            make.right.equalTo(view.mas_right).with.offset(-LENGTH(43));
//            make.bottom.equalTo(ws.imageView.mas_bottom).with.offset(-LENGTH(2));
//        }];
        
        
        
        
//        self.imageView.frame = view.frame;
//        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.imageView.bounds cornerRadius:self.imgCornerRadius];
//        CAShapeLayer *maskLayer = [[CAShapeLayer alloc]init];
//        //设置大小
//        maskLayer.frame = self.bounds;
//        //设置图形样子
//        maskLayer.path = maskPath.CGPath;
//        view.layer.mask = maskLayer;
    }
    return self;
}
- (void)setNav:(UINavigationController *)nav{
    touxiang.nav = nav;
}
-(UIImageView *)imageView
{
    if(_imageView == nil)
    {
        _imageView = [[UIImageView alloc]init];
    }
    return _imageView;
}

- (void)setModel:(FoundLikeBookModel *)model{
    _model = model;
    [_imageView sd_setImageWithURL:URLIMAGE(model.cover) placeholderImage:UIIMAGE(ZHANWEITUSHU)];
    title.text = model.name;
    name.text = model.author;
    zaidu.text = [NSString stringWithFormat:@"%lu个好友在读",(unsigned long)model.bookStudentList.count];
    touxiang.itemarray = model.bookStudentList;
}
@end
