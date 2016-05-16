//
//  SAMAlertView.h


#import <UIKit/UIKit.h>

@interface SAMAlertViewItem : NSObject

@property (nonatomic , copy , nullable) NSString *title ;
@property (nonatomic , strong , nullable) UIColor *titleColor ;

- (nullable instancetype)initWithTitle:(nullable NSString *)title titleColor:(nullable UIColor *)titleColor;

@end

@interface SAMAlertView : UIView

/**
 *  two item
 *
 *  @param aItem
 *  @param item
 *  @param message
 *  @param title
 */
+ (nullable instancetype)showLeftItem:(SAMAlertViewItem * __nonnull)leftItem
                         andRightItem:(SAMAlertViewItem * __nonnull)rightItem
                          withMessage:(NSString * __nonnull)message
                                title:(NSString * __nonnull)title;


/**
 *  show items.count > 2
 *
 *  @param items   items
 *  @param message message
 *  @param title  title
 */
+ (nullable instancetype)showWithItems:(NSArray<__kindof SAMAlertViewItem *> * __nonnull)items
                           withMessage:(NSString * __nonnull )message
                                 title:(NSString * __nonnull )title;


@property (nonatomic , copy, nullable) void(^didSelectedItem)(SAMAlertViewItem *__nonnull sender,NSInteger aButtonIndex);

@property (nonatomic , assign) BOOL touchBackgroundViewCanRemove;


@property (nonatomic , strong, nullable) UIColor *messageColor ;

@end
