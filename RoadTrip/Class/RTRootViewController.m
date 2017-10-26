//
//  RTRootViewController.m
//  RoadTrip
//
//  Created by 一天 on 2017/10/24.
//  Copyright © 2017年 shuaixiao. All rights reserved.
//

#import "RTRootViewController.h"
#import "RTHomeViewController.h"
#import "RTFindViewController.h"
#import "RTMineViewController.h"
#import "RTNavigationViewController.h"

@interface RTRootViewController ()<UITabBarControllerDelegate>

@end

@implementation RTRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    self.delegate = self;
    
    [self addChildControl];
    
}
- (void) addChildControl{
    
    RTHomeViewController *homeCtrl = [[RTHomeViewController alloc]init];
    [self addChildController:homeCtrl ctrlName:@"首页" imageName:@"tabbar01"];
    
    RTFindViewController *findCtrl = [[RTFindViewController alloc]init];
    [self addChildController:findCtrl ctrlName:@"发现" imageName:@"tabbar02"];
    
    RTMineViewController *mineCtrl = [[RTMineViewController alloc]init];
    [self addChildController:mineCtrl ctrlName:@"我的" imageName:@"tabbar03"];
}

- (void) addChildController:(UIViewController *)ctrl ctrlName:(NSString *)ctrlName imageName:(NSString *)imageName{
    
    ctrl.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    ctrl.tabBarItem.selectedImage = [[UIImage imageNamed:[NSString stringWithFormat:@"%@_select",imageName]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    ctrl.tabBarItem.title = ctrlName;
    [ctrl.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor redColor]}forState:UIControlStateSelected];
    ctrl.title = ctrlName;
    RTNavigationViewController *nav = [[RTNavigationViewController alloc] initWithRootViewController:ctrl];
    [self addChildViewController:nav];
    
}

#pragma mark - UITabBarControllerDelegate
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    

    return YES;
}



@end
