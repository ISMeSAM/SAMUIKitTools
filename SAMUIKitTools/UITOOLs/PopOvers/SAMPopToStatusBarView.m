//
//  SAMPopToStatusBarView.m
//  Demo


#import "SAMPopToStatusBarView.h"
#import "UIView+SAMExtension.h"
#import "NSObject+SAMExtension.h"
#import "UIImage+SAMExtension.h"
#import "UIColor+SAMExtension.h"

@interface SAMPopToStatusBarView()

//@property (nonatomic , copy) NSString *message;

//@property (nonatomic , strong) UILabel *messageLabel ;
@property (nonatomic , strong) UIButton *messageButton ;

@end

@implementation SAMPopToStatusBarView



- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _messageButton = [[UIButton alloc] initWithFrame:self.bounds];
        [self addSubview:_messageButton];
        
        _messageButton.titleLabel.font = [UIFont systemFontOfSize:13.f];
    }
    return self;
}


+ (instancetype)showStatusBarViewWithMessage:(NSString *)aMessage
{
    return [self showStatusBarViewWithMessage:aMessage
                              backgroundColor:[UIColor black25PercentColor]
                                 messageColor:[UIColor whiteColor]];
}

+ (instancetype)showStatusBarViewWithMessage:(NSString *)aMessage
                             backgroundColor:(UIColor *)aColor
                                messageColor:(UIColor *)aMessageColor
{
    UIView *statusBar = [[UIApplication sharedApplication] valueForKeyPath:@"statusBar"];
    
    return [self showViewInView:statusBar
                    WithMessage:aMessage
                backgroundColor:aColor
                   messageColor:aMessageColor];
}

static double _startPostion_y = -20;

+ (instancetype)showViewInView:(UIView *)aView
                   WithMessage:(NSString *)aMessage
               backgroundColor:(UIColor *)aColor
                  messageColor:(UIColor *)aMessageColor
{
    SAMPopToStatusBarView *popView = [[SAMPopToStatusBarView alloc] initWithFrame:(CGRectMake(0, _startPostion_y, aView.width, 20.f))];
    popView.alpha = 0;
    [popView.messageButton setTitle:aMessage forState:UIControlStateNormal];
    
    popView.backgroundColor = aColor;
    
    [popView.messageButton setTitleColor:aMessageColor forState:UIControlStateNormal];
    [popView.messageButton setBackgroundImage:[UIImage image4ContextWithColor:aColor size:popView.messageButton.size] forState:UIControlStateNormal];
    [aView addSubview:popView];
    [aView bringSubviewToFront:[UIApplication sharedApplication].keyWindow];
    [UIView animateWithDuration:0.25 animations:^{
        popView.alpha = 1;
        popView.y = 0;
    } completion:^(BOOL finished) {
        if (finished) {
            [UIView animateWithDuration:0.5 delay:0.75 options:UIViewAnimationOptionCurveLinear animations:^{
                popView.y = _startPostion_y;
            } completion:^(BOOL finished) {
                if (finished) {
                    [popView removeFromSuperview];
                }
            }];
        }
    }];
    
    return popView;
}







@end







