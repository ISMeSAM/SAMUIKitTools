//
//  UIView+SAMExtension.m
//  Demo
//
//  Created by samiMac on 16/3/9.
//  Copyright © 2016年 wydatas. All rights reserved.
//

#import "UIView+SAMExtension.h"
#import <QuartzCore/QuartzCore.h>


@implementation UIView (SAMExtension)

IB_DESIGNABLE

- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    
    frame.origin.x = x;
    
    self.frame = frame;
    
}


- (CGFloat)x
{
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    
    frame.origin.y = y;
    
    self.frame = frame;
    
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

-(void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    
    frame.size.width = width;
    
    self.frame = frame;
    
}

- (CGFloat)width
{
    return self.frame.size.width;
}


- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    
    frame.size.height = height;
    
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size
{
    return self.frame.size;
}

- (void)setCenter_x:(CGFloat)center_x
{
    CGPoint center = self.center;
    center.x = center_x;
    self.center = center;
    
}

- (CGFloat)center_x
{
    return self.center.x;
}

- (void)setCenter_y:(CGFloat)center_y
{
    CGPoint center = self.center;
    center.y = center_y;
    self.center = center;
}
- (CGFloat)center_y
{
    return self.center.y;
}


- (void)setCornerRadius:(CGFloat)cornerRadius
{
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = YES;
}

- (CGFloat)cornerRadius
{
    return self.layer.cornerRadius;
}

- (void)setBorderColor:(UIColor *)borderColor
{
    self.layer.borderColor = borderColor.CGColor;
    
}
- (UIColor *)borderColor
{
    return [UIColor colorWithCGColor:self.layer.borderColor];
}

- (void)setBorderWidth:(CGFloat)borderWidth
{
    self.layer.borderWidth = borderWidth;
}


- (CGFloat)borderWidth
{
    return self.layer.borderWidth;
}



#pragma mark - 


- (UIButton *)getButtonWithTag:(NSInteger)viewTag
{
    id button = [self viewWithTag:viewTag];
    
    if ([button isKindOfClass:[UIButton class]]) {
        
        return (UIButton *)button;
    }
    return nil;
}

- (UIImageView *)getImageViewWithTag:(NSInteger)viewTag
{
    id button = [self viewWithTag:viewTag];
    
    if ([button isKindOfClass:[UIImageView class]]) {
        
        return (UIImageView *)button;
    }
    return nil;
}

- (UILabel *)getLabelWithTag:(NSInteger)viewTag
{
    id button = [self viewWithTag:viewTag];
    
    if ([button isKindOfClass:[UILabel class]]) {
        
        return (UILabel *)button;
    }
    return nil;
}

- (UITextField *)getTextFieldWithTag:(NSInteger)viewTag
{
    id button = [self viewWithTag:viewTag];
    
    if ([button isKindOfClass:[UITextField class]]) {
        
        return (UITextField *)button;
    }
    return nil;
}


#pragma mark - 

- (void)beginRespirationLamp
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"opacity"];

    animation.fromValue=[NSNumber numberWithFloat:self.alpha>0?1:0];
    animation.toValue=[NSNumber numberWithFloat:self.alpha>0?0:1];
    
    animation.autoreverses=YES;
    
    animation.repeatCount=FLT_MAX;
    
    animation.removedOnCompletion=NO;
    
    animation.duration=2;
    
    animation.fillMode=kCAFillModeForwards;
    
    [self.layer addAnimation:animation forKey:@"RespirationLamp"];
}

- (void)endRespirationLamp
{
    [self.layer removeAnimationForKey:@"RespirationLamp"];
}

- (void)radianWithTransform:(NSInteger)_x withAnimation:(BOOL)_animation
{
    if (_animation) {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationDelegate:self];
    }
    
    self.transform = CGAffineTransformMakeRotation(M_PI*_x / 180.0);
    
    if (_animation) {
        [UIView commitAnimations];
    }
    
}





@end



















