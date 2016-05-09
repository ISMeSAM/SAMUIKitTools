//
//  UIView+SAMGestureRecognizerAction.h


#import <UIKit/UIKit.h>

typedef void(^SAMGestureRecognizer)(UIGestureRecognizer *_Nonnull aGestureRecognizer);

@interface UIView (SAMGestureRecognizerAction)



@property (nullable , nonatomic , copy) void(^tapAction)(UITapGestureRecognizer *_Nonnull tapGestureRecognizer);

@property (nullable , nonatomic , copy) void(^longPressAction)(UILongPressGestureRecognizer *_Nonnull lonePressGestureRecognizer);

/**  Right  Left */
@property (nullable , nonatomic , copy) void(^swipeAction)(UISwipeGestureRecognizer *_Nonnull swipeGestureRecognizer);

@property (nullable , nonatomic , copy) void(^pinchAction)(UIPinchGestureRecognizer *_Nonnull pinchGestureRecognizer);

@property (nullable , nonatomic , copy) void(^panAction)(UIPanGestureRecognizer *_Nonnull panGestureRecognizer);

@property (nullable , nonatomic , copy) void(^rotationAction)(UIRotationGestureRecognizer *_Nonnull rotationGestureRecognizer);



@end









