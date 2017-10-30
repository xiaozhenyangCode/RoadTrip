//
//  RTTestRequestViewController.m
//  RoadTrip
//
//  Created by 一天 on 2017/10/30.
//  Copyright © 2017年 shuaixiao. All rights reserved.
//

#import "RTTestRequestViewController.h"

@interface RTTestRequestViewController ()

@end

@implementation RTTestRequestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = NSStringFromClass([self class]);

    NSURL *url = [NSURL URLWithString:@"http://www.baidu.com/zh"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSLog(@"%@",request);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
