//
//  ViewController.m
//  RoadTrip
//
//  Created by 一天 on 2017/10/23.
//  Copyright © 2017年 shuaixiao. All rights reserved.
//

#import "ViewController.h"
#import <AMapNaviKit/AMapNaviKit.h>
@interface ViewController ()<AMapNaviDriveManagerDelegate>
@property(nonatomic,strong)AMapNaviDriveManager *driveManager;
@property(nonatomic,strong)AMapNaviDriveView *driveView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initDriveManager];
    [self configDriveNavi];

}
- (void)initDriveManager
{
    if (self.driveManager == nil)
    {
        self.driveManager = [[AMapNaviDriveManager alloc] init];
        [self.driveManager setDelegate:self];
    }
}
- (void)configDriveNavi
{
    [self.driveManager addDataRepresentative:self.driveView];
    [self.view addSubview:self.driveView];
}
//- (void)calculateRoute
//{
//    [self.driveManager calculateDriveRouteWithStartPoints:@[self.startPoint]
//                                                endPoints:@[self.endPoint]
//                                                wayPoints:nil
//                                          drivingStrategy:AMapNaviDrivingStrategySingleDefault];
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
