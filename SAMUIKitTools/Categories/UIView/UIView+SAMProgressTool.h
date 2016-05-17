//
//  UIView+SAMProgressTool.h
//  Demo


#import <UIKit/UIKit.h>

@class SAMProgressView;

typedef NS_ENUM(NSUInteger, SAMProgressViewProgressType)
{
    SAMProgressViewProgressType_top,
    SAMProgressViewProgressType_bottom,
    SAMProgressViewProgressType_content,
};


@interface UIView (SAMProgressTool)

/** 0.0 -- 1.0 */
@property (nonatomic , assign) CGFloat sam_progress;

@property (nonatomic , strong) UIColor *sam_progressColor ;

/**
 *  show
 *
 *  @param type position type
 */
- (void)sam_showProgressViewWithType:(SAMProgressViewProgressType)type;

/**
 *  dismiss
 */
- (void)sam_ProgressDismiss;



@end



