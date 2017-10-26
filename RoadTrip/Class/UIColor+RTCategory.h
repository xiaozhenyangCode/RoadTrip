//
//  UIColor+RTCategory.h
//  RoadTrip
//
//  Created by 一天 on 2017/10/24.
//  Copyright © 2017年 shuaixiao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (RTCategory)
/*
 * Creating
 */
+ (UIColor *)colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;
+ (UIColor *)colorWithHexString:(NSString *)hexString;
+ (UIColor *)randomColor;

/**
 项目表格边框所需五种随机颜色
 
 @return 随机颜色
 */
+ (UIColor *)getRandomColor;
/*
 * Components
 */
- (CGFloat)red;
- (CGFloat)green;
- (CGFloat)blue;
- (CGFloat)alpha;
- (NSString *)hexString;
@end
