//
//  NSObject+Category.m
//  Ce
//
//  Created by 456 on 15/9/24.
//  Copyright (c) 2015年 张红涛. All rights reserved.
//

#import "NSObject+Category.h"
#import <objc/runtime.h>

static char __logDeallocAssociatedKey__;
@interface LogDealloc : NSObject
@property (nonatomic, copy) NSString *message;
@end

@implementation LogDealloc
- (void)dealloc
{
    NSLog(@"dealloc :%@",self.message);
}
@end


@implementation NSObject (Category)

+ (NSString *)classString
{
    return NSStringFromClass([self class]);
}

- (NSString *)classString
{
    return NSStringFromClass([self class]);
}


- (void)associateValue:(id)value withKey:(void *)key
{
    objc_setAssociatedObject(self, key, value, OBJC_ASSOCIATION_RETAIN);
}

- (void)weakAssoicateVaule:(id)value withKey:(void *)key
{
    objc_setAssociatedObject(self, key, value, OBJC_ASSOCIATION_ASSIGN);
}

- (id)accociatedVauleForKey:(void *)key
{
    return objc_getAssociatedObject(self, key);
}


- (BOOL)isVauleForKeyPath:(NSString *)keyPath equalToVaule:(id)value
{
    if ([keyPath length] > 0)
    {
        id objectValue = [self valueForKeyPath:keyPath];
        return ([objectValue isEqual:value] || ((objectValue == nil) && (value == nil)));
    }
    return NO;
}

- (BOOL)isVauleForKeyPath:(NSString *)keyPath identicalToVaule:(id)value
{
    if ([keyPath length] > 0)
    {
        return ([self valueForKeyPath:keyPath] == value);
    }
    return NO;
}

+ (NSDictionary *)propertyAttributes
{
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
    
    unsigned int count = 0;
    objc_property_t *properies = class_copyPropertyList(self, &count);
    
    for (int i = 0  ; i < count; i ++)
    {
        objc_property_t property = properies[i];
        NSString *name = [NSString stringWithUTF8String:property_getName(property)];
        NSString *attribute = [NSString stringWithUTF8String:property_getAttributes(property)];
        [dictionary setObject:attribute forKey:name];
    }
    free(properies);
    
    if ([dictionary count] > 0) {
        return dictionary;
    }
    return nil;
}

- (void)logOnDealloc
{
    if (objc_getAssociatedObject(self, &__logDeallocAssociatedKey__) == nil)
    {
        LogDealloc *log = [[LogDealloc alloc] init];
        log.message = NSStringFromClass(self.class);
        objc_setAssociatedObject(self, &__logDeallocAssociatedKey__, log, OBJC_ASSOCIATION_RETAIN);
    }
}


@end
