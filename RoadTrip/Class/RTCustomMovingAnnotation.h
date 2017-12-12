//
//  RTCustomMovingAnnotation.h
//  RoadTrip
//
//  Created by 一天 on 2017/12/12.
//  Copyright © 2017年 shuaixiao. All rights reserved.
//

#import <MAMapKit/MAMapKit.h>
typedef void (^CustomMovingAnnotationCallback)();

@interface RTCustomMovingAnnotation : MAAnimatedAnnotation

@property (nonatomic, copy) CustomMovingAnnotationCallback stepCallback;

- (CLLocationDirection)rotateDegree;
@end
