//
//  UIButton+RTBlock.m
//  RoadTrip
//
//  Created by 一天 on 2017/10/26.
//  Copyright © 2017年 shuaixiao. All rights reserved.
//

#import "UIButton+RTBlock.h"
#import <objc/runtime.h>

static const void *ButtonClicKey = &ButtonClicKey;

@implementation UIButton (RTBlock)
-(void)tapWithControlEvent:(UIControlEvents)event block:(ButtonClick)block{
    
    [self addTarget:self action:@selector(buttonClick:) forControlEvents:event];
    
    objc_setAssociatedObject(self, ButtonClicKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
-(void)buttonClick:(UIButton *)sender{
    
    ButtonClick block = objc_getAssociatedObject(sender, ButtonClicKey);
    if (block) {
        block(sender);
    }
}
@end
