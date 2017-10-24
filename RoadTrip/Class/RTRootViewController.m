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

@interface RTRootViewController ()<UITabBarControllerDelegate>

@end

@implementation RTRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    self.delegate = self;
    
    [self addChildControlWithIslogin:YES];
    
}

- (void) addChildControlWithIslogin:(BOOL)isLogin{
    
    RTHomeViewController *homePage = [[RTHomeViewController alloc]init];
    homePage.tabBarItem.tag = 300;
    [self addChildController:homePage CtlName:@"首页" CtlImage:@"tabbar01"];
    
    RTFindViewController *commodityList = [[RTFindViewController alloc]init];
    commodityList.tabBarItem.tag = 300;
    [self addChildController:commodityList CtlName:@"发现" CtlImage:@"tabbar02"];
    
    RTMineViewController *myCenter = [[RTMineViewController alloc]init];
    myCenter.tabBarItem.tag = 300;
    [self addChildController:myCenter CtlName:@"我的" CtlImage:@"tabbar03"];
}

- (void) addChildController:(UIViewController *)ctl CtlName:(NSString *)ctlName CtlImage:(NSString *)imageName{
    
    ctl.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    ctl.tabBarItem.selectedImage = [[UIImage imageNamed:[NSString stringWithFormat:@"%@_selected",imageName]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    ctl.tabBarItem.title = ctlName;

    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:ctl];
    [self addChildViewController:nav];
    
}

#pragma mark - UITabBarControllerDelegate
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    
    
    return YES;
}



@end
