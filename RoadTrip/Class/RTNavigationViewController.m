//
//  RTNavigationViewController.m
//  RoadTrip
//
//  Created by 一天 on 2017/10/26.
//  Copyright © 2017年 shuaixiao. All rights reserved.
//

#import "RTNavigationViewController.h"

@interface RTNavigationViewController ()

@end

@implementation RTNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
}
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.viewControllers.count) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
} 

@end
