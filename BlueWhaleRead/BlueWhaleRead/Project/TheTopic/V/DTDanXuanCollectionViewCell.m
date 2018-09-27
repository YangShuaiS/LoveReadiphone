 //
//  DTDanXuanCollectionViewCell.m
//  BoWanJuanForPad
//
//  Created by 杨帅 on 2018/5/23.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "DTDanXuanCollectionViewCell.h"
#import "DTDanXuanView.h"
#import "DTDuoXuanView.h"
#import "DTPaiXuView.h"
#import "DTLianXian.h"

#import "CTDanXuanView.h"
#import "CTDuoXuanNewView.h"
//#import "CTDuoXuanView.h"
#import "CTPaiXuView.h"
#import "CTLianXianView.h"
#import "DTShiZiCiView.h"
@implementation DTDanXuanCollectionViewCell{
    BOOL addnew;
    
    DTDanXuanView * danxuan;
    DTDuoXuanView * duoxuan;
    DTPaiXuView * paixu;
    DTLianXian * lianxian;
    
    CTDanXuanView * ctdanxuan;
    CTDuoXuanNewView * ctduoxuan;
    CTPaiXuView * ctpaixun;
    CTLianXianView * ctlianxian;
    DTShiZiCiView * dtsz;
    DTShiZiCiView * dtsztu;
    
    BaseLabel * fankuilabel;

}
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
//        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    WS(ws);
    BaseView * fankui = [BaseView new];
    fankui.backgroundColor = RGBA(255,255,255,0.6);
    fankui.layer.masksToBounds = YES;
    fankui.layer.cornerRadius = LENGTH(12);
    [self addSubview:fankui];
    [fankui mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws.mas_top).with.offset(StatusBar+LENGTH(10));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(4));
        make.width.mas_equalTo(LENGTH(128));
        make.height.mas_equalTo(LENGTH(24));
    }];
    
    fankuilabel = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(252,132,3) LabelFont:TextFont(13) TextAlignment:NSTextAlignmentCenter Text:@"题有错误，反馈一下"];
    [self addSubview:fankuilabel];
    [fankuilabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(fankui);
    }];
    
    BaseButton * rightBigButton = [BaseButton buttonWithType:UIButtonTypeCustom];
    [rightBigButton addTarget:self action:@selector(right) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:rightBigButton];
    
    [rightBigButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self->fankuilabel);
    }];
}

- (void)right{
    WS(ws);
    MBProgressHUD * mb = [MBProgressHUD new];
    mb.mode = MBProgressHUDModeIndeterminate;
    mb.label.text = @"正在反馈...";
    [mb showAnimated:YES];
    mb.removeFromSuperViewOnHide = YES;
    [self addSubview:mb];
    [mb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(ws);
    }];
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_TIFANKUI];
    NSDictionary * dic = @{@"bookid":_stylemodel.bookid,@"problemid":_stylemodel.timuid};
    //    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,@"searchBook"];
    //    NSDictionary * dic = @{@"bookName":@"我",@"studentid":Me.ssid};
    
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            HomePage * model = [HomePage mj_objectWithKeyValues:responseObject];
            if ([model.code isEqual:@200]) {
                self->fankuilabel.text = @"已反馈";
                self->fankuilabel.textColor = RGB(33, 33, 33);
                [mb hideAnimated:NO afterDelay:1];
            }else{
                mb.label.text = model.message;
                [mb hideAnimated:NO afterDelay:1];
            }
        }else{
            mb.label.text = @"网络请求失败";
            [mb hideAnimated:NO afterDelay:1];
        }
    }];
}

- (void)setModel:(BookProblemsModel *)model{
    _model= model;
    switch (_style) {
        case DTDanXuanStyle:
            danxuan.model = model;
            break;
        case DTDuoXuanStyle:
            duoxuan.model = model;
            break;
        case DTPaiXuStyle:
            paixu.model = model;
            break;
        case DTLianXianStyle:
            lianxian.model = model;
            break;
        case CTDanXuanStyle:
            break;
        case CTDuoXuanStyle:
            break;
        case CTPaiXuStyle:
            break;
        case CTLianXianStyle:
            break;
        case DTSHiZiOrShiCi:
            break;
        case DTSHiZiOrShiCiTu:
            break;
        default:
            break;
    }
}
- (void)setStylemodel:(TiStyleModel *)stylemodel{
    _stylemodel = stylemodel;
    switch (_style) {
        case CTDanXuanStyle:
            ctdanxuan.boname = _bookName;
            ctdanxuan.tiModel = stylemodel;
            break;
        case CTDuoXuanStyle:
            ctduoxuan.boname = _bookName;
            ctduoxuan.tiModel = stylemodel;
            break;
        case CTPaiXuStyle:
            ctpaixun.boname = _bookName;
            ctpaixun.tiModel = stylemodel;
            break;
        case CTLianXianStyle:
            ctlianxian.boname = _bookName;
            ctlianxian.tiModel = stylemodel;
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
            dtsztu.model = szorci;
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
            dtsztu.scmodel = scorci;
            break;
        default:
            break;
    }
}

- (void)setStyle:(DaTiStyle)style{
    _style = style;
    if (!addnew) {
        addnew = YES;
        switch (style) {
            case DTDanXuanStyle:
                [self ADDdamxuan];
                break;
            case DTDuoXuanStyle:
                [self ADDduoxuan];
                break;
            case DTPaiXuStyle:
                [self ADDpaixu];
                break;
            case DTLianXianStyle:
                [self ADDlianxian];
                break;
            case CTDanXuanStyle:
                [self ADDCtdanxuan];
                [self setupUI];
                break;
            case CTDuoXuanStyle:
                [self ADDCtduoxuan];
                [self setupUI];
                break;
            case CTPaiXuStyle:
                [self ADDCTpaixu];
                [self setupUI];
                break;
            case CTLianXianStyle:
                [self ADDCTlianxian];
                [self setupUI];
                break;
            case DTSHiZiOrShiCi:
                [self ADDShiziZi];
                break;
            case DTSHiZiOrShiCiTu:
                [self ADDShiZiCi];
                break;
            default:
                break;
        }
    }
}
- (void)setDtdownstyle:(DtLastOrNext)dtdownstyle{
    _dtdownstyle = dtdownstyle;
    switch (_style) {
        case DTDanXuanStyle:
            if (danxuan.dtdownstyle == 0) {
                danxuan.dtdownstyle = dtdownstyle;
            }
            break;
        case DTDuoXuanStyle:
            if (duoxuan.dtdownstyle == 0) {
                duoxuan.dtdownstyle = dtdownstyle;
            }
            break;
        case DTPaiXuStyle:
            if (paixu.dtdownstyle == 0) {
                paixu.dtdownstyle = dtdownstyle;
            }
            break;
        case DTLianXianStyle:
            if (lianxian.dtdownstyle == 0) {
                lianxian.dtdownstyle = dtdownstyle;
            }
            break;
        case CTDanXuanStyle:
            if (ctdanxuan.dtdownstyle == 0) {
                ctdanxuan.dtdownstyle = dtdownstyle;
            }
            break;
        case CTDuoXuanStyle:
            if (ctduoxuan.dtdownstyle == 0) {
                ctduoxuan.dtdownstyle = dtdownstyle;
            }
            break;
        case CTPaiXuStyle:
            if (ctpaixun.dtdownstyle == 0) {
                ctpaixun.dtdownstyle = dtdownstyle;
            }
            break;
        case CTLianXianStyle:
            if (ctlianxian.dtdownstyle == 0) {
                ctlianxian.dtdownstyle = dtdownstyle;
            }
            break;
        case DTSHiZiOrShiCi:
            break;
        case DTSHiZiOrShiCiTu:
            
            break;
        default:
            break;
    }
}
//- (void)setEndCell:(NSInteger)EndCell{
//    _EndCell = EndCell;
//    switch (_style) {
//        case DTDanXuanStyle:
//            danxuan.EndCell = EndCell;
//            break;
//        case DTDuoXuanStyle:
//            duoxuan.EndCell = EndCell;
//            break;
//        case DTPaiXuStyle:
//            paixu.EndCell = EndCell;
//            break;
//        case DTLianXianStyle:
//            lianxian.EndCell = EndCell;
//            break;
//        case CTDanXuanStyle:
//            break;
//        case CTDuoXuanStyle:
//            break;
//        case CTPaiXuStyle:
//            break;
//        case CTLianXianStyle:
//            break;
//        case DTSHiZiOrShiCi:
//            dtsz.EndCell = _EndCell;
//            break;
//        case DTSHiZiOrShiCiTu:
//            dtsztu.EndCell = _EndCell;
//
//            break;
//        default:
//            break;
//    }
//}
- (void)layoutSubviews{
    [super layoutSubviews];


}
- (void)ADDdamxuan{
    danxuan = [DTDanXuanView new];
    danxuan.delegate = self;
    [self addSubview:danxuan];
    WS(ws);
    [danxuan mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
}

- (void)ADDduoxuan{
    duoxuan = [DTDuoXuanView new];
    duoxuan.delegate = self;
    [self addSubview:duoxuan];
    WS(ws);
    [duoxuan mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
}

- (void)ADDpaixu{
    paixu = [DTPaiXuView new];
    paixu.delegate = self;
    [self addSubview:paixu];
    WS(ws);
    [paixu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
}

- (void)ADDlianxian{
    lianxian = [DTLianXian new];
    lianxian.delegate = self;
    [self addSubview:lianxian];
    WS(ws);
    [lianxian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
}

- (void)ADDCtdanxuan{
    ctdanxuan = [CTDanXuanView new];
    ctdanxuan.delegate = self;
    [self addSubview:ctdanxuan];
    WS(ws);
    [ctdanxuan mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
}

- (void)ADDCtduoxuan{
    ctduoxuan = [CTDuoXuanNewView new];
    ctduoxuan.delegate = self;
    [self addSubview:ctduoxuan];
    WS(ws);
    [ctduoxuan mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
}

- (void)ADDCTpaixu{
    ctpaixun = [CTPaiXuView new];
    ctpaixun.delegate = self;
    [self addSubview:ctpaixun];
    WS(ws);
    [ctpaixun mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
}

- (void)ADDCTlianxian{
    ctlianxian = [CTLianXianView new];
    ctlianxian.delegate = self;
    [self addSubview:ctlianxian];
    WS(ws);
    [ctlianxian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
}

- (void)ADDShiziZi{
    dtsz = [DTShiZiCiView new];
    dtsz.EndCell = _EndCell;
    dtsz.delegate = self;
    dtsz.inter = 0;
    [self addSubview:dtsz];
    WS(ws);
    [dtsz mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
}
- (void)ADDShiZiCi{
    dtsztu = [DTShiZiCiView new];
    dtsztu.EndCell = _EndCell;
    dtsztu.delegate = self;
    dtsztu.inter = 1;
    [self addSubview:dtsztu];
    WS(ws);
    [dtsztu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
}
#pragma mark ------- 点击事件
- (void)PushFriendViewCOntroller:(PushModel *)model{
    [self.delegate PushFriendViewCOntroller:model];
}
- (NSMutableArray *)paixu:(NSMutableArray *)paixuarray{
    NSSortDescriptor *ageSD = [NSSortDescriptor sortDescriptorWithKey:@"TiMu" ascending:YES];
      paixuarray  = [[paixuarray sortedArrayUsingDescriptors:@[ageSD]] mutableCopy];
    return paixuarray;
    
//    NSArray *paixuarr = [(NSArray *)paixuarray sortedArrayUsingComparator:
//                                ^NSComparisonResult(TiMuModel *obj1, TiMuModel *obj2) {
//                                    //                           NSComparisonResult result = [obj1.catalogNum compare:obj2.catalogNum];
//                                    NSComparisonResult result = [obj2.TiMu compare:obj1.TiMu];
//                                    return result == NSOrderedDescending;
//                                    //        return result == NSOrderedAscending;  // 降序
//                                }];
//
//    return (NSMutableArray *)paixuarr;
    
//        NSLocale *locale=[[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
//        NSArray *sortedArray = [paixuarray sortedArrayUsingComparator:^NSComparisonResult(NSString *  _Nonnull obj1, NSString *  _Nonnull obj2) {
//            NSRange string1Range = NSMakeRange(0, [obj1 length]);
//            return [obj1 compare:obj2 options:0 range:string1Range locale:locale];
//        }];
//        NSLog(@"after %@ , result is %@",NSStringFromSelector(_cmd),sortedArray);
//    return sortedArray;
}
//- (NSMutableArray *)paixu:(NSArray *)paixuarray{
//{
//    NSLocale *locale=[[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
//    NSArray *sortedArray = [paixuarray sortedArrayUsingComparator:^NSComparisonResult(NSString *  _Nonnull obj1, NSString *  _Nonnull obj2) {
//        NSRange string1Range = NSMakeRange(0, [obj1 length]);
//        return [obj1 compare:obj2 options:0 range:string1Range locale:locale];
//    }];
//    NSLog(@"after %@ , result is %@",NSStringFromSelector(_cmd),sortedArray);
//}

- (TiStyleModel *)cellTiMuModel{
    TiStyleModel * stylemodel = [TiStyleModel new];
    stylemodel.timu = _model.question;
    stylemodel.timuid = _model.ssid;
    stylemodel.bookid = _model.book_id;
    switch (_style) {
        case DTDanXuanStyle:
            stylemodel.type = 4;
            stylemodel.timuarray = danxuan.timuarray;
            stylemodel.zqdaarray = danxuan.zqdaarray;
            stylemodel.yhdaarray = danxuan.xzdaarray;
            break;
        case DTDuoXuanStyle:
            stylemodel.type = 1;
            stylemodel.timuarray = duoxuan.timuarray;
            stylemodel.zqdaarray = duoxuan.zqdaarray;
            // 利用block进行排序
            stylemodel.yhdaarray = [self paixu:duoxuan.xzdaarray];
            break;
        case DTPaiXuStyle:
            stylemodel.type = 3;
            stylemodel.timuarray = paixu.timuarray;
            stylemodel.zqdaarray = paixu.zqdaarray;
            stylemodel.yhdaarray = paixu.xzdaarray;
            break;
        case DTLianXianStyle:
            stylemodel.type = 2;
            stylemodel.timuarray = lianxian.timuarray;
            stylemodel.zqdaarray = lianxian.zqdaarray;
            stylemodel.yhdaarray = [lianxian yhxzarray];
            break;
        case CTDanXuanStyle:
            break;
        case CTDuoXuanStyle:
            break;
        case CTPaiXuStyle:
            break;
        case CTLianXianStyle:
            break;
        case DTSHiZiOrShiCi:
            break;
        case DTSHiZiOrShiCiTu:
            break;
        default:
            break;
    }
    return stylemodel;
}
@end
