//
//  RTTestRequestViewController.m
//  RoadTrip
//
//  Created by 一天 on 2017/10/30.
//  Copyright © 2017年 shuaixiao. All rights reserved.
//

#import "RTTestRequestViewController.h"
#import "User.h"
#import "OCTAppManager.h"

//oc 方法的调用 最终是调用函数!!而且每个函数都会接收两个隐式参数
//1.方法的调用者 2.方法编号!
@interface RTTestRequestViewController ()
@property(nonatomic,strong)User *u;
@end

@implementation RTTestRequestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = NSStringFromClass([self class]);

    NSURL *url = [NSURL URLWithString:@"http://www.baidu.com/zh"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSLog(@"%@",request);
    
    OCTAppManager *manager = [OCTAppManager sharedManager];
    [manager scanApps];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
