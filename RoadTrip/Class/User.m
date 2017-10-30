//
//  User.m
//  RoadTrip
//
//  Created by 帥萧 on 2017/10/30.
//  Copyright © 2017年 shuaixiao. All rights reserved.
//

#import "User.h"
#import <objc/runtime.h>

@implementation User
//当这个类接收到一个没有实现的类方法消息
//+(BOOL)resolveClassMethod:(SEL)sel{
//
//
//
//}
//当这个类接收到一个没有实现的实例方法消息
//+(BOOL)resolveInstanceMethod:(SEL)sel{
//
//    NSLog(@"%@",NSStringFromSelector(sel));
//
//    class_addMethod([self class], sel, (IMP)addProperty, "v@:@");
//
//    return [super resolveInstanceMethod:sel];
//}
//void addProperty(id self ,SEL _cmd,id obj){
//    NSLog(@"第一个参数是%@",self);
//    NSLog(@"%@",NSStringFromSelector(_cmd));
//    NSLog(@"参数是%@",obj);
//    NSLog(@"%s",__func__);
//}
@end
