//
//  BookListMenu.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/3.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BookListMenu.h"
@interface BookListMenu () <UIScrollViewDelegate> {
    
    UIButton *_selectButton;
    UIScrollView *_titleScroll;
    UIScrollView *_controllerScroll;
    BaseView * backView;
    BaseLabel * geshu;
}
@property (nonatomic, strong) NSMutableArray<BaseButton *> *buttonArray;
@property (nonatomic, strong) BaseButton * lastbutton;

@end
@implementation BookListMenu

#pragma mark - 懒加载
- (NSMutableArray *)buttonArray {
    
    if (_buttonArray == nil) {
        _buttonArray = [NSMutableArray array];
    }
    return _buttonArray;
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
    BaseView * downView = [BaseView new];
    downView.backgroundColor = BEIJINGCOLOR;
    [self addSubview:downView];
    [downView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(0);
        make.top.equalTo(ws).with.offset(0);
        make.right.equalTo(ws).with.offset(0);
        make.height.mas_equalTo(LENGTH(52));
    }];
    
    backView = [[BaseView alloc] init];
    backView.backgroundColor = [UIColor clearColor];
    backView.layer.borderWidth = 1;
    backView.layer.borderColor = RGB(90,196,192).CGColor;
    backView.layer.cornerRadius = LENGTH(30)/2;
    backView.layer.masksToBounds = YES;
    [downView addSubview:backView];
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(downView.mas_left).with.offset(LENGTH(70));
        make.right.equalTo(downView.mas_right).with.offset(-LENGTH(70));
        make.centerY.mas_equalTo(downView.mas_centerY);
        make.height.mas_equalTo(LENGTH(30));
    }];
    
    
}

- (void)setTitarray:(NSArray *)titarray{
    _titarray = titarray;
    WS(ws);
    for (int i = 0; i < _titarray.count; i++) {
        BaseButton *titleButton = [BaseButton buttonWithType:UIButtonTypeCustom];
        [titleButton setTitleColor:RGB(4,51,50) forState:UIControlStateNormal];
        [titleButton setTitle:_titarray[i] forState:UIControlStateNormal];
        titleButton.titleLabel.font = TextFont(14);
        titleButton.tag = 100+i;
        [titleButton addTarget:self action:@selector(scrollViewSelectToIndex:) forControlEvents:UIControlEventTouchUpInside];
        titleButton.backgroundColor =BEIJINGCOLOR;
        [backView addSubview:titleButton];
        [self.buttonArray addObject:titleButton];
        
        if (i ==0 ) {
            self.lastbutton = titleButton;
            _selectButton = titleButton;
            [_selectButton setTitleColor:RGB(255,255,255) forState:UIControlStateNormal];
            titleButton.backgroundColor =RGB(90,196,192);
            
//            geshu = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255,255,255) LabelFont:TextFont(13) TextAlignment:NSTextAlignmentCenter Text:@"+5"];
//            geshu.backgroundColor = RGB(251,110,99);
//            geshu.layer.masksToBounds = YES;
//            geshu.layer.cornerRadius = LENGTH(17)/2;
//            [titleButton addSubview:geshu];
//            [geshu mas_makeConstraints:^(MASConstraintMaker *make) {
//                make.top.mas_equalTo(titleButton.mas_top).with.offset(LENGTH(6));
//                make.right.mas_equalTo(titleButton.mas_right).with.offset(-LENGTH(58));
//                make.width.mas_equalTo(LENGTH(26));
//                make.height.mas_equalTo(LENGTH(17));
//            }];

        }else{
            self.lastbutton = ws.buttonArray[i-1];
        }
        [titleButton mas_makeConstraints:^(MASConstraintMaker *make) {
            if (i==0) {
                make.left.equalTo(self->backView.mas_left).with.offset(0);
                
            }else{
                ws.lastbutton = ws.buttonArray[i-1]; make.left.equalTo(ws.lastbutton.mas_right).with.offset(0);
                make.width.equalTo(ws.lastbutton);
            }
            make.top.equalTo(self->backView.mas_top).with.offset(0);
            make.bottom.equalTo(self->backView.mas_bottom).with.offset(0);
        }];
        
    }
    
    self.lastbutton = ws.buttonArray[_titarray.count-1];
    [self.lastbutton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self->backView.mas_right).offset(0);
    }];
}
// 切换到相应的控制器页面
- (void)scrollViewSelectToIndex:(UIButton *)button{
    [self selectButton:button.tag-100];
    // 切换到选中的控制器的view
    [UIView animateWithDuration:0.5 animations:^{
        self->_controllerScroll.contentOffset = CGPointMake(WIDTH*(button.tag-100), 0);
    }];
    
}
//选择某个按钮
- (void)selectButton:(NSInteger)index
{
    // 如果选中其他的按钮，默认按钮回复原来的字体颜色和大小
    [_selectButton setTitleColor:RGB(4,51,50) forState:UIControlStateNormal];
    _selectButton.backgroundColor =BEIJINGCOLOR;

    // 设置选中的按钮
    _selectButton = _buttonArray[index];
    [_selectButton setTitleColor:RGB(255,255,255) forState:UIControlStateNormal];
    _selectButton.backgroundColor =RGB(90,196,192);
    
}
- (void)setControllerArray:(NSArray *)controllerArray {
    
    _controllerArray = controllerArray;
    [self setupViewControllerScroll];
}

- (void)setupViewControllerScroll
{
    WS(ws);
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.delegate = self;
    scrollView.scrollEnabled = YES;
    scrollView.pagingEnabled = YES;
    scrollView.bounces = NO;
    scrollView.indicatorStyle = UIScrollViewIndicatorStyleWhite;
    scrollView.showsHorizontalScrollIndicator = NO;
    [self addSubview:scrollView];
    
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(ws).with.insets(UIEdgeInsetsMake(LENGTH(52), 0, 0, 0));
        scrollView.contentSize = CGSizeMake(scrollView.frame.size.width*self->_controllerArray.count, scrollView.frame.size.height-LENGTH(52));
        
    }];
    _controllerScroll = scrollView;
    // 设置scrollView的子视图，即过渡视图contentSize，并设置其约束
    UIView *horizontalContainerView = [[UIView alloc]init];
    [_controllerScroll addSubview:horizontalContainerView];
    [horizontalContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self->_controllerScroll);
        make.height.equalTo(self->_controllerScroll);
    }];
    //过渡视图添加子视图
    UIView *previousView =nil;
    for (int i = 0; i < _controllerArray.count; i++) {
        //        UIView *viewcon = [[UIView alloc] initWithFrame:CGRectMake(WIDTH*i, 0, WIDTH, HEIGHT)];
        UIViewController *viewcontroller = _controllerArray[i];
        UIView * viewcon = viewcontroller.view;
        viewcon.frame = CGRectMake(WIDTH*i, 0, WIDTH, HEIGHT);
        //        viewcon.backgroundColor = RGB(0xf6, 0xf6, 0xf6);
        [scrollView addSubview:viewcon];
        
        [viewcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(horizontalContainerView);
            make.bottom.equalTo(horizontalContainerView.mas_bottom).with.offset(0);
            
            make.width.equalTo(scrollView);
            
            if (previousView)
            {
                make.left.mas_equalTo(previousView.mas_right);
            }
            else
            {
                make.left.mas_equalTo(0);
            }
        }];
        
        previousView = viewcon;
    }
    // 设置过渡视图的右距（此设置将影响到scrollView的contentSize）
    [horizontalContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(previousView.mas_right);
    }];

    _controllerScroll.scrollEnabled = NO;

}
//监听滚动事件判断当前拖动到哪一个控制器
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    //        if (scrollView == _titleScroll) {
    NSInteger index = scrollView.contentOffset.x / WIDTH;
    [self selectButton:index];
    //    NSLog(@"%f",scrollView.contentOffset.x);
    
    //        }
}

@end
