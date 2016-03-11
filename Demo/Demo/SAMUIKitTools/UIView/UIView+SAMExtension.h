//
//  UIView+SAMExtension.h
//  Demo
//
//  Created by samiMac on 16/3/9.
//  Copyright © 2016年 wydatas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (SAMExtension)

@property (nonatomic , assign) CGFloat x;
@property (nonatomic , assign) CGFloat y;
@property (nonatomic , assign) CGFloat width;
@property (nonatomic , assign) CGFloat height;
@property (nonatomic , assign) CGFloat center_x;
@property (nonatomic , assign) CGFloat center_y;
@property (nonatomic , assign) CGSize size;

/**
 *  一个View 改变边角的样式 layer 的 cornerRadius
 */
@property (nonatomic, assign) IBInspectable  CGFloat cornerRadius;

/**
 *  一个View 改变边角的颜色
 */
@property (nonatomic, strong) IBInspectable UIColor *borderColor;

/**
 *  一个View 边框的宽度
 */
@property (nonatomic, assign) IBInspectable CGFloat borderWidth;


#pragma mark - getViewWithTag

- (UIButton *)getButtonWithTag:(NSInteger)viewTag;
- (UIImageView *)getImageViewWithTag:(NSInteger)viewTag;
- (UILabel *)getLabelWithTag:(NSInteger)viewTag;
- (UITextField *)getTextFieldWithTag:(NSInteger)viewTag;



#pragma mark - effects

/** 跑马灯 */
- (void)beginRespirationLamp;
- (void)endRespirationLamp;


- (void)radianWithTransform:(NSInteger)Rotate withAnimation:(BOOL)animated;


@end


