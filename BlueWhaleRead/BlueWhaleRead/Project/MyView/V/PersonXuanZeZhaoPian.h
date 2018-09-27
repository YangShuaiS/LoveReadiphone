//
//  PersonXuanZeZhaoPian.h
//  BoWanJuanForPad
//
//  Created by 杨帅 on 2018/6/5.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseView.h"
typedef void(^BlockImage)(UIImage * image);

@interface PersonXuanZeZhaoPian : BaseView<UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property (nonatomic,copy)BlockImage block;//定义一个MyBlock属性

@end
