//
//  NSObject+Category.h
//  Ce
//
//  Created by 456 on 15/9/24.
//  Copyright (c) 2015年 张红涛. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface NSObject (Category)


+ (NSString *)classString;
- (NSString *)classString;


- (void)associateValue:(id)value withKey:(void *)key;
- (void)weakAssoicateVaule:(id)value withKey:(void *)key;
- (id)accociatedVauleForKey:(void *)key;


- (BOOL)isVauleForKeyPath:(NSString *)keyPath equalToVaule:(id)value;
- (BOOL)isVauleForKeyPath:(NSString *)keyPath identicalToVaule:(id)value;
+ (NSDictionary *)propertyAttributes;

- (void)logOnDealloc;

@end
