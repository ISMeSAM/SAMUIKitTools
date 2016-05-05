//
//  UIScrollView+SAMExtension.m


#import "UIScrollView+SAMExtension.h"

@implementation UIScrollView (SAMExtension)


- (void)sam_scrollToTop
{
    [self sam_scrollToTopAnimated:1];
}


- (void)sam_scrollToTopAnimated:(BOOL)animated
{
    [self setContentOffset:CGPointMake(0.0f, 0.0f) animated:animated];
}

- (void)sam_scrollToBottom
{
    [self sam_scrollToBottomAnimated:1];
}

- (void)sam_scrollToBottomAnimated:(BOOL)animated
{
    CGPoint bottomOffset = CGPointMake(0.0f, self.contentSize.height - self.bounds.size.height);
    [self setContentOffset:bottomOffset animated:animated];
}





@end
