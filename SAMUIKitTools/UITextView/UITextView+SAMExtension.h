//
//  UITextView+SAMExtension.h
//  Demo
//
//  Created by samiMac on 16/3/12.
//  Copyright © 2016年 wydatas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (SAMExtension)
@property (nonatomic, readonly) UILabel *placeholderLabel;

@property (nonatomic, strong) NSString *placeholder;
@property (nonatomic, strong) NSAttributedString *attributedPlaceholder;
@property (nonatomic, strong) UIColor *placeholderColor;

+ (UIColor *)defaultPlaceholderColor;

@end
