//
//  ViewController.m
//  RoadTrip
//
//  Created by 一天 on 2017/10/23.
//  Copyright © 2017年 shuaixiao. All rights reserved.
//

#import "ViewController.h"
#import <AMapNaviKit/AMapNaviKit.h>
@interface ViewController ()<AMapNaviDriveManagerDelegate,AMapNaviDriveViewDelegate>
@property(nonatomic,strong)AMapNaviDriveManager *driveManager;
@property(nonatomic,strong)AMapNaviDriveView *driveView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initDriveView];

    [self initDriveManager];
    [self configDriveNavi];

}
- (void)initDriveView
{
    if (self.driveView == nil)
    {
        self.driveView = [[AMapNaviDriveView alloc] initWithFrame:self.view.bounds];
        self.driveView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        [self.driveView setDelegate:self];
        
        [self.view addSubview:self.driveView];
    }
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
    //将driveView添加为导航数据的Representative，使其可以接收到导航诱导数据
    [self.driveManager addDataRepresentative:self.driveView];
    [self.view addSubview:self.driveView];
}
- (void)driveManagerOnCalculateRouteSuccess:(AMapNaviDriveManager *)driveManager
{
    NSLog(@"onCalculateRouteSuccess");
    
    //算路成功后开始GPS导航
    [self.driveManager startGPSNavi];
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
