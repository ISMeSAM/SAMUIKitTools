//
//  UIView+SAMNetActivity.h


#import <UIKit/UIKit.h>

@interface UIView (SAMNetActivity)

@property (nonatomic , readwrite , strong ) UIView *sam_activityView ;


- (void)sam_startActivity;
- (void)sam_startActivityWithStyle:(UIActivityIndicatorViewStyle)style;

- (void)sam_endActivity;


@end

