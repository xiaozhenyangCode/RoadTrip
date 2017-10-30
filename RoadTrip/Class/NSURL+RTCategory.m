//
//  NSURL+RTCategory.m
//  RoadTrip
//
//  Created by 一天 on 2017/10/30.
//  Copyright © 2017年 shuaixiao. All rights reserved.
//

#import "NSURL+RTCategory.h"
#import <objc/runtime.h>

@implementation NSURL (RTCategory)

+(void)load{
    //class_getClassMethod; 获取类方法
    //class_getInstanceMethod;  获取实例方法
    Method systemSel =  class_getClassMethod([self class], @selector(URLWithString:));
    Method rtSel =  class_getClassMethod([self class], @selector(RT_URLWithString:));
    method_exchangeImplementations(systemSel, rtSel);
}
+(instancetype)RT_URLWithString:(NSString *)string{
    
    NSURL *url = [self RT_URLWithString:string];
    if (url == nil) {
        NSLog(@"传入一个为空的 URLString");
    }
    return url;
}
@end
