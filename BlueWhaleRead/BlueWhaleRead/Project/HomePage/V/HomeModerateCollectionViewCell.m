//
//  HomeModerateCollectionViewCell.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/7.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "HomeModerateCollectionViewCell.h"
#import "StareMoreView.h"
@implementation HomeModerateCollectionViewCell{
    FLAnimatedImageView * imageView;
    BaseLabel * Title;
    UIView * yy;
    NSInteger inter;
    
    UIView * topbackview;
    UIImageView * topimageview;
    
    BaseLabel * zxyd;
    
    StareMoreView * stareview;
    BaseLabel * fenshu;
    MBProgressHUD * mb;

}
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        inter = 0;
        mb = [MBProgressHUD new];
        mb.label.text = @"";
        mb.mode = MBProgressHUDModeText;
        //        [mb showAnimated:YES];
        mb.removeFromSuperViewOnHide = NO;
        mb.label.numberOfLines = 0;
        //        [mb hideAnimated:YES afterDelay:0];
        [[[[UIApplication sharedApplication] delegate] window] addSubview:mb];
        [mb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo([[[UIApplication sharedApplication] delegate] window]);
        }];
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    WS(ws);
    UIView * yinyig = [UIView new];
    yinyig.backgroundColor = [UIColor whiteColor];
    [self addSubview:yinyig];
    [yinyig mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.mas_top).with.offset(LENGTH(4));
        make.left.equalTo(ws.mas_left).with.offset(LENGTH(4));
        make.right.equalTo(ws.mas_right).with.offset(-LENGTH(4));
        make.height.equalTo(yinyig.mas_width).multipliedBy(1.4283333333);
    }];
    yinyig.layer.shadowOpacity = 0.16;
    yinyig.layer.shadowColor = [UIColor blackColor].CGColor;
    yinyig.layer.shadowRadius = LENGTH(4);
    yinyig.layer.shadowOffset = CGSizeMake(0,0);
    yinyig.layer.cornerRadius = LENGTH(5);
    [yinyig.layer setShouldRasterize:YES];
    [yinyig.layer setRasterizationScale:[UIScreen mainScreen].scale];
    
    yy = [UIView new];
    yy.backgroundColor = [UIColor whiteColor];
    [self addSubview:yy];
    [yy mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.mas_top).with.offset(LENGTH(4));
        make.left.equalTo(ws.mas_left).with.offset(LENGTH(4));
        make.right.equalTo(ws.mas_right).with.offset(-LENGTH(4));
        make.height.equalTo(self->yy.mas_width).multipliedBy(1.4283333333);
    }];

    
    imageView = [FLAnimatedImageView new];
//    imageView.backgroundColor = [UIColor whiteColor];
    imageView.image = UIIMAGE(@"发现_你的同学_书缺省位置");
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    [yy addSubview:imageView];
    
    topbackview = [UIView new];
    topbackview.backgroundColor = RGBA(0, 0, 0, 0.5);
    [yy addSubview:topbackview];
    [topbackview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.top.mas_equalTo(self->yy);
        make.size.mas_equalTo(CGSizeMake(LENGTH(28), LENGTH(23)));
    }];
    
    topimageview = [UIImageView new];
    topimageview.contentMode = UIViewContentModeScaleAspectFit;
    topimageview.image = UIIMAGE(@"添加");
    [topbackview addSubview:topimageview];
    [topimageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self->topbackview);
        make.size.mas_equalTo(CGSizeMake(LENGTH(18), LENGTH(15)));
    }];
    
    Title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:ChangYongTitLe LabelFont:TextFont(14) TextAlignment:NSTextAlignmentLeft Text:@""];
    Title.numberOfLines = 1;
    [self addSubview:Title];
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self->yy);
    }];
    
    [Title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->yy.mas_bottom).with.offset(LENGTH(6));
//        make.bottom.equalTo(ws).with.offset(0);
        make.left.equalTo(self->imageView).with.offset(0);
        make.right.equalTo(self->imageView).with.offset(0);
    }];
    
    UIImageView * xian = [UIImageView new];
    xian.image = UIIMAGE(@"书线");
    [yy addSubview:xian];
    [xian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.bottom.and.left.mas_equalTo(self->yy);
        make.width.mas_equalTo(LENGTH(9));
    }];
    
    topbackview.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ShouCang)];
    [topbackview addGestureRecognizer:tap];
    
    zxyd = [[BaseLabel alloc] initWithTxteColor:RGB(255, 255, 255) LabelFont:TextFontCu(11) TextAlignment:NSTextAlignmentCenter Text:@"在线阅读"];
    zxyd.backgroundColor = RGBA(91, 199, 198, 0.9);
    [yy addSubview:zxyd];
    [zxyd mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.and.bottom.mas_equalTo(self->yy);
        make.size.mas_equalTo(CGSizeMake(LENGTH(55), LENGTH(17)));
    }];
    
    stareview = [StareMoreView new];
    [self addSubview:stareview];
    [stareview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->imageView).with.offset(0);
        make.top.equalTo(self->Title.mas_bottom).with.offset(LENGTH(6));
        make.width.mas_equalTo(LENGTH(60));
//        make.height.mas_equalTo(LENGTH(13));
    }];
    
    fenshu = [[BaseLabel alloc] initWithTxteColor:RGB(153, 153, 153) LabelFont:TextFont(11) TextAlignment:NSTextAlignmentCenter Text:@"9.0"];
    [self addSubview:fenshu];
    [fenshu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->stareview.mas_right).with.offset(LENGTH(8));
        make.centerY.mas_equalTo(self->stareview);
    }];
    
    
    
    
    [yy layoutIfNeeded];
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:yy.bounds byRoundingCorners:UIRectCornerBottomRight | UIRectCornerTopRight cornerRadii:CGSizeMake(LENGTH(5),LENGTH(5))];
    //创建 layer
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = yy.bounds;
    //赋值
    maskLayer.path = maskPath.CGPath;
    yy.layer.mask = maskLayer;
    
    [zxyd layoutIfNeeded];
    UIBezierPath *maskPath1 = [UIBezierPath bezierPathWithRoundedRect:zxyd.bounds byRoundingCorners:UIRectCornerTopLeft cornerRadii:CGSizeMake(LENGTH(5),LENGTH(5))];
    //创建 layer
    CAShapeLayer *maskLayer1 = [[CAShapeLayer alloc] init];
    maskLayer1.frame = zxyd.bounds;
    //赋值
    maskLayer1.path = maskPath1.CGPath;
    zxyd.layer.mask = maskLayer1;
    
    [topbackview layoutSubviews];
    UIBezierPath *maskPath2 = [UIBezierPath bezierPathWithRoundedRect:topbackview.bounds byRoundingCorners:UIRectCornerBottomRight cornerRadii:CGSizeMake(LENGTH(5),LENGTH(5))];
    //创建 layer
    CAShapeLayer *maskLayer2 = [[CAShapeLayer alloc] init];
    maskLayer2.frame = topbackview.bounds;
    //赋值
    maskLayer2.path = maskPath2.CGPath;
    topbackview.layer.mask = maskLayer2;
}

- (void)setModel:(BookListModel *)model{
    _model = model;
    Title.text = model.name;
    [imageView sd_setImageWithURL:URLIMAGE(model.cover) placeholderImage:UIIMAGE(@"发现_你的同学_书缺省位置")];
    stareview.redValue = [model.mark floatValue];
    fenshu.text = [NSString stringWithFormat:@"%.1f",[model.mark floatValue]*2.0];
    if ([model.b_download isEqualToString:@""]) {
        zxyd.hidden = YES;
    }else{
        zxyd.hidden = NO;
    }
    if (_model.is_read==1 || _model.is_read==2 || _model.is_read==99) {
        topimageview.image = UIIMAGE(@"收藏-收藏状态");
    }else{
        topimageview.image = UIIMAGE(@"添加");

    }
}

- (void)ShouCang{
//    topimageview.image = [topimageview.image isEqual:UIIMAGE(@"收藏-未收藏状态")]?UIIMAGE(@"收藏-收藏状态"):UIIMAGE(@"收藏-未收藏状态");
    if (_model != nil) {
        if (_model.is_read == 0) {
            [self addbookcity];
        }else if (_model.is_read == 1){
            [self remobookcity];
        }else{
            [mb showAnimated:YES];
            mb.label.text = @"这是已读完书籍\n会永远保存在你的书架里哦～";
            [mb hideAnimated:YES afterDelay:1];
        }
    }

}

- (void)layoutSubviews{
    [super layoutSubviews];
    if (inter == 0) {
        inter = 1;

    }

}


- (void)addbookcity{
    WS(ws);
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_JOOINBOOKCITY];
    //studentid 学生id
    NSDictionary * dic = @{@"bookid":_model.ssid,@"studentid":Me.ssid};
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            JoinBookModel * models = [JoinBookModel mj_objectWithKeyValues:responseObject];
            if ([models.code isEqual:@200]) {
                ws.model.is_read = 1;
                [ws upview];
//                [ws addshoucang];
            }else if ([models.code isEqual:@Notloggedin]){
                
            }
            [self->mb showAnimated:YES];
            self->mb.label.text = models.message;
            [self->mb hideAnimated:YES afterDelay:1];
        }else{
            [self->mb showAnimated:YES];
            self->mb.label.text = @"网络请求失败";
            [self->mb hideAnimated:YES afterDelay:1];
        }
    }];
}

- (void)remobookcity{
    WS(ws);

    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_REMOVEBOOKCITY];
    NSDictionary * dic = @{@"bookid":_model.ssid,@"studentid":Me.ssid};
    
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            TheTopPicModel *Topmodel = [TheTopPicModel mj_objectWithKeyValues:responseObject];
            if ([Topmodel.code isEqual:@200]) {
                ws.model.is_read = 0;
                [ws upview];

            }else if ([Topmodel.code isEqual:@Notloggedin]){
            }
            [self->mb showAnimated:YES];
            self->mb.label.text = Topmodel.message;
            [self->mb hideAnimated:YES afterDelay:1];
        }else{
            [self->mb showAnimated:YES];
            self->mb.label.text = @"网络请求失败";
            [self->mb hideAnimated:YES afterDelay:1];
        }
    }];
}
- (void)addshoucang{
    WS(ws);
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_LOVEANDNOLOVE];
    NSString * like = @"";
    if (_model.is_like == 1) {
        like = @"0";
    }else{
        like = @"1";
    }
    NSDictionary * dic = @{@"studentid":Me.ssid,@"bookid":_model.ssid,@"islike":like};
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            HomePage * model = [HomePage mj_objectWithKeyValues:responseObject];
            if ([model.code isEqual:@200]) {
                ws.model.is_like = ws.model.is_like == 1?0:1;
                [ws upview];
            }else if ([model.code isEqual:@Notloggedin]){
            }
            
        }else{
            
        }
    }];
}
- (void)upview{
    if (_model.is_read == 0) {
        topimageview.image = UIIMAGE(@"添加");
    }else{
        topimageview.image = UIIMAGE(@"收藏-收藏状态");
    }
}

- (void)setStarehiden:(NSInteger)starehiden{
    _starehiden = starehiden;
    if (starehiden == 3) {
        topbackview.hidden = YES;
    }
}
@end
