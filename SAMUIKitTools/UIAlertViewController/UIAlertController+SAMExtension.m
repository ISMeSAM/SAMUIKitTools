//
//  UIAlertController+SAMExtension.m
//  Demo
//
//  Created by samiMac on 16/3/12.
//  Copyright © 2016年 wydatas. All rights reserved.
//

#import "UIAlertController+SAMExtension.h"
#import <objc/runtime.h>


@implementation UIAlertController (SAMExtension)
@end

static const void *UIAlertViewCompletionActionKey               = &UIAlertViewCompletionActionKey;
static const void *UIAlertViewWillDismissActionKey              = &UIAlertViewWillDismissActionKey;
static const void *UIAlertViewDidDismissActionKey               = &UIAlertViewDidDismissActionKey;
static const void *UIAlertViewWillPresentActionKey              = &UIAlertViewWillPresentActionKey;
static const void *UIAlertViewDidPresentActionKey               = &UIAlertViewDidPresentActionKey;
static const void *UIAlertViewCancelActionKey                   = &UIAlertViewCancelActionKey;
static const void *UIAlertViewShouldEnableFirstOtherButtonKey   = &UIAlertViewShouldEnableFirstOtherButtonKey;
static const void *UIAlertViewOriginalDelegateKey               = &UIAlertViewOriginalDelegateKey;


@implementation UIAlertView (SAMExtension)


+ (instancetype)showWithTitle:(NSString *)title
                      message:(NSString *)message
                        style:(UIAlertViewStyle)style
               cancelBtnTitle:(NSString *)cancelBtnTitle
                 doneBtnTitle:(NSString *)doneBtnTitle
                       action:(UIAlertViewCompletionAction)action
{
    // init alertView
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                        message:message
                                                       delegate:nil
                                              cancelButtonTitle:cancelBtnTitle
                                              otherButtonTitles:doneBtnTitle, nil];
    
    alertView.alertViewStyle = style;
    
    
    // 给block赋值
    if (action) {
        alertView.action = action;
    }
    
    if (cancelBtnTitle || doneBtnTitle) {
        // show
        [alertView show];
        
    }else{
        
        NSAssert(NO, @"没有设置alertView的dismiss按钮,该alertView将永久显示在您的window中");
        return nil;
    }
    
#if !__has_feature(objc_arc)
    return [alertView autorelease];
#endif
    return alertView;
}


+ (instancetype)showWithTitle:(NSString *)title
                      message:(NSString *)message
               cancelBtnTitle:(NSString *)cancelBtnTitle
                 doneBtnTitle:(NSString *)doneBtnTitle
                       action:(UIAlertViewCompletionAction)action
{
    return [self showWithTitle:title
                       message:message
                         style:UIAlertViewStyleDefault
                cancelBtnTitle:cancelBtnTitle
                  doneBtnTitle:doneBtnTitle
                        action:action];
}

#pragma mark - 关联属性

// 主'引擎'
- (void)alertViewCheckDelegateMethod
{
    // 过滤系统(UIAlertViewDelegate)的代理
    if (self.delegate != (id<UIAlertViewDelegate>)self) {
        // 取出过滤后的属性
        objc_setAssociatedObject(self, UIAlertViewOriginalDelegateKey, self.delegate, OBJC_ASSOCIATION_ASSIGN);
        // delegate
        self.delegate = (id<UIAlertViewDelegate>)self;
        
    }
    
}

// 事件
- (UIAlertViewCompletionAction)action
{
    [self alertViewCheckDelegateMethod];
    return objc_getAssociatedObject(self, UIAlertViewCompletionActionKey);
}

- (void)setAction:(UIAlertViewCompletionAction)action
{
    [self alertViewCheckDelegateMethod];
    objc_setAssociatedObject(self, UIAlertViewCompletionActionKey, action, OBJC_ASSOCIATION_COPY);
}

//-- 将要消失
- (UIAlertViewCompletionAction)willDismissAction
{
    return objc_getAssociatedObject(self, UIAlertViewWillDismissActionKey);
}

- (void)setWillDismissAction:(UIAlertViewCompletionAction)willDismissAction
{
    [self alertViewCheckDelegateMethod];
    objc_setAssociatedObject(self, UIAlertViewWillDismissActionKey, willDismissAction, OBJC_ASSOCIATION_COPY);
}

//-- 已经消失

- (UIAlertViewCompletionAction)didDismissAction
{
    return objc_getAssociatedObject(self, UIAlertViewDidDismissActionKey);
}

- (void)setDidDismissAction:(UIAlertViewCompletionAction)didDismissAction
{
    [self alertViewCheckDelegateMethod];
    objc_setAssociatedObject(self, UIAlertViewDidDismissActionKey, didDismissAction, OBJC_ASSOCIATION_COPY);
}

//-- 将要显示
- (UIAlertViewAction)willPresentAction
{
    return objc_getAssociatedObject(self, UIAlertViewWillPresentActionKey);
}

- (void)setWillPresentAction:(UIAlertViewAction)willPresentAction
{
    [self alertViewCheckDelegateMethod];
    objc_setAssociatedObject(self, UIAlertViewWillPresentActionKey, willPresentAction, OBJC_ASSOCIATION_COPY);
}

//-- 已经显示
- (UIAlertViewAction)didPresentAction
{
    return objc_getAssociatedObject(self, UIAlertViewDidPresentActionKey);
}

- (void)setDidPresentAction:(UIAlertViewAction)didPresentAction
{
    [self alertViewCheckDelegateMethod];
    objc_setAssociatedObject(self, UIAlertViewDidPresentActionKey, didPresentAction, OBJC_ASSOCIATION_COPY);
}

//-- 取消
- (UIAlertViewAction)cancelAction
{
    return objc_getAssociatedObject(self, UIAlertViewCancelActionKey);
}

- (void)setCancelAction:(UIAlertViewAction)cancelAction
{
    [self alertViewCheckDelegateMethod];
    objc_setAssociatedObject(self, UIAlertViewCancelActionKey, cancelAction, OBJC_ASSOCIATION_COPY);
}


- (BOOL (^)(UIAlertView *))shouldEnableFirstOtherButtonAction
{
    return objc_getAssociatedObject(self, UIAlertViewShouldEnableFirstOtherButtonKey);
}

- (void)setShouldEnableFirstOtherButtonAction:(BOOL (^)(UIAlertView *))shouldEnableFirstOtherButtonAction
{
    [self alertViewCheckDelegateMethod];
    objc_setAssociatedObject(self, UIAlertViewShouldEnableFirstOtherButtonKey, shouldEnableFirstOtherButtonAction, OBJC_ASSOCIATION_COPY);
}



#pragma mark - " UIAlertViewDelegate " Method


//------------------ rewrite sys method

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    UIAlertViewCompletionAction completionAction = alertView.action;
    
    if (completionAction) {
        completionAction(alertView,buttonIndex);
    }
    
    id originalDelegate = objc_getAssociatedObject(self, UIAlertViewOriginalDelegateKey);
    
    if (originalDelegate && [originalDelegate respondsToSelector:@selector(alertView:clickedButtonAtIndex:)]) {
        [originalDelegate alertView:alertView clickedButtonAtIndex:buttonIndex];
    }
    
    
}


- (void)alertViewCancel:(UIAlertView *)alertView
{
    UIAlertViewAction cancelAction = alertView.cancelAction;
    
    if (cancelAction) {
        cancelAction(alertView);
    }
    
    id originalDelegate = objc_getAssociatedObject(self, UIAlertViewOriginalDelegateKey);
    
    if (originalDelegate && [originalDelegate respondsToSelector:@selector(alertViewCancel:)]) {
        [originalDelegate alertViewCancel:alertView];
    }
    
}


- (void)willPresentAlertView:(UIAlertView *)alertView
{
    UIAlertViewAction action = alertView.willPresentAction;
    
    if (action) {
        action(alertView);
    }
    
    // 取出原来的代理
    id originalDelegate = objc_getAssociatedObject(self, UIAlertViewOriginalDelegateKey);
    
    if (originalDelegate && [originalDelegate respondsToSelector:@selector(willPresentAlertView:)]) {
        [originalDelegate willPresentAlertView:alertView];
    }
    
}

- (void)didPresentAlertView:(UIAlertView *)alertView
{
    UIAlertViewAction didPresentAction = alertView.didPresentAction;
    
    if (didPresentAction) {
        didPresentAction(alertView);
    }
    
    id originalDelegate = objc_getAssociatedObject(self, UIAlertViewOriginalDelegateKey);
    
    if (originalDelegate && [originalDelegate respondsToSelector:@selector(didPresentAlertView:)]) {
        [originalDelegate didPresentAlertView:alertView];
    }
    
}


- (void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex
{
    UIAlertViewCompletionAction willDismissAction = alertView.willDismissAction;
    
    if (willDismissAction) {
        willDismissAction(alertView,buttonIndex);
    }
    
    id originalDelegate = objc_getAssociatedObject(self, UIAlertViewOriginalDelegateKey);
    
    if (originalDelegate && [originalDelegate respondsToSelector:@selector(alertView:willDismissWithButtonIndex:)]) {
        [originalDelegate alertView:alertView willDismissWithButtonIndex:buttonIndex];
    }
    
    
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    UIAlertViewCompletionAction didDismissAction = alertView.didDismissAction;
    
    if (didDismissAction) {
        didDismissAction(alertView,buttonIndex);
    }
    
    id originalDelegate = objc_getAssociatedObject(self, UIAlertViewOriginalDelegateKey);
    
    if (originalDelegate && [originalDelegate respondsToSelector:@selector(alertView:didDismissWithButtonIndex:)]) {
        [originalDelegate alertView:alertView didDismissWithButtonIndex:buttonIndex];
    }
    
}



- (BOOL)alertViewShouldEnableFirstOtherButton:(UIAlertView *)alertView
{
    BOOL(^shouldEnableFirstOtherButtonAction)(UIAlertView *alertView) = alertView.shouldEnableFirstOtherButtonAction;
    
    if (shouldEnableFirstOtherButtonAction) {
        shouldEnableFirstOtherButtonAction(alertView);
    }
    
    id originalDelegate = objc_getAssociatedObject(self, UIAlertViewOriginalDelegateKey);
    
    if (originalDelegate && [originalDelegate respondsToSelector:@selector(alertViewShouldEnableFirstOtherButton:)]) {
        return [originalDelegate alertViewShouldEnableFirstOtherButton:alertView];
    }
    
    return YES;
}





@end


