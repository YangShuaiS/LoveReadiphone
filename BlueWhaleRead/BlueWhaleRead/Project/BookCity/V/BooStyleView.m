//
//  BooStyleView.m
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/5/3.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BooStyleView.h"
//#import "BookTableView.h"

#import "BookMenuView.h"

#import "UnderTabView.h"
#import "UnderLeftTabView.h"
@interface BooStyleView ()<BookMenuViewDelegate,UIGestureRecognizerDelegate>
@property (strong, nonatomic) UnderTabView *caidantableivew;
@property (strong, nonatomic) UnderLeftTabView *caidanlefttableivew;


@end
@implementation BooStyleView{
    BookMenuView * topview;
    
    NSMutableArray * item11;
    NSMutableArray * lastitem11;

    NSMutableArray * item1;
    NSMutableArray * item2;
    NSMutableArray * item3;
    
    NSInteger last1;
    NSInteger last2;
    NSInteger last3;

    BaseView * backview;
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
    topview = [BookMenuView new];
    topview.delegete = self;
    topview.userInteractionEnabled = YES;
    [self addSubview:topview];
    
    [topview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(0);
        make.left.equalTo(ws).with.offset(0);
        make.right.equalTo(ws).with.offset(0);
        make.height.mas_equalTo(MENU);
    }];
    
    
    
    _tableView = [BookTableView new];
    [self addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->topview.mas_bottom).with.offset(0);
        make.left.equalTo(ws).with.offset(0);
        make.right.equalTo(ws).with.offset(0);
        make.bottom.equalTo(ws).with.offset(-LENGTH(20));
    }];
    [_tableView setBlock:^(CGFloat flo) {
        [ws daili:flo];
    }];
}
- (void)setInter:(NSInteger)inter{
    _inter = inter;
    _tableView.inter = inter;
}
- (void)setModel:(BookCityModel *)model{
    _model = model;
    if (_tableView.itemarray.count == 0) {
        [self chushihuashuzu];
        [self zhiding];
    }
    _tableView.itemarray = model.bookList;

//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//    });
}
- (void)zhiding{
    NSIndexPath * indexpa = [NSIndexPath indexPathForRow:0 inSection:0];
    if ([indexpa isEqual:_inpath]) {
        
    }else{
        CityTypeListModel * m = item1[_inpath.section];
        item11 = m.child;
        [self RefreshCaiDanView:1 LastInter:last1 Weizhi:indexpa Nsmuarray:item11];
    }

}
- (void)setNav:(UINavigationController *)nav{
    _tableView.nav = nav;
}
- (void)daili:(CGFloat)flo{
    [self.delegete scrollFloat:flo];

}


- (void)chushihuashuzu{
    item1 = [NSMutableArray array];
    item2 = [NSMutableArray array];
    item3 = [NSMutableArray array];
    item11 = [NSMutableArray array];
    lastitem11 = [NSMutableArray array];
    last1 = 9999999;
    last2 = 9999999;
    last3 = 9999999;
    
    item1 = _model.catalogList;
    
    item2 = _model.levels;
    item3 = _model.sort;
}
- (void)tap{
    backview.hidden = YES;
    _caidanlefttableivew.hidden = YES;
    _caidantableivew.hidden = YES;
    [topview UpText];
}

- (void)BackButtonIndext:(NSInteger)indext{
    WS(ws);
    __block BooStyleView *blockSelf = self;

    if (_caidantableivew == nil) {
        backview = [BaseView new];
        backview.backgroundColor =[UIColor blackColor];
        backview.alpha = 0.4;
        [self addSubview:backview];
        [backview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self->topview.mas_bottom).with.offset(0);
            make.left.equalTo(ws).with.offset(0);
            make.right.equalTo(ws).with.offset(0);
            make.bottom.equalTo(ws).with.offset(0);
        }];

        _caidantableivew = [UnderTabView new];
        [self addSubview:_caidantableivew];
        [_caidantableivew mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self->topview.mas_bottom).with.offset(0);
            make.left.equalTo(ws).with.offset(0);
            make.right.equalTo(ws).with.offset(0);
            make.bottom.equalTo(ws).with.offset(0);
        }];
        
        _caidantableivew.userInteractionEnabled = YES;
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
        tap.delegate = self;
        [_caidantableivew addGestureRecognizer:tap];
    }else{
        [_caidantableivew xianshi];
        _caidantableivew.hidden = NO;
    }
    if (_caidanlefttableivew == nil) {
        _caidanlefttableivew = [UnderLeftTabView new];
        [self addSubview:_caidanlefttableivew];
        [_caidanlefttableivew mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self->topview.mas_bottom).with.offset(0);
            make.left.equalTo(ws).with.offset(0);
            make.bottom.equalTo(ws).with.offset(0);
            make.width.mas_equalTo(WIDTH/2);
        }];
        _caidanlefttableivew.hidden = YES;
    }
    
    //通知主线程刷新
    dispatch_async(dispatch_get_main_queue(), ^{
        self->backview.hidden = NO;
    });
    if (indext == 1) {
        _caidanlefttableivew.hidden = NO;
        _caidanlefttableivew.itemarray = item1;
        NSMutableArray * arr = [NSMutableArray array];
        _caidantableivew.itemarray =arr;

        [_caidantableivew mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self->topview.mas_bottom).with.offset(0);
            make.left.equalTo(ws.caidanlefttableivew.mas_right).with.offset(0);
            make.right.equalTo(ws).with.offset(0);
            make.bottom.equalTo(ws).with.offset(0);
        }];


    }else if (indext == 2){
        _caidanlefttableivew.hidden = YES;
        _caidantableivew.itemarray =item2;
        [_caidantableivew mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self->topview.mas_bottom).with.offset(0);
            make.left.equalTo(ws).with.offset(0);
            make.right.equalTo(ws).with.offset(0);
            make.bottom.equalTo(ws).with.offset(0);
        }];
    }else{
        _caidanlefttableivew.hidden = YES;

        _caidantableivew.itemarray =item3;
        [_caidantableivew mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self->topview.mas_bottom).with.offset(0);
            make.left.equalTo(ws).with.offset(0);
            make.right.equalTo(ws).with.offset(0);
            make.bottom.equalTo(ws).with.offset(0);
        }];
    }

    [_caidantableivew setBlock:^(NSIndexPath *indexpath) {
        blockSelf->backview.hidden = YES;
        ws.caidanlefttableivew.hidden = YES;
        if (indext == 1) {
            [ws RefreshCaiDanView:indext LastInter:blockSelf->last1 Weizhi:indexpath Nsmuarray:blockSelf->item11];

        }else if (indext == 2){
            [ws RefreshCaiDanView:indext LastInter:blockSelf->last2 Weizhi:indexpath Nsmuarray:blockSelf->item2];
        }else{
            [ws RefreshCaiDanView:indext LastInter:blockSelf->last3 Weizhi:indexpath Nsmuarray:blockSelf->item3];
        }
        [blockSelf delegetevlock];
        [blockSelf->topview UpText];

     
    }];
    
    

    [_caidanlefttableivew setBlock:^(NSIndexPath *indexpath) {
        CityTypeListModel * m = blockSelf->item1[indexpath.section];
        blockSelf->item11 = m.child;
        ws.caidantableivew.itemarray = blockSelf->item11;
    }];

}

- (BOOL)gestureRecognizer:(UIGestureRecognizer*)gestureRecognizer shouldReceiveTouch:(UITouch*)touch{
    if ([touch.view isKindOfClass:[UITableView class]]) {
        return YES;
    }
    return NO;
}


- (void)delegetevlock{
    NSMutableArray * arr = [NSMutableArray array];
    if (last1 == 9999999) {
        [arr addObject:@""];
    }else{
        if (item11.count == 0) {
            [arr addObject:@"100"];
        }else{
            CityTypeListModel * TModel1 = item11[last1];
            [arr addObject:TModel1.ssid];
        }

    }
    //
    
    if (last2 == 9999999) {
        [arr addObject:@""];
    }else{
        BookFenjiModel * TModel2 = item2[last2];
        [arr addObject:TModel2.ssid];
    }
    
    if (last3 == 9999999) {
        [arr addObject:@""];
    }else{
        CityOrderBookModel * TModel3 = item3[last3];
        [arr addObject:TModel3.ssid];
    }
    [self.delegete backbodys:arr];
}

- (void)RefreshCaiDanView:(NSInteger)Now LastInter:(NSInteger)last Weizhi:(NSIndexPath *)intextp Nsmuarray:(NSMutableArray *)array{

    if (last !=9999999) {
        if ([array[0]isMemberOfClass:[CityTypeListModel class]]) {
            if (lastitem11.count>0) {
                CityTypeListModel * TypeModel = lastitem11[last];
                TypeModel.type = 0;
                [lastitem11 replaceObjectAtIndex:last  withObject:TypeModel];
            }
        }else if ([array[0]isMemberOfClass:[BookFenjiModel class]]){
            BookFenjiModel * TypeModel = array[last];
            TypeModel.type = 0;
            [array replaceObjectAtIndex:last  withObject:TypeModel];
        }else if ([array[0]isMemberOfClass:[CityOrderBookModel class]]){
            CityOrderBookModel * TypeModel = array[last];
            TypeModel.type = 0;
            [array replaceObjectAtIndex:last  withObject:TypeModel];
        }
    }
    if ([array[0]isMemberOfClass:[CityTypeListModel class]]) {
        CityTypeListModel * TModel = array[intextp.section];
        TModel.type = 1;
        [array replaceObjectAtIndex:intextp.section  withObject:TModel];
        lastitem11 = array;
        [topview Refresh:Now Title:TModel.name];
    }else if ([array[0]isMemberOfClass:[BookFenjiModel class]]){
        BookFenjiModel * TModel = array[intextp.section];
        TModel.type = 1;
        [array replaceObjectAtIndex:intextp.section  withObject:TModel];
        [topview Refresh:Now Title:TModel.lv];
    }else if ([array[0]isMemberOfClass:[CityOrderBookModel class]]){
        CityOrderBookModel * TModel = array[intextp.section];
        TModel.type = 1;
        [array replaceObjectAtIndex:intextp.section  withObject:TModel];
        [topview Refresh:Now Title:TModel.sort];
    }
    
    if (Now == 1) {
        last1 = intextp.section;
    }else if(Now == 2){
        last2 = intextp.section;
    }else{
        last3 = intextp.section;
    }
}
- (void)layoutSubviews{
    [super layoutSubviews];

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
