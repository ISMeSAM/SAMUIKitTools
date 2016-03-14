//
//  UINavigationController+SAMExtension.m
//  Demo
//
//  Created by samiMac on 16/3/11.
//  Copyright © 2016年 wydatas. All rights reserved.
//

#import "UINavigationController+SAMExtension.h"

@implementation UINavigationController (SAMExtension)

- (void)pushViewController:(UIViewController *)viewController animatedWithTransition:(UIViewAnimationTransition)transition
{
    [self pushViewController:viewController animated:NO];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.25f];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationTransition:transition forView:self.view cache:YES];
    [UIView commitAnimations];
}


- (void)popViewController:(UIViewController *)viewController animatedWithTransition:(UIViewAnimationTransition)transition
{
    [self popToViewController:viewController animated:NO];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.25f];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationTransition:transition forView:self.view cache:YES];
    [UIView commitAnimations];
}


- (UIViewController *)viewControllWithName:(NSString *)className
{
    for (UIViewController *vc in self.viewControllers)
    {
        if ([vc isKindOfClass:NSClassFromString(className)])
        {
            return vc;
        }
    }
    return nil;
}





@end



