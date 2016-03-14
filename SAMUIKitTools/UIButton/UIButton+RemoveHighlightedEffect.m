//
//  UIButton+RemoveHighlightedEffect.m
//  Demo
//
//  Created by samiMac on 16/3/8.
//  Copyright © 2016年 wydatas. All rights reserved.
//

#import "UIButton+RemoveHighlightedEffect.h"

#import "NSObject+SAMExtension.h"

#import <objc/runtime.h>

static const void *kRemoveHighlightedEffect = &kRemoveHighlightedEffect;

@implementation UIButton (RemoveHighlightedEffect)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        [self swizzleInstanceSelecterWithOriginalSEL:@selector(setHighlighted:)
                                               mySEL:@selector(mySetHighlighted:)];
    });
    
}

- (void)mySetHighlighted:(BOOL)highlighted
{
    if (!self.removeHighlightedEffect)
    {
        [self mySetHighlighted:highlighted];
    }
    
}

- (void)setRemoveHighlightedEffect:(BOOL)removeHighlightedEffect
{
    objc_setAssociatedObject(self,
                             kRemoveHighlightedEffect,
                             @(removeHighlightedEffect),
                             OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)removeHighlightedEffect
{
    return objc_getAssociatedObject(self, kRemoveHighlightedEffect);
}







@end






