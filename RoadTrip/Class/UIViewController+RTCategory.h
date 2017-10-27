//
//  UIViewController+RTCategory.h
//  RoadTrip
//
//  Created by 一天 on 2017/10/27.
//  Copyright © 2017年 shuaixiao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (RTCategory)
- (void)presentChildViewController:(UIViewController *)childViewController;

- (void)dismissChildViewController:(UIViewController *)childViewController;
@end
