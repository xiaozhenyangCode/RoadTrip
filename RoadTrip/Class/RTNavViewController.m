//
//  RTNavViewController.m
//  RoadTrip
//
//  Created by 一天 on 2017/10/24.
//  Copyright © 2017年 shuaixiao. All rights reserved.
//

#import "RTNavViewController.h"
#import <AMapNaviKit/AMapNaviKit.h>
#import <AMapFoundationKit/AMapFoundationKit.h>
#import "SpeechSynthesizer.h"

@interface RTNavViewController ()<AMapNaviDriveManagerDelegate, AMapNaviDriveViewDelegate,UIAlertViewDelegate>

@property (nonatomic, strong) AMapNaviDriveManager *driveManager;
@property (nonatomic, strong) AMapNaviDriveView *driveView;
@property (nonatomic, strong) AMapNaviPoint *startPoint;
@property (nonatomic, strong) AMapNaviPoint *endPoint;
@property (nonatomic, assign) BOOL navBarHidden;
@property (nonatomic, assign) BOOL viewIsMove;
@property (nonatomic, strong) UIButton *startNavBtn;

@end

@implementation RTNavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addDrivewView];
}
-(void)addDrivewView{
    
    //设置导航的起点和终点116.34232,40.076426
    self.startPoint = [AMapNaviPoint locationWithLatitude:39.96 longitude:116.47];
    self.endPoint   = [AMapNaviPoint locationWithLatitude:40.07 longitude:116.35];
    
    //初始化AMapNaviDriveManager
    self.driveManager = [[AMapNaviDriveManager alloc] init];
    [self.driveManager setBroadcastMode:AMapNaviBroadcastModeConcise];
    [self.driveManager setDelegate:self];
    
    //初始化AMapNaviDriveView
    self.driveView = [[AMapNaviDriveView alloc] initWithFrame:CGRectMake(0, 0, kScreenSize.width, kScreenSize.height)];
    [self.driveView setDelegate:self];
    //将AMapNaviManager与AMapNaviDriveView关联起来
    
    [self.driveManager addDataRepresentative:self.driveView];
    [self.view addSubview:self.driveView];
      
    [self.driveView addSubview:self.startNavBtn];
}
-(void)startNavBtnClick{
   
    
      [self.driveManager calculateDriveRouteWithEndPoints:@[self.endPoint] wayPoints:nil drivingStrategy:AMapNaviDrivingStrategySingleDefault];
}
-(UIButton *)startNavBtn{
    if (!_startNavBtn) {
        _startNavBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 50)];
        _startNavBtn.backgroundColor = [UIColor randomColor];
        [_startNavBtn setTitle:@"开始导航" forState:UIControlStateNormal];
        [_startNavBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _startNavBtn.center = self.driveView.center;
        [_startNavBtn addTarget:self action:@selector(startNavBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _startNavBtn;
}
-(void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    _navBarHidden = NO;
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}
-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    _navBarHidden = YES;
}
-(void)driveViewCloseButtonClicked:(AMapNaviDriveView *)driveView{
    
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"确认退出导航?" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确认", nil];
    [alertView show];
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex == 1) {
        [[SpeechSynthesizer sharedSpeechSynthesizer]stopSpeak];
        [self.navigationController popViewControllerAnimated:YES];
    }
}
-(BOOL)driveManagerIsNaviSoundPlaying:(AMapNaviDriveManager *)driveManager{
    
    return [[SpeechSynthesizer sharedSpeechSynthesizer] isSpeaking];
}
- (void)driveManager:(AMapNaviDriveManager *)driveManager playNaviSoundString:(NSString *)soundString soundStringType:(AMapNaviSoundType)soundStringType{
    
    NSLog(@"playNaviSoundString:{%ld:%@}", (long)soundStringType, soundString);
    
    [[SpeechSynthesizer sharedSpeechSynthesizer] speakString:soundString];    
}
//路径规划成功后，开始模拟导航
- (void)driveManagerOnCalculateRouteSuccess:(AMapNaviDriveManager *)driveManager{
    _startNavBtn.hidden = YES;
    [self.driveManager startEmulatorNavi];
}
-(void)dealloc{
    
    [self.driveManager stopNavi];
}
@end

