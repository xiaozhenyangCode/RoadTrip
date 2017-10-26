//
//  RTBaseViewController.h
//  RoadTrip
//
//  Created by 一天 on 2017/10/24.
//  Copyright © 2017年 shuaixiao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RTBaseViewController : UIViewController
@property(nonatomic,strong)UITableView *tableView;

@property(nonatomic,strong)NSMutableArray *dataSource;
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
@end
