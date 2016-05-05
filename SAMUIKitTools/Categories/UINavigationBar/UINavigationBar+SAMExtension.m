//
//  UINavigationBar+SAMExtension.m
//  Demo
//
//  Created by samiMac on 16/5/5.
//  Copyright © 2016年 wydatas. All rights reserved.
//

#import "UINavigationBar+SAMExtension.h"
#import <objc/runtime.h>

static const void *kOverlayKey = &kOverlayKey;
@implementation UINavigationBar (SAMExtension)

- (UIView *)overlay
{
    return objc_getAssociatedObject(self, kOverlayKey);
}

- (void)setOverlay:(UIView *)overlay
{
    objc_setAssociatedObject(self, kOverlayKey, overlay, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


- (void)setSam_backgroundColor:(UIColor *)sam_backgroundColor
{
    if (!self.overlay) {
        [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        self.overlay = [[UIView alloc] initWithFrame:CGRectMake(0, -20, [UIScreen mainScreen].bounds.size.width, CGRectGetHeight(self.bounds) + 20)];
        self.overlay.userInteractionEnabled = NO;
        self.overlay.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        [self insertSubview:self.overlay atIndex:0];
    }
    self.overlay.backgroundColor = sam_backgroundColor;
}

- (UIColor *)sam_backgroundColor
{
    return self.overlay.backgroundColor;
}


@end
