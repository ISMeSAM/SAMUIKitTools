//
//  UINavigationController+SAMExtension.h
//  Demo
//
//  Created by samiMac on 16/3/11.
//  Copyright © 2016年 wydatas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (SAMExtension)

/**
 *  以某种转场动画push一个控制器
 *
 *  @param viewController 要push的控制器
 *  @param transition     动画效果
 */
- (void)pushViewController:(UIViewController *)viewController animatedWithTransition:(UIViewAnimationTransition)transition;

/**
 *  以某种转场动画pop一个控制器
 *
 *  @param viewController 要pop的控制器
 *  @param transition     动画效果
 */
- (void)popViewController:(UIViewController *)viewController animatedWithTransition:(UIViewAnimationTransition)transition;


/**
 *  在栈中根据name(classname)找到控制器
 *
 *  @param ctrlName name
 *
 *  @return 找寻的结果(nullable)
 */
- (UIViewController *)viewControllWithName:(NSString *)ctrlName;




@end





