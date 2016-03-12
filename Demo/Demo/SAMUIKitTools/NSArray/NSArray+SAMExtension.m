//
//  NSArray+SAMExtension.m
//  Demo
//
//  Created by samiMac on 16/3/12.
//  Copyright © 2016年 wydatas. All rights reserved.
//

#import "NSArray+SAMExtension.h"

@implementation NSArray (SAMExtension)

- (NSString *)stringWithArray
{
    
    if (self == nil || self.count == 0) {
        return @"";
    }
    
    NSMutableString *strM = [NSMutableString string];
    
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [strM appendFormat:@"%@,",obj];
    }];
    
    // 去掉 最后一个逗号 ,
    NSString *string = [strM substringWithRange:NSMakeRange(0, strM.length - 1)];
    
    return [string copy];
}


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



@implementation NSDictionary (SAMExtension)


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
