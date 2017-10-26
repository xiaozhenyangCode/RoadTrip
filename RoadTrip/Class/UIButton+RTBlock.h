//
//  UIButton+RTBlock.h
//  RoadTrip
//
//  Created by 一天 on 2017/10/26.
//  Copyright © 2017年 shuaixiao. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^ButtonClick)(UIButton *sender);

@interface UIButton (RTBlock)

-(void)tapWithControlEvent:(UIControlEvents)event block:(ButtonClick)block;
@end
