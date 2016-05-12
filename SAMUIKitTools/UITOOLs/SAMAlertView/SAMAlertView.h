//
//  SAMAlertView.h


#import <UIKit/UIKit.h>

@interface SAMAlertView : UIView

/**
 *  two item
 *
 *  @param aItem
 *  @param item
 *  @param message
 *  @param title
 */
+ (instancetype)showLeftItem:(NSString *)leftItem
                andRightItem:(NSString *)rightItem
                 withMessage:(NSString *)message
                       title:(NSString *)title;


/**
 *  show items.count > 2
 *
 *  @param items   items
 *  @param message message
 *  @param title  title
 */
+ (instancetype)showWithItems:(NSArray<__kindof NSString *> *)items
                  withMessage:(NSString *)message
                        title:(NSString *)title;


@property (nonatomic , copy) void(^didSelectedItem)(UIButton *sender,NSInteger aButtonIndex);

@property (nonatomic , assign) BOOL touchBackgroundViewCanRemove;


@end
