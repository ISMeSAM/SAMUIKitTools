//
//  UIApplication+SAMExtension.m

#import "UIApplication+SAMExtension.h"

@implementation UIApplication (SAMExtension)

- (CGFloat)version
{
    return [[[NSBundle mainBundle] infoDictionary][@"CFBundleShortVersionString"] doubleValue];
}



@end
