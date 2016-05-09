//
//  UIControl+SAMAddAction.h

#import <UIKit/UIKit.h>


typedef void(^action)(UIControl *sender);

@interface UIControl (SAMAddAction)


- (void)addActionForEvents:(UIControlEvents)events aAction:(action)aAction;


@end

