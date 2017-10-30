//
//  NSObject+RTCategory.h
//  RoadTrip
//
//  Created by 帥萧 on 2017/10/30.
//  Copyright © 2017年 shuaixiao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSObject (RTCategory)
- (void)rt_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void *)context;

+ (NSString *)classString;
- (NSString *)classString;


- (void)associateValue:(id)value withKey:(void *)key;
- (void)weakAssoicateVaule:(id)value withKey:(void *)key;
- (id)accociatedVauleForKey:(void *)key;


- (BOOL)isVauleForKeyPath:(NSString *)keyPath equalToVaule:(id)value;
- (BOOL)isVauleForKeyPath:(NSString *)keyPath identicalToVaule:(id)value;
+ (NSDictionary *)propertyAttributes;

- (void)logOnDealloc;

/// 使用字典数组创建当前类对象的数组
///
/// @param array 字典数组
///
/// @return 当前类对象的数组
+ (NSArray *)rt_objectsWithArray:(NSArray *)array;

/// 返回当前类的属性数组
///
/// @return 属性数组
+ (NSArray *)rt_propertiesList;

/// 返回当前类的成员变量数组
///
/// @return 成员变量数组
+ (NSArray *)rt_ivarsList;
@end
