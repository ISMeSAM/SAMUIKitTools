//
//  SAMMidViewController.m
//  Demo
//
//  Created by samiMac on 16/4/20.
//  Copyright © 2016年 wydatas. All rights reserved.
//

#import "SAMMidViewController.h"
#import "UIView+SAMGestureRecognizerAction.h"
#import "SAMPopToStatusBarView.h"
#import "UIView+SAMExtension.h"




@interface SAMMidViewController()


@end

@implementation SAMMidViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"GestureRecognizer";

    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    imageView.center = self.view.center;
    
    imageView.userInteractionEnabled = 1;
    [self.view addSubview:imageView];
    imageView.image = [UIImage imageNamed:@"Stars"];
    
    [self.view setTapAction:^(UITapGestureRecognizer *_Nonnull gestureR){
       
        if (UIGestureRecognizerStateEnded == gestureR.state) {
             [SAMPopToStatusBarView showStatusBarViewWithMessage:@"tap action"];
        }
    }];
    
    
    [self.view setLongPressAction:^(UILongPressGestureRecognizer *_Nonnull ge){
        
        if (UIGestureRecognizerStateBegan == ge.state) {
            [SAMPopToStatusBarView showStatusBarViewWithMessage:@"longPress"];
        }
        
    }];
    
    [self.view setSwipeAction:^(UISwipeGestureRecognizer *_Nonnull ge){
        
        if (UIGestureRecognizerStateBegan == ge.state) {
            [SAMPopToStatusBarView showStatusBarViewWithMessage:@"Swipe"];
        }
    }];
    
    
    [self.view setRotationAction:^(UIRotationGestureRecognizer * _Nonnull ge) {
       
        if (UIGestureRecognizerStateBegan == ge.state) {
           [SAMPopToStatusBarView showStatusBarViewWithMessage:@"rotation"];
        }
    }];
    
    
    [self.view setPinchAction:^(UIPinchGestureRecognizer * _Nonnull ge) {
       
        NSLog(@"pinch--->%lf",ge.scale);
        
        imageView.width = imageView.width * ge.scale;
        imageView.height = imageView.height * ge.scale;
    }];
    
    
    __weak typeof(self) weakSelf = self;
    [self.view setPanAction:^(UIPanGestureRecognizer * _Nonnull ge) {
        NSLog(@"%@",ge);
        
//        imageView.center = [ge velocityInView:weakSelf.view];
    }];
    

}



@end
