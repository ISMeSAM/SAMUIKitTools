//
//  SAMMidViewController.m

#import "SAMMidViewController.h"
#import "UIView+SAMGestureRecognizerAction.h"
#import "SAMPopToStatusBarView.h"
#import "UIView+SAMExtension.h"

#import "UIControl+SAMAddAction.h"


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
       
        [SAMPopToStatusBarView showStatusBarViewWithMessage:@"Swipe"];
       
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
//    [self.view setPanAction:^(UIPanGestureRecognizer * _Nonnull ge) {
//        NSLog(@"%@",ge);
//        
////        imageView.center = [ge velocityInView:weakSelf.view];
//    }];
//
    
    
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeContactAdd];
//    
//    [imageView addSubview:button];
//    
//    button.center = imageView.center;
//    [button addActionForEvents:(UIControlEventTouchDown) aAction:^(UIControl *sender) {
//       
//        NSLog(@"-----UIControlEventTouchDown");
//    }];
//    [button addActionForEvents:(UIControlEventTouchUpInside) aAction:^(UIControl *sender) {
//        
//        NSLog(@"-----UIControlEventTouchUpInside");
//    }];
    
    
    UITextField *tx = [[UITextField alloc] initWithFrame:(CGRectMake(100, 100, 130, 50))];
    tx.backgroundColor = [UIColor redColor];
    [imageView addSubview:tx];
    
    [tx addActionForEvents:UIControlEventEditingChanged aAction:^(UIControl *sender) {
        NSLog(@"UIControlEventEditingChanged");
    }];
    
    [tx addActionForEvents:UIControlEventEditingDidBegin aAction:^(UIControl *sender) {
        NSLog(@"UIControlEventEditingDidBegin");
    }];
    [tx addActionForEvents:UIControlEventEditingDidEnd aAction:^(UIControl *sender) {
        NSLog(@"UIControlEventEditingDidEnd");
    }];
    [tx addActionForEvents:UIControlEventEditingDidEndOnExit aAction:^(UIControl *sender) {
        NSLog(@"UIControlEventEditingDidEndOnExit");
    }];
    
    
    UIButton *button = [[UIButton alloc] initWithFrame:(CGRectMake(100, 200, 200, 55))];
    [button setBackgroundColor:[UIColor redColor]];
    [button setTitle:@"touch me" forState:UIControlStateNormal];
    [self.view addSubview:button];
    
    [button addActionForEvents:UIControlEventTouchUpInside aAction:^(UIControl *sender) {
        NSLog(@"UIControlEventTouchUpInside");
    }];
    
    [button addActionForEvents:UIControlEventTouchUpOutside aAction:^(UIControl *sender) {
        NSLog(@"UIControlEventTouchUpOutside");
    }];
//
    [button addActionForEvents:UIControlEventTouchCancel aAction:^(UIControl *sender) {
        NSLog(@"UIControlEventTouchCancel");
    }];
    
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:1];
}

@end
