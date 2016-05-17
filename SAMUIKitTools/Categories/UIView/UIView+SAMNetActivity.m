//
//  UIView+SAMNetActivity.m

#import "UIView+SAMNetActivity.h"
#import <objc/runtime.h>

static const void *kSam_activityView            = &kSam_activityView;
static const void *kSam_activityLoadErrorView   = &kSam_activityLoadErrorView;


@implementation UIView (SAMNetActivity)

- (void)sam_startActivity
{
    return [self sam_startActivityWithStyle:(UIActivityIndicatorViewStyleGray)];
}

static UIActivityIndicatorView *_activityIndicatorView ;

- (void)sam_startActivityWithStyle:(UIActivityIndicatorViewStyle)style
{
    
    if (_errorView) {
        [self dismissErrorView];
        objc_setAssociatedObject(self, kSam_activityView, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    __weak typeof(self) weakSelf = self;
    __strong typeof(weakSelf) strongSelf = weakSelf;
    
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        
        _activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:style];
        
        UIView *bgView = [strongSelf samView];
        
        [bgView addSubview:_activityIndicatorView];
        
        _activityIndicatorView.center = bgView.center;
        
        [strongSelf addSubview:bgView];
        [strongSelf bringSubviewToFront:bgView];
        
        [_activityIndicatorView startAnimating];
        
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:1];
        
    }];
    
}


- (void)sam_endActivity
{
    [self sam_endActivityWithError:nil];
}

- (void)sam_endActivityWithError:(void (^)(UIView *))error
{
     UIView *samView = [self samView];
   
    if (_activityIndicatorView) {
        [_activityIndicatorView stopAnimating];
        [_activityIndicatorView removeFromSuperview];
    }
    
    if (samView) {
        [samView removeFromSuperview];
    }
    
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:0];
    
    if (error) {
        
        UIView *errorView = [self sam_activityLoadErrorView];
        
        if (!errorView) {
            errorView = [self errorView];
            [self addSubview:errorView];
        }
        error(samView);
    }
    
}


- (void)dismissErrorView
{
    if (_errorView) {
        [_errorView removeFromSuperview];
        _errorView = nil;
    }
}

static UIView *_errorView ;

- (UIView *)errorView
{
    if (!_errorView) {
        _errorView = [[UIView alloc] initWithFrame:self.bounds];
        _errorView.backgroundColor = [UIColor whiteColor];
        UILabel *lable = [[UILabel alloc] init];
        lable.text = @"Sorry 出错了!";
        lable.textColor = [UIColor redColor];
        
        [_errorView addSubview:lable];
        lable.center = _errorView.center;
        
    }
    return _errorView;
}


static UIView *_samView;
- (UIView *)samView
{
    UIView *view = [self sam_activityView];
    if (view) {
        return view;
    }
    
    if (!_samView) {
        _samView = [[UIView alloc] initWithFrame:self.bounds];
        _samView.backgroundColor = [UIColor whiteColor];
    }
    return _samView;
}





#pragma mark -


- (void)setSam_activityView:(UIView *)sam_activityView
{
    objc_setAssociatedObject(self, kSam_activityView, sam_activityView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (UIView *)sam_activityView
{
    return objc_getAssociatedObject(self, kSam_activityView);
}


- (UIView *)sam_activityLoadErrorView
{
    return objc_getAssociatedObject(self, kSam_activityLoadErrorView);
}

- (void)setSam_activityLoadErrorView:(UIView *)sam_activityLoadErrorView
{
    objc_setAssociatedObject(self, kSam_activityLoadErrorView, sam_activityLoadErrorView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}



@end

