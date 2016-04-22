//
//  UIView+SAMGestureRecognizerAction.h


#import <UIKit/UIKit.h>

typedef void(^SAMGestureRecognizer)(UIGestureRecognizer *_Nonnull aGestureRecognizer);

@interface UIView (SAMGestureRecognizerAction)



@property (nullable , nonatomic , copy) void(^tapAction)(UITapGestureRecognizer *_Nonnull tapGestureRecognizer);

@property (nullable , nonatomic , copy) void(^longPressAction)(UILongPressGestureRecognizer *_Nonnull lonePressGestureRecognizer);

@property (nullable , nonatomic , copy) void(^swipeAction)(UISwipeGestureRecognizer *_Nonnull swipeGestureRecognizer);

@property (nullable , nonatomic , copy) void(^pinchAction)(UIPinchGestureRecognizer *_Nonnull pinchGestureRecognizer);

@property (nullable , nonatomic , copy) void(^panAction)(UIPanGestureRecognizer *_Nonnull panGestureRecognizer);

@property (nullable , nonatomic , copy) void(^rotationAction)(UIRotationGestureRecognizer *_Nonnull rotationGestureRecognizer);



@end







/**
 *  手势类型
 */
typedef NS_ENUM(NSUInteger, SAMGestureRecognizerActionType) {
    /**
     *  任意次数拍击
     */
    SAMGestureRecognizerActionType_tap,
    /**
     *  长按
     */
    SAMGestureRecognizerActionType_longPress,
    /**
     *  轻扫
     */
    SAMGestureRecognizerActionType_swipe,
    /**
     *  拖动
     */
    SAMGestureRecognizerActionType_pan,
    /**
     *  缩放
     */
    SAMGestureRecognizerActionType_pinch,
    /**
     *  旋转
     */
    SAMGestureRecognizerActionType_rotation
};






