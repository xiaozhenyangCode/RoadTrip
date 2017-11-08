//
//  OCTApp.h
//  Springboard
//
//  Created by Octree on 2016/7/31.
//  Copyright © 2016年 Octree. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OCTApp : NSObject
// ODR的磁盘使用情况
@property (nonatomic, readonly) NSNumber *ODRDiskUsage;
// 应用标识符
@property (nonatomic, readonly) NSString *applicationIdentifier;
// 应用类型
@property (nonatomic, readonly) NSString *applicationType;
// 动态磁盘使用情况
@property (nonatomic, readonly) NSNumber *dynamicDiskUsage;
// 是否是Beta应用程序
@property (nonatomic, readonly) BOOL isBetaApp;
// 是否已安装
@property (nonatomic, readonly) BOOL isInstalled;
// 是否是新闻应用程序
@property (nonatomic, readonly) BOOL isNewsstandApp;
// 占位符
@property (nonatomic, readonly) BOOL isPlaceholder;
// 限制
@property (nonatomic, readonly) BOOL isRestricted;
// 是否是 iWatch 应用
@property (nonatomic, readonly) BOOL isWatchKitApp;
//项目id
@property (nonatomic, readonly) NSNumber *itemID;
//项目名称
@property (nonatomic, readonly) NSString *itemName;
//最小系统版本
@property (nonatomic, readonly) NSString *minimumSystemVersion;
//SDK版本
@property (nonatomic, readonly) NSString *sdkVersion;
//短 版本 字符串
@property (nonatomic, readonly) NSString *shortVersionString;
//源程序标识符
@property (nonatomic, readonly) NSString *sourceAppIdentifier;
//静态磁盘使用
@property (nonatomic, readonly) NSNumber *staticDiskUsage;
//团队编号
@property (nonatomic, readonly) NSString *teamID;
// 应用标识
@property (nonatomic, readonly) NSString *bundleIdentifier;


- (instancetype)initWithAppProxy:(id)app;
// APP 名称
- (NSString *)localizedName;
// icon
- (UIImage *)iconImage;
// 占多大内存
- (NSString *)prettySizeString;
// 是否是系统内部的应用
- (BOOL)isSystemOrInternalApp;

@end
