//
//  UIAlertController+SAMExtension.h
//  Demo
//
//  Created by samiMac on 16/3/12.
//  Copyright © 2016年 wydatas. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma mark -

typedef void(^UIAlertViewAction)(UIAlertView *alertView);
typedef void(^UIAlertViewCompletionAction)(UIAlertView *alertView , NSInteger clickedBtn_index);



@interface UIAlertController (SAMExtension)
@end


#pragma mark -


@interface UIAlertView (SAMExtension)


/**  done单击回调事件  */
@property (nonatomic, copy) UIAlertViewCompletionAction action;

/**  单机后将要消失事件 */
@property (nonatomic, copy) UIAlertViewCompletionAction willDismissAction;

/**  单机事件alert消失后事件  */
@property (nonatomic, copy) UIAlertViewCompletionAction didDismissAction;

/**  将要显示弹框  */
@property (nonatomic, copy) UIAlertViewAction willPresentAction;

/**  已经显示弹框  */
@property (nonatomic, copy) UIAlertViewAction didPresentAction;

/**  取消按钮点击 */
@property (nonatomic, copy) UIAlertViewAction cancelAction;

@property (nonatomic, copy) BOOL(^shouldEnableFirstOtherButtonAction)(UIAlertView *alertView);




+ (instancetype)showWithTitle:(NSString *)title
                      message:(NSString *)message
                        style:(UIAlertViewStyle)style
               cancelBtnTitle:(NSString *)cancelBtnTitle
                 doneBtnTitle:(NSString *)doneBtnTitle
                       action:(UIAlertViewCompletionAction)action;

+ (instancetype)showWithTitle:(NSString *)title
                      message:(NSString *)message
               cancelBtnTitle:(NSString *)cancelBtnTitle
                 doneBtnTitle:(NSString *)doneBtnTitle
                       action:(UIAlertViewCompletionAction)action;



@end