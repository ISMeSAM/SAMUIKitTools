//
//  UIBarButtonItem+SAMExtension.m
//  Demo
//
//  Created by samiMac on 16/3/11.
//  Copyright © 2016年 wydatas. All rights reserved.
//

#import "UIBarButtonItem+SAMExtension.h"
#import "UIView+SAMExtension.h"


@implementation UIBarButtonItem (SAMExtension)


+ (instancetype)itemWithTitle:(NSString *)title
                       target:(id)target
                       action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    
    [button setTitle:title forState:UIControlStateNormal];

    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    [button sizeToFit];
    
    return [[self alloc] initWithCustomView:button];
}

+ (instancetype)itemWithTitle:(NSString *)title
                  normalColor:(UIColor *)normalColor
                 pressedColor:(UIColor *)pressedColor
                       target:(id)target
                       action:(SEL)action
{
    UIButton *button = [[UIButton alloc] init];
    
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:normalColor forState:UIControlStateNormal];
    [button setTitleColor:pressedColor forState:UIControlStateHighlighted];
    [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateDisabled];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    [button sizeToFit];
    
    return [[self alloc] initWithCustomView:button];
}


+ (instancetype)itemWithImageName:(NSString *)imageName
                           target:(id)target
                           action:(SEL)action
{
    UIButton *button = [[UIButton alloc] init];
    
    if (imageName) {
        
        [button setImage:[UIImage imageNamed:imageName]
                forState:UIControlStateNormal];
        
        UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"%@_highlighted",imageName]];
        
        if (img) {
            [button setImage:img forState:UIControlStateHighlighted];
        }
    }
    
    button.size = button.currentImage.size;
    
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}



+ (instancetype)itemWithImageName:(NSString *)imageName
                            title:(NSString *)title
                           target:(id)target
                           action:(SEL)action
{
    UIButton *btn = [[UIButton alloc] init];
    
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    
    UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"%@_highlighted",imageName]];
    UIImage *imgSelected = [UIImage imageNamed:[NSString stringWithFormat:@"%@_selected",imageName]];
    if (img) {
        [btn setImage:img forState:UIControlStateHighlighted];
    }
    if (img) {
        [btn setImage:imgSelected forState:UIControlStateSelected];
    }
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    
    
    [btn setTitle:title forState:UIControlStateNormal];
    
    [btn sizeToFit];
    
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}


+ (instancetype)itemWithImageName:(NSString *)imageName
                selectedImageName:(NSString *)selectedImageName
                           target:(id)target
                           action:(SEL)action
{
    UIButton *btn = [[UIButton alloc] init];
    
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:selectedImageName] forState:UIControlStateSelected];
    btn.size = btn.currentImage.size;
    
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}




@end
