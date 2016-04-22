//
//  UIView+SAMGestureRecognizerAction.m


#import "UIView+SAMGestureRecognizerAction.h"
#import <objc/runtime.h>
#import "NSObject+SAMExtension.h"

static const void *kLongPressActionKey          = &kLongPressActionKey;
static const void *kSwipeActionKey              = &kSwipeActionKey;
static const void *kPinchActionKey              = &kPinchActionKey;
static const void *kTapActionKey                = &kTapActionKey;
static const void *kPanActionKey                = &kPanActionKey;
static const void *kRotationActionKey           = &kRotationActionKey;


@implementation UIView (SAMGestureRecognizerAction)



#pragma mark - setter getter


- (void)setTapAction:(void (^)(UITapGestureRecognizer * _Nonnull))tapAction
{
    objc_setAssociatedObject(self, kTapActionKey, tapAction, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleGestureRecognizer:)];
    [self addGestureRecognizer:tap];
}
- (void (^)(UITapGestureRecognizer * _Nonnull))tapAction
{
    return objc_getAssociatedObject(self, kTapActionKey);
}


- (void)setLongPressAction:(void (^)(UILongPressGestureRecognizer * _Nonnull))longPressAction
{
    objc_setAssociatedObject(self, kLongPressActionKey, longPressAction, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleGestureRecognizer:)];

    [self addGestureRecognizer:longPress];
}
- (void (^)(UILongPressGestureRecognizer * _Nonnull))longPressAction
{
    return objc_getAssociatedObject(self, kLongPressActionKey);
}


- (void)setSwipeAction:(void (^)(UISwipeGestureRecognizer * _Nonnull))swipeAction
{
    objc_setAssociatedObject(self, kSwipeActionKey, swipeAction, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleGestureRecognizer:)];
    [self addGestureRecognizer:swipe];
}
- (void (^)(UISwipeGestureRecognizer * _Nonnull))swipeAction
{
    return objc_getAssociatedObject(self, kSwipeActionKey);
}


- (void)setPinchAction:(void (^)(UIPinchGestureRecognizer * _Nonnull))pinchAction
{
    objc_setAssociatedObject(self, kPinchActionKey, pinchAction, OBJC_ASSOCIATION_COPY_NONATOMIC);
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handleGestureRecognizer:)];
    [self addGestureRecognizer:pinch];
}
- (void (^)(UIPinchGestureRecognizer * _Nonnull))pinchAction
{
    return objc_getAssociatedObject(self, kPinchActionKey);
}


- (void)setPanAction:(void (^)(UIPanGestureRecognizer * _Nonnull))panAction
{
    objc_setAssociatedObject(self, kPanActionKey, panAction, OBJC_ASSOCIATION_COPY_NONATOMIC);
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleGestureRecognizer:)];
    [self addGestureRecognizer:pan];
}
- (void (^)(UIPanGestureRecognizer * _Nonnull))panAction
{
    return objc_getAssociatedObject(self, kPanActionKey);
}


- (void)setRotationAction:(void (^)(UIRotationGestureRecognizer * _Nonnull))rotationAction
{
    objc_setAssociatedObject(self, kRotationActionKey, rotationAction, OBJC_ASSOCIATION_COPY_NONATOMIC);
    UIRotationGestureRecognizer *rotation = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(handleGestureRecognizer:)];
    [self addGestureRecognizer:rotation];
}
- (void (^)(UIRotationGestureRecognizer * _Nonnull))rotationAction
{
    return objc_getAssociatedObject(self, kRotationActionKey);
}


#pragma mark -

- (void)handleGestureRecognizer:(UIGestureRecognizer *)gestureRecognizer
{
    if ([gestureRecognizer isKindOfClass:[UITapGestureRecognizer class]]) {
        
        if (self.tapAction) {
            self.tapAction((UITapGestureRecognizer *)gestureRecognizer);
        }
        
    }
    
    if ([gestureRecognizer isKindOfClass:[UILongPressGestureRecognizer class]]) {
        
        if (self.longPressAction) {
            self.longPressAction((UILongPressGestureRecognizer *)gestureRecognizer);
        }
        
    }
    
    if ([gestureRecognizer isKindOfClass:[UISwipeGestureRecognizer class]]) {
        
        if (self.swipeAction) {
            self.swipeAction((UISwipeGestureRecognizer *)gestureRecognizer);
        }
        
    }
    
    if ([gestureRecognizer isKindOfClass:[UIPinchGestureRecognizer class]]) {
        
        if (self.pinchAction) {
            self.pinchAction((UIPinchGestureRecognizer *)gestureRecognizer);
        }
        
    }
    
    if ([gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]]) {
        
        if (self.panAction) {
            self.panAction((UIPanGestureRecognizer *)gestureRecognizer);
        }
        
    }
    
    
    if ([gestureRecognizer isKindOfClass:[UIRotationGestureRecognizer class]]) {
        
        if (self.rotationAction) {
            self.rotationAction((UIRotationGestureRecognizer *)gestureRecognizer);
        }

    }
    
  
}







@end








