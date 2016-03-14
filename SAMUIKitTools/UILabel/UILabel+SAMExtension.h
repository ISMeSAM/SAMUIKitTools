//
//  UILabel+SAMExtension.h
//  Demo
//
//  Created by samiMac on 16/3/11.
//  Copyright © 2016年 wydatas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (SAMExtension)

- (NSRange)rangeWithText:(NSString *)_text;
- (NSInteger)getAutoHeight;
- (void)setColor:(UIColor *)_color font:(UIFont*)_font;
- (void)setAttributedText:(NSString*)_text withColor:(UIColor *)_color;
- (void)setAttributedText:(NSString*)_text fontSize:(NSInteger)_fontSize;
- (void)setAttributedText:(NSString*)_text font:(UIFont*)_font;
- (void)setAttributedText:(NSString*)_text withColor:(UIColor *)_color fontSize:(NSInteger)_fontSize;
- (void)setAttributedText:(NSString*)_text withColor:(UIColor *)_color font:(UIFont*)_font;


@end






