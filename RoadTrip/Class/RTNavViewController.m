//
//  RTNavViewController.m
//  RoadTrip
//
//  Created by 一天 on 2017/10/24.
//  Copyright © 2017年 shuaixiao. All rights reserved.
//

#import "RTNavViewController.h"
#import <AMapNaviKit/AMapNaviKit.h>

@interface RTNavViewController ()<AMapNaviDriveManagerDelegate, AMapNaviDriveViewDelegate>

@property (nonatomic, strong) AMapNaviDriveManager *driveManager;
@property (nonatomic, strong) AMapNaviDriveView *driveView;
@property (nonatomic, strong) AMapNaviPoint *startPoint;
@property (nonatomic, strong) AMapNaviPoint *endPoint;

@end

@implementation RTNavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置导航的起点和终点116.34232,40.076426
    self.startPoint = [AMapNaviPoint locationWithLatitude:39.96 longitude:116.47];
    self.endPoint   = [AMapNaviPoint locationWithLatitude:40.07 longitude:116.35];
    
    //初始化AMapNaviDriveManager
    if (self.driveManager == nil)
    {
        self.driveManager = [[AMapNaviDriveManager alloc] init];
        [self.driveManager setDelegate:self];
    }
    
    //初始化AMapNaviDriveView
    if (self.driveView == nil)
    {
        self.driveView = [[AMapNaviDriveView alloc] initWithFrame:self.view.bounds];
        [self.driveView setDelegate:self];
    }
    
    //将AMapNaviManager与AMapNaviDriveView关联起来
    [self.driveManager addDataRepresentative:self.driveView];
    //将AManNaviDriveView显示出来
    [self.view addSubview:self.driveView];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    //路径规划
    [self.driveManager calculateDriveRouteWithStartPoints:@[self.startPoint]
                                                endPoints:@[self.endPoint]
                                                wayPoints:nil
                                          drivingStrategy:AMapNaviDrivingStrategySingleDefault];
}

//路径规划成功后，开始模拟导航
- (void)driveManagerOnCalculateRouteSuccess:(AMapNaviDriveManager *)driveManager
{
    [self.driveManager startEmulatorNavi];
}
@end

