//
//  RTTestRequestViewController.m
//  RoadTrip
//
//  Created by 一天 on 2017/10/30.
//  Copyright © 2017年 shuaixiao. All rights reserved.
//

#import "RTTestRequestViewController.h"
#import "User.h"
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
    
    User *u = [[User alloc]init];
    [u rt_addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
    _u = u;
}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    static int i = 0;
    i++;
    _u.name = [NSString stringWithFormat:@"%d",i];

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
