//
//  PersonalTableView.h
//  BoWanJuanForPad
//
//  Created by 杨帅 on 2018/6/5.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseTableView.h"
#import "GFAddressPicker.h"

@interface PersonalTableView : BaseTableView<GFAddressPickerDelegate>
@property (nonatomic,strong)UIView * baseview;
@property (nonatomic,strong)MyZiLiaoModel * model;
@property(nonatomic,strong)UIViewController * vc;
@property (nonatomic, strong) GFAddressPicker *pickerView;

@end
