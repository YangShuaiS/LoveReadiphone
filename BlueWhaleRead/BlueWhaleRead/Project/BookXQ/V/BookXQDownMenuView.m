//
//  BookXQDownMenuView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/3.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BookXQDownMenuView.h"
@interface BookXQDownMenuView () <UIScrollViewDelegate> {
    
    UIButton *_selectButton;
    UIScrollView *_titleScroll;
    UIScrollView *_controllerScroll;
}
@property (nonatomic, strong) NSMutableArray<BaseButton *> *buttonArray;
@property (nonatomic, strong) BaseButton * lastbutton;

@end
@implementation BookXQDownMenuView
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
    self.backgroundColor = [UIColor clearColor];
}
- (void)setTitarray:(NSArray *)titarray{
    _titarray = titarray;
    WS(ws);
    CGFloat wid = 0.0;
    CGFloat hei = LENGTH(34);
    if (_titarray.count == 3 || _titarray.count == 2) {
        wid = LENGTH(98);
    }else if(_titarray.count == 1){
        wid = LENGTH(110);
    }
    
    

    
    for (int i = 0; i < _titarray.count; i++) {
        BaseButton *titleButton = [BaseButton buttonWithType:UIButtonTypeCustom];
        titleButton.layer.masksToBounds = YES;
        titleButton.layer.cornerRadius= LENGTH(3);
        [titleButton setTitleColor:RGB(129,94,29) forState:UIControlStateNormal];
        [titleButton setTitle:_titarray[i] forState:UIControlStateNormal];
        titleButton.titleLabel.font = TextFont(17);
        titleButton.tag = 100+i;
        [titleButton addTarget:self action:@selector(scrollViewSelectToIndex:) forControlEvents:UIControlEventTouchUpInside];
        titleButton.backgroundColor = [UIColor clearColor];
        titleButton.userInteractionEnabled = YES;
        [self addSubview:titleButton];
        [self.buttonArray addObject:titleButton];
        
        if (i ==0 ) {
            self.lastbutton = titleButton;
            _selectButton = titleButton;
            [_selectButton setTitleColor:RGB(255,117,90) forState:UIControlStateNormal];
            titleButton.backgroundColor = RGB(255,255,255);
        }else{
            self.lastbutton = ws.buttonArray[i-1];
        }
        [titleButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(wid);
            make.height.mas_equalTo(hei);
            make.top.equalTo(ws).with.offset(LENGTH(10));

            if (ws.titarray.count == 1) {
                make.centerX.equalTo(ws).with.offset(0);
            }else if (ws.titarray.count ==3){
                if (i == 0) {
                    make.left.equalTo(ws).with.offset(LENGTH(30));
                }else if (i == 1){
                    make.centerX.equalTo(ws);
                }else if (i == 2){
                    make.right.equalTo(ws).with.offset(-LENGTH(30));
                }

            }else if (ws.titarray.count ==2){
                if (i == 0) {
                    make.centerX.equalTo(ws).with.offset(-LENGTH(wid/2));
                }else if (i == 1){
                    make.centerX.equalTo(ws).with.offset(LENGTH(wid/2));
                }
            }
        }];
        
    }
}
// 切换到相应的控制器页面
- (void)scrollViewSelectToIndex:(UIButton *)button{
    [self selectButton:button.tag-100];
    // 切换到选中的控制器的view
    [UIView animateWithDuration:0.5 animations:^{
        self->_controllerScroll.contentOffset = CGPointMake(self.frame.size.width*(button.tag-100), 0);
    }];
    
}
//选择某个按钮
- (void)selectButton:(NSInteger)index
{
    
    [UIView animateWithDuration:0 animations:^{
        // 如果选中其他的按钮，默认按钮回复原来的字体颜色和大小
        [self->_selectButton setTitleColor:RGB(129,94,29) forState:UIControlStateNormal];
        self->_selectButton.backgroundColor = [UIColor clearColor];
        
        // 设置选中的按钮
        self->_selectButton = self->_buttonArray[index];
        self->_selectButton.backgroundColor = RGB(255,255,255);
    } completion:^(BOOL finished) {
        [self->_selectButton setTitleColor:RGB(255,117,90) forState:UIControlStateNormal];
    }];

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
    //不-1就会出现上面留空
//    if ([IOS_X integerValue]>=11.0) {
//        scrollView.contentInset = UIEdgeInsetsMake(-1, 0, 0, 0);
//    }
    
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(ws).with.insets(UIEdgeInsetsMake(LENGTH(40), 0, 0, 0));
        scrollView.contentSize = CGSizeMake(scrollView.frame.size.width*self->_controllerArray.count, scrollView.frame.size.height-LENGTH(40));
        
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

//    _controllerScroll.scrollEnabled = NO;
}

//监听滚动事件判断当前拖动到哪一个控制器
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    //        if (scrollView == _titleScroll) {
    NSInteger index = scrollView.contentOffset.x / self.frame.size.width;
    [self selectButton:index];
    //    NSLog(@"%f",scrollView.contentOffset.x);
    
    //        }
}

- (void)layoutSubviews{
    [super layoutSubviews];

//    for (BaseButton *button in _buttonArray) {
//        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:button.bounds byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(LENGTH(20), LENGTH(20))];
//        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
//        maskLayer.frame = button.bounds;
//        maskLayer.path = maskPath.CGPath;
//        button.layer.mask = maskLayer;
//    }
}

- (void)setMoren:(NSInteger)moren{
    _moren = moren;
    [self selectButton:moren];
    [self.superview layoutIfNeeded];
    self->_controllerScroll.contentOffset = CGPointMake(self.frame.size.width*(moren), 0);


}
@end
