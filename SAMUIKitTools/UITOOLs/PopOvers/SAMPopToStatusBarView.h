//
//  SAMPopToStatusBarView.h
//  Demo

#import <UIKit/UIKit.h>

@interface SAMPopToStatusBarView : UIView


+ (instancetype)showStatusBarViewWithMessage:(NSString *)aMessage;


+ (instancetype)showStatusBarViewWithMessage:(NSString *)aMessage
                             backgroundColor:(UIColor *)aColor
                                messageColor:(UIColor *)aMessageColor;


+ (instancetype)showViewInView:(UIView *)aView
                   WithMessage:(NSString *)aMessage
               backgroundColor:(UIColor *)aColor
                  messageColor:(UIColor *)aMessageColor;



@end
