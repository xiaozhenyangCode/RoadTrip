//
//  NSArray+Ca.m
//  test
//
//  Created by xiaozhenyang on 15/9/7.
//  Copyright (c) 2015年 Liuodu. All rights reserved.
//

#import "NSArray+Ca.h"

@implementation NSArray (Ca)
- (NSString*)descriptionWithLocale:(id)locale
{
    NSMutableString* strM = [NSMutableString stringWithString:@"(\n"];
    
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL* stop) {
        [strM appendFormat:@"\t%@,\n", obj];
    }];
    
    [strM appendString:@")"];
    
    return strM;
}
@end

@implementation NSDictionary (Log)

- (NSString*)descriptionWithLocale:(id)locale
{
    NSMutableString* strM = [NSMutableString stringWithString:@"{\n"];
    
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL* stop) {
        [strM appendFormat:@"\t%@ = %@;\n", key, obj];
    }];
    
    [strM appendString:@"}\n"];
    
    return strM;
}

@end