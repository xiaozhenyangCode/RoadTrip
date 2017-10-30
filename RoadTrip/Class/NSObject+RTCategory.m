//
//  NSObject+RTCategory.m
//  RoadTrip
//
//  Created by 帥萧 on 2017/10/30.
//  Copyright © 2017年 shuaixiao. All rights reserved.
//

#import "NSObject+RTCategory.h"
#import <objc/message.h>

static char __logDeallocAssociatedKey__;
@interface LogDealloc : NSObject
@property (nonatomic, copy) NSString *message;
@end

@implementation LogDealloc
- (void)dealloc{
    NSLog(@"dealloc :%@",self.message);
}
@end

@implementation NSObject (RTCategory)
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
+ (NSArray *)rt_objectsWithArray:(NSArray *)array {
    
    if (array.count == 0) {
        return nil;
    }
    
    // 断言是字典数组
    NSAssert([array[0] isKindOfClass:[NSDictionary class]], @"必须传入字典数组");
    
    // 0. 获得属性数组
    NSArray *list = [self rt_propertiesList];
    
    // 1. 遍历数组
    NSMutableArray *arrayM = [NSMutableArray array];
    for (NSDictionary *dict in array) {
        
        // 2. 创建对象
        id obj = [self new];
        
        // 3. 遍历字典
        for (NSString *key in dict) {
            // 判断字典中的 key 是否在成员变量中存在
            if (![list containsObject:key]) {
                continue;
            }
            
            [obj setValue:dict[key] forKey:key];
        }
        
        // 4. 将对象添加到数组
        [arrayM addObject:obj];
    }
    
    return arrayM.copy;
}

void *propertiesKey = "cn.itcast.propertiesList";

+ (NSArray *)rt_propertiesList {
    
    // 获取关联对象
    NSArray *result = objc_getAssociatedObject(self, propertiesKey);
    
    if (result != nil) {
        return result;
    }
    
    unsigned int count = 0;
    objc_property_t *list = class_copyPropertyList([self class], &count);
    
    // 遍历所有的属性
    NSMutableArray *arrayM = [NSMutableArray array];
    
    for (unsigned int i = 0; i < count; i++) {
        
        objc_property_t pty = list[i];
        
        // 获取 ivar 名称
        const char *cName = property_getName(pty);
        NSString *name = [NSString stringWithUTF8String:cName];
        
        [arrayM addObject:name];
    }
    
    free(list);
    
    // 设置关联对象
    objc_setAssociatedObject(self, propertiesKey, arrayM, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    return objc_getAssociatedObject(self, propertiesKey);
}

void *ivarsKey = "cn.itcast.ivarsList";

+ (NSArray *)rt_ivarsList {
    
    // 获取关联对象
    NSArray *result = objc_getAssociatedObject(self, ivarsKey);
    
    if (result != nil) {
        return result;
    }
    
    unsigned int count = 0;
    Ivar *list = class_copyIvarList([self class], &count);
    
    // 遍历所有的属性
    NSMutableArray *arrayM = [NSMutableArray array];
    
    for (unsigned int i = 0; i < count; i++) {
        
        Ivar ivar = list[i];
        
        // 获取 ivar 名称
        const char *cName = ivar_getName(ivar);
        NSString *name = [NSString stringWithUTF8String:cName];
        
        [arrayM addObject:name];
    }
    
    free(list);
    
    // 设置关联对象
    objc_setAssociatedObject(self, ivarsKey, arrayM, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    return objc_getAssociatedObject(self, ivarsKey);
}
-(void)rt_observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    
    
    
}
@end
