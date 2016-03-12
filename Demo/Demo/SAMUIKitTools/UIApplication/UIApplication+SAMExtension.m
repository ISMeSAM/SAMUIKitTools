//
//  UIApplication+SAMExtension.m
//  Demo
//
//  Created by samiMac on 16/3/12.
//  Copyright © 2016年 wydatas. All rights reserved.
//

#import "UIApplication+SAMExtension.h"

@implementation UIApplication (SAMExtension)

- (CGFloat)version
{
    return [[[NSBundle mainBundle] infoDictionary][@"CFBundleShortVersionString"] doubleValue];
}



@end
