//
//  ZhiShiShuOneDownView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/9/28.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "ZhiShiShuOneDownView.h"
#import "ZhiShiShuQiuView.h"
@implementation ZhiShiShuOneDownView{
    BaseLabel * label;
    UIImageView * imageview;
    
    ZhiShiShuQiuView * zssqiu;
    
    NSArray * jcarray;
    NSArray * zrarray;
    NSArray * rwarray;
    NSArray * mxarray;
    NSArray * kjarray;

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
    
    imageview = [UIImageView new];
    imageview.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:imageview];
    [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(ws);
        make.top.mas_equalTo(ws);
        make.width.mas_equalTo(LENGTH(85)*1.5);
        make.height.mas_equalTo(LENGTH(43)*1.5);
    }];
    
    label = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(102,102,102) LabelFont:TextFontCu(20) TextAlignment:NSTextAlignmentCenter Text:@""];
    [imageview addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.center.mas_equalTo(self->imageview);
        make.centerY.mas_equalTo(self->imageview).with.offset(-LENGTH(5));
        make.centerX.mas_equalTo(self->imageview);
    }];

    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(LENGTH(62),LENGTH(62));
    //定义每个UICollectionView 横向的间距
    flowLayout.minimumLineSpacing = LENGTH(3);
    //定义每个UICollectionView 纵向的间距
    flowLayout.minimumInteritemSpacing = LENGTH(22);
    //定义每个UICollectionView 的边距距
    flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);//上左下右
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    zssqiu = [[ZhiShiShuQiuView alloc] initWithFrame:CGRectMake(0, 0, 0,0) collectionViewLayout:flowLayout];
    [self addSubview:zssqiu];
    [zssqiu mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(ws).with.offset(0);
        make.top.equalTo(self->imageview.mas_bottom).with.offset(LENGTH(8));
//        make.right.equalTo(ws).with.offset(0);
        make.height.mas_equalTo(LENGTH(62));
        make.centerX.mas_equalTo(ws);
        make.bottom.equalTo(ws).with.offset(LENGTH(0));
        
    }];
//    jcarray = @[@"文学语言",@"基础进阶"];
//    zrarray = @[@"宇宙航天",@"地理环境",@"生物生命",@"百科科普"];
//    rwarray = @[@"历史社会",@"文明见证",@"文化创造",@"经济财商",@"成长教育"];
//    mxarray = @[@"美术视觉",@"表演艺术",@"诗歌韵文",@"生活艺术"];
//    kjarray = @[@"工业机械",@"探索未来"];
}

- (void)setDownstyle:(DownStyle)downstyle{
    _downstyle = downstyle;
    zssqiu.nav = self.nav;
//    jcarray = @[@"基础进阶",@"文学语言"];
//    zrarray = @[@"百科科普",@"地理环境",@"地理环境",@"生物生命",@"宇宙航天"];
//    rwarray = @[@"成长教育",@"经济财商",@"历史社会",@"文化创造",@"文明见证"];
//    mxarray = @[@"表演艺术",@"美术视觉",@"生活艺术",@"诗歌韵文"];
//    kjarray = @[@"工业机械",@"探索未来"];
    switch (_downstyle) {
        case DownStyleJC:
            label.text = @"基础";
            imageview.image = UIIMAGE(@"三角-基础");
            zssqiu.itemarray = (NSMutableArray *)jcarray;
            break;
        case DownStyleZR:
            label.text = @"自然";
            imageview.image = UIIMAGE(@"三角-自然");
            zssqiu.itemarray = (NSMutableArray *)zrarray;
            break;
        case DownStyleRW:
            label.text = @"人文";
            imageview.image = UIIMAGE(@"三角-人文");
            zssqiu.itemarray = (NSMutableArray *)rwarray;
            break;
        case DownStyleMX:
            label.text = @"美学";
            imageview.image = UIIMAGE(@"三角-美学");
            zssqiu.itemarray = (NSMutableArray *)mxarray;
            break;
        case DownStyleKJ:
            label.text = @"科技";
            imageview.image = UIIMAGE(@"三角-科技");
            zssqiu.itemarray = (NSMutableArray *)kjarray;
            break;
        default:
            break;
    }
}

- (void)setModel:(ZhiShiShuFLOneModel *)model{
    zssqiu.nav = self.nav;
//    label.text = model.name;
    [imageview sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",ZSTXIMAGEURL,model.icon]]];
    NSLog(@"%@",[NSString stringWithFormat:@"%@%@",ZSTXIMAGEURL,model.icon]);
    UIColor * color = [BaseObject colorWithHexString:model.text_color Alpha:1];
    label.textColor = color;
    label.text = model.name;
    zssqiu.colors = color;
    zssqiu.itemarray = model.children;
}

@end
