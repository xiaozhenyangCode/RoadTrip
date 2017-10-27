//
//  UIViewController+RTCategory.m
//  RoadTrip
//
//  Created by 一天 on 2017/10/27.
//  Copyright © 2017年 shuaixiao. All rights reserved.
//

#import "UIViewController+RTCategory.h"
#import <objc/runtime.h>
@implementation UIViewController (RTCategory)

+ (void)load{
    //方法交换应该被保证在程序中只会执行一次
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL systemSel = @selector(viewWillAppear:);
        SEL rtvySel = @selector(rt_viewWillAppear:);
        Method systemMethod = class_getInstanceMethod([self class], systemSel);
        Method henvyMethod = class_getInstanceMethod([self class], rtvySel);
        BOOL isAdd = class_addMethod(self, systemSel, method_getImplementation(henvyMethod),method_getTypeEncoding(henvyMethod));
        if (isAdd) {
            //如果成功，说明类中不存在这个方法的实现
            //将被交换方法的实现替换到这个并不存在的实现
            class_replaceMethod(self, rtvySel, method_getImplementation(systemMethod), method_getTypeEncoding(systemMethod));
        }else{
            //否则，交换两个方法的实现
            method_exchangeImplementations(systemMethod, henvyMethod);
            //主要看method_exchangeImplementations(systemMethod, henvyMethod)，该函数将系统的方法和我的方法进行了交换，这个时候在一个自己定义的viewController中viewWillAppear方法中就可以看到输出henvy。这一点在我们需求需要更改的时候，但又不想改变原来的方法的时候是非常有用的。
        }
    });
}
- (void)rt_viewWillAppear:(BOOL)animated{
    //这里自己调用自己，表面上循环引用其实已经被viewWillAppear替换掉了
    [self rt_viewWillAppear:animated];
    NSLog(@"%@页面被加载完毕",self.title);
}

- (void)presentChildViewController:(UIViewController *)childViewController{
    
    [self addChildViewController:childViewController];
    [self.view addSubview:childViewController.view];
    [childViewController didMoveToParentViewController:self];
}

- (void)dismissChildViewController:(UIViewController *)childViewController{
    
    [childViewController willMoveToParentViewController:nil];
    [childViewController.view removeFromSuperview];
    [childViewController removeFromParentViewController];
}
@end
