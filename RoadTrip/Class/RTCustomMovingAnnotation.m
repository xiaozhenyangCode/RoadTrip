//
//  RTCustomMovingAnnotation.m
//  RoadTrip
//
//  Created by 一天 on 2017/12/12.
//  Copyright © 2017年 shuaixiao. All rights reserved.
//

#import "RTCustomMovingAnnotation.h"

@implementation RTCustomMovingAnnotation
- (void)step:(CGFloat)timeDelta {
    [super step:timeDelta];
    
    if(self.stepCallback) {
        self.stepCallback();
    }
}

- (CLLocationDirection)rotateDegree {
    return 0;
}
@end
