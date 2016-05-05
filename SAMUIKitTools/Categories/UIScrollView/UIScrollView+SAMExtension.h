//
//  UIScrollView+SAMExtension.h

#import <UIKit/UIKit.h>

@interface UIScrollView (SAMExtension)

- (void)sam_scrollToTop;
- (void)sam_scrollToTopAnimated:(BOOL)animated;

- (void)sam_scrollToBottom;
- (void)sam_scrollToBottomAnimated:(BOOL)animated;
@end
