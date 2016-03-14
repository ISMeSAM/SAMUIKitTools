//
//  UITabBarItem+SAMExtension.m

#import "UITabBarItem+SAMExtension.h"
#import <objc/runtime.h>
#import "NSObject+SAMExtension.h"


static const void *kBadgeValueBackgroundImage = &kBadgeValueBackgroundImage;

@implementation UITabBarItem (SAMExtension)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        [self swizzleInstanceSelecterWithOriginalSEL:@selector(setBadgeValue:) mySEL:@selector(my_setBadgeValue:)];
    });
}


- (void)my_setBadgeValue:(NSString *)badgeValue
{
    [self my_setBadgeValue:badgeValue];
    
    if (!badgeValue) {
        return;
    }
    
    if (!self.badgeValueBackgroundImage) {
        return;
    }
    
    // get tabbarcontroller
    UITabBarController *tabBarController = [self valueForKeyPath:@"_target"];
    
    for (UIView *tabBarChild in tabBarController.tabBar.subviews) {
        
        if ([tabBarChild isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            
            for (UIView *tabBarButtonChild in tabBarChild.subviews) {
                
                if ([tabBarButtonChild isKindOfClass:NSClassFromString(@"_UIBadgeView")]) {
                    
                    for (UIView *badgeViewChild in tabBarButtonChild.subviews) {
                        
                        
                        if ([badgeViewChild isKindOfClass:NSClassFromString(@"_UIBadgeBackground")]) {
                            
                            unsigned int count;
                            
                            Ivar *ivars = class_copyIvarList([badgeViewChild class], &count);
                            
                            for (int i = 0 ; i < count; i++) {
                                Ivar ivar = ivars[i];
                                NSString *ivarName = [NSString stringWithCString:ivar_getName(ivar)
                                                                        encoding:NSUTF8StringEncoding];
                                
                                if ([ivarName isEqualToString:@"_image"]) {
                                    
                                    UIImage *image = [UIImage imageNamed:self.badgeValueBackgroundImage];
                                    [badgeViewChild setValue:image forKey:ivarName];
                                }
                                
                            }
                            // free
                            free(ivars);
                            
                        }
                        
                        
                    }
                    
                }
                
            }
            
        }
        
        
    }
    
    
}

- (void)setBadgeValueBackgroundImage:(NSString *)badgeValueBackgroundImage
{
    objc_setAssociatedObject(self, kBadgeValueBackgroundImage, badgeValueBackgroundImage, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)badgeValueBackgroundImage
{
    return objc_getAssociatedObject(self, kBadgeValueBackgroundImage);
}

@end
