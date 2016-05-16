//
//  SAMSlideBar.h


#import <UIKit/UIKit.h>

@class SAMSlideBar;

typedef void(^SAMSlideBarAction)(SAMSlideBar *aSlideBar,UIButton *contentView,UIView *componentView);

typedef NS_ENUM(NSUInteger, SAMSlideBarShowDirectionType) {
    SAMSlideBarShowDirectionType_left,
    SAMSlideBarShowDirectionType_right,
};


@protocol SAMSlideBarCompontDataSource <NSObject>

@required
- (UIView *)sideBarInSlideBarContentView:(UIButton *)contentView;

@end

@interface SAMSlideBar : UIView

@property (nonatomic , copy) void(^viewWillShow)(SAMSlideBar *aSlideBar,UIButton *contentView,UIView *componentView);
//@property (nonatomic , copy) SAMSlideBarAction viewWillShow ;

@property (nonatomic , copy) void(^viewDidShow)(SAMSlideBar *aSlideBar,UIButton *contentView,UIView *componentView);
//@property (nonatomic , copy) SAMSlideBarAction viewDidShow ;

@property (nonatomic , copy) void(^viewWillDismiss)(SAMSlideBar *aSlideBar,UIButton *contentView,UIView *componentView);
//@property (nonatomic , copy) SAMSlideBarAction viewWillDismiss ;

@property (nonatomic , copy) void(^viewDidDismiss)(SAMSlideBar *aSlideBar,UIButton *contentView,UIView *componentView);
//@property (nonatomic , copy) SAMSlideBarAction viewDidDismiss ;


+ (instancetype)showWithTargetViewController:(id<SAMSlideBarCompontDataSource>)targetViewController;

+ (instancetype)showWithTargetViewController:(id<SAMSlideBarCompontDataSource>)targetViewController
                                     andType:(SAMSlideBarShowDirectionType)type;


@end

