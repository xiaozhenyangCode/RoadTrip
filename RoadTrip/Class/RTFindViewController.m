//
//  RTFindViewController.m
//  RoadTrip
//
//  Created by 一天 on 2017/10/24.
//  Copyright © 2017年 shuaixiao. All rights reserved.
//

#import "RTFindViewController.h"
#import "RouteDrawViewController.h"

@interface RTFindViewController ()

@end

@implementation RTFindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSource = [NSMutableArray arrayWithObjects:@"9",@"8",@"7",@"6",@"5",@"4",@"3",@"2",@"1",@"0",nil];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    RouteDrawViewController *ctrl = [[RouteDrawViewController alloc]init];
    [self.navigationController pushViewController:ctrl animated:YES];
    
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
