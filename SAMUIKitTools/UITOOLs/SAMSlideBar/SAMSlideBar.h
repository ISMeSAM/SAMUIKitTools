//
//  SAMSlideBar.h


#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, SAMSlideBarShowDirectionType) {
    SAMSlideBarShowDirectionType_left,
    SAMSlideBarShowDirectionType_right,
};


@class SAMSlideBar;
@protocol SAMSlideBarCompontDataSource <NSObject>

@required
- (UIView *)sideBarInSlideBar:(SAMSlideBar *)slideBar;

@end

@interface SAMSlideBar : UIView

@property (nonatomic , strong) UIView *component ;

+ (instancetype)showWithTargetViewController:(id<SAMSlideBarCompontDataSource>)targetViewController;

+ (instancetype)showWithTargetViewController:(id<SAMSlideBarCompontDataSource>)targetViewController andType:(SAMSlideBarShowDirectionType)type;


@end


