//
//  UIView+SAMProgressTool.m


#import "UIView+SAMProgressTool.h"
#import "UIView+SAMExtension.h"

#import <objc/runtime.h>


@interface SAMProgressView : UIView

@property (nonatomic , assign) CGFloat sam_progress;

@end


@implementation SAMProgressView

static double _width ;

- (void)setSam_progress:(CGFloat)sam_progress
{
    _sam_progress = sam_progress;

    self.width = _width * _sam_progress;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) {
        return nil;
    }
    
    _width = self.width;
 
    return self;
}


- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (!self) {
        return nil;
    }
    
    _width = self.width;
    
    return self;
}



@end




static const void *kSamProgressView = &kSamProgressView;

@implementation UIView (SAMProgressTool)



- (void)setSamProgressView:(SAMProgressView *)samProgressView
{
    objc_setAssociatedObject(self, kSamProgressView, samProgressView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (SAMProgressView *)samProgressView
{
    return objc_getAssociatedObject(self, kSamProgressView);
}


static double _progressMinHeight = 2.f;

- (void)showProgressViewWithType:(SAMProgressViewProgressType)type
{
    if ([self samProgressView]) {
        [[self samProgressView] removeFromSuperview];
        objc_setAssociatedObject(self, kSamProgressView, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }

    switch (type)
    {
        case SAMProgressViewProgressType_top:
        {
            self.samProgressView = [[SAMProgressView alloc] initWithFrame:(CGRectMake(0, 0, self.width, _progressMinHeight))];

        }
            break;
            
        case SAMProgressViewProgressType_bottom:
        {
            self.samProgressView = [[SAMProgressView alloc] initWithFrame:(CGRectMake(0, self.height - _progressMinHeight, self.width, _progressMinHeight))];

        }
            break;
            
        case SAMProgressViewProgressType_content:
        {
            self.samProgressView = [[SAMProgressView alloc] initWithFrame:self.bounds];
#pragma mark - todo..

            self.samProgressView.alpha = 0.5;
            [self addSubview:self.samProgressView];
            [self bringSubviewToFront:self.samProgressView];
            self.samProgressView.backgroundColor = [UIColor colorWithRed:0 green:122/255.0 blue:1.0 alpha:1];
            
            goto lab;
        }
            break;
            
        default:
            break;
    }
    [self addSubview:self.samProgressView];
    self.samProgressView.backgroundColor = [UIColor colorWithRed:0 green:122/255.0 blue:1.0 alpha:1];
    
lab: ;
    
}

- (void)sam_ProgressDismiss
{
    if (!self.samProgressView) {
        return;
    }
    
    __weak typeof(self) weakSelf = self;
    __strong typeof(weakSelf) strongSelf = weakSelf;
    [UIView animateWithDuration:0.25 animations:^{
        
        strongSelf.samProgressView.alpha = 0;
        
    } completion:^(BOOL finished) {
        
        if (finished) {
            [strongSelf.samProgressView removeFromSuperview];
            objc_setAssociatedObject(strongSelf, kSamProgressView, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
        
    }];
    
}


static double _samProgress;

- (void)setSam_progress:(CGFloat)sam_progress
{
    _samProgress = sam_progress;

    self.samProgressView.sam_progress = _samProgress;
    
}

- (CGFloat)sam_progress
{
    return _samProgress;
}

- (UIColor *)sam_progressColor
{
    return self.samProgressView.backgroundColor;
}

- (void)setSam_progressColor:(UIColor *)sam_progressColor
{
    self.samProgressView.backgroundColor = sam_progressColor;
}



@end
