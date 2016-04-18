//
//  UIViewController+SAMExtension.m


#import "UIViewController+SAMExtension.h"
#import "NSObject+SAMExtension.h"

#define AppDelegateEntity ((AppDelegate *)[UIApplication sharedApplication].delegate)
@implementation UIViewController (SAMExtension)


+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        [self swizzleInstanceSelecterWithOriginalSEL:@selector(viewWillAppear:)
                                               mySEL:@selector(my_viewWillAppear:)];
        
        [self swizzleInstanceSelecterWithOriginalSEL:@selector(viewWillDisappear:)
                                               mySEL:@selector(my_viewWillDisappear:)];
    });
}

- (void)my_viewWillAppear:(BOOL)animated
{
    [self my_viewWillAppear:animated];
    
    // todo
    
}

- (void)my_viewWillDisappear:(BOOL)animated
{
    [self my_viewWillDisappear:animated];
    
    // todo
    
}


@end
