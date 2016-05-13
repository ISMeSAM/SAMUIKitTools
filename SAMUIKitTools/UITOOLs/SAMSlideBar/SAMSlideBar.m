//
//  SAMSlideBar.m

#import "SAMSlideBar.h"
#import "UIView+SAMExtension.h"
#import "NSObject+SAMExtension.h"

#import <objc/runtime.h>

@interface SAMSlideBar ()

@property (nonatomic , strong) UIButton *contentView ;


@property (nonatomic , strong) UIView *componentView ;

@property (nonatomic , assign) SAMSlideBarShowDirectionType type;
@end

@implementation SAMSlideBar


static double _gap = 64.f;
static double _duration = 0.25;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) {
        return nil;
    }

    self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];

    CGFloat width = self.width ;
    CGFloat height = self.height ;
    
    // init
    _contentView = [[UIButton alloc] init];
    _contentView.backgroundColor = [UIColor whiteColor];
    _contentView.size = CGSizeMake(width - _gap, height);
    
    _contentView.y = 0;
    
    [self addSubview:_contentView];
    
    return self;
}


+ (instancetype)showWithTargetViewController:(id<SAMSlideBarCompontDataSource>)targetViewController
{
    return [self showWithTargetViewController:targetViewController andType:SAMSlideBarShowDirectionType_left];
}


+ (instancetype)showWithTargetViewController:(id<SAMSlideBarCompontDataSource>)targetViewController andType:(SAMSlideBarShowDirectionType)type
{
    if (!targetViewController) {
        return nil;
    }
    
    if (![targetViewController respondsToSelector:@selector(sideBarInSlideBar:)]) {
        return nil;
    }
    
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    SAMSlideBar *slideBar = [[SAMSlideBar alloc] initWithFrame:window.bounds];
    slideBar.type = type;
    
    if (SAMSlideBarShowDirectionType_right == type) {
         slideBar.contentView.x = window.width;
    }
    
    if (SAMSlideBarShowDirectionType_left == type) {
        slideBar.contentView.x = - (slideBar.width - _gap);
    }
   
    slideBar.alpha = 0;
    
    slideBar.componentView = [targetViewController sideBarInSlideBar:slideBar];
    
    [window addSubview:slideBar];
    
    [UIView animateWithDuration:_duration animations:^{
        slideBar.alpha = 1;
    } completion:^(BOOL finished) {
        if (finished) {
            [UIView animateWithDuration:_duration animations:^{
                
                if (SAMSlideBarShowDirectionType_right == type) {
                    slideBar.contentView.x = _gap;
                }
                
                if (SAMSlideBarShowDirectionType_left == type) {
                    slideBar.contentView.x = 0;
                }
            }];
        }
    }];
    
    
    return slideBar;
}


- (void)setComponentView:(UIView *)componentView
{
    _componentView = componentView;
    
    _componentView.frame = self.contentView.bounds;
    
    [self.contentView addSubview:_componentView];
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self dismiss];
}


- (void)dismiss
{
    __weak typeof(self) weakSelf = self;
    __strong typeof(weakSelf) strongSelf = weakSelf;
    
    [UIView animateWithDuration:_duration animations:^{
        
        if (SAMSlideBarShowDirectionType_right == self.type) {
            strongSelf.contentView.x = strongSelf.width;
        }
        
        if (SAMSlideBarShowDirectionType_left == self.type) {
            strongSelf.contentView.x = - (strongSelf.width - _gap);
        }
        
    } completion:^(BOOL finished) {
        if (finished) {
            [UIView animateWithDuration:_duration animations:^{
                strongSelf.alpha = 0;
            } completion:^(BOOL finished) {
                if (finished) {
                    [strongSelf removeFromSuperview];
                }
            }];
        }
    }];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
