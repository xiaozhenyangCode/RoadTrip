//
//  RTInterview.m
//  RoadTrip
//
//  Created by 一天 on 2017/10/26.
//  Copyright © 2017年 shuaixiao. All rights reserved.
//

#import "RTInterview.h"

@implementation RTInterview


-(void)ARCProblem{
    
    id obj0 = @"oneDay";// OC 的字符串与 c 的字符串比较特殊,是存在了常量区.使用完不会释放
    __weak id obj1 = obj0; // 虽然 obj1 被弱引用了,但是 obj1 引用了 obj0 obj0是存在了常量区,所以 obj1 在使用完不会释放
    id obj2 = [NSObject new];// obj2 是一个对象类型的, 右边代码初始化以后得到的对象 obj2 是强引用的 相当于 __strong id obj2 = [NSObject new]; 在使用完会被释放
    __weak id obj3 = [NSObject new];// obj3 在被右边代码执行完毕以后就被 __weak 修饰 相当于一个对象刚创建就被释放了,这样写编辑器会报下面的警告Assigning retained object to weak variable; object will be released after assignment
    {
        id obj4 = [NSObject new]; // 由于 obj4是在函数 {} 里面使用的,所以在函数执行完毕后就会被释放
        
    }
    //递归  函数调用会开辟栈空间 OC 的方法调用会开辟栈空间
    //死循环
    
}
@end
