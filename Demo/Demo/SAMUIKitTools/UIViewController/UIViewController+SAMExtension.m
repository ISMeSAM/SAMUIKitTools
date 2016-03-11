//
//  UIViewController+SAMExtension.m
//  Demo
//
//  Created by samiMac on 16/3/11.
//  Copyright © 2016年 wydatas. All rights reserved.
//

#import "UIViewController+SAMExtension.h"
#define AppDelegateEntity ((AppDelegate *)[UIApplication sharedApplication].delegate)
@implementation UIViewController (SAMExtension)

- (void)showTargetView:(UIView *)targetView
             fromPoint:(CGPoint)fromPoint
               toPoint:(CGPoint)toPoint
                action:(SEL)action
            identifier:(NSString *)identifier
{
    
}


//_v : 你要展示的view
//_fromPoint : view 初始化的地方
//_toPoint : view目的地坐标
//_selecter : 该view消失后回调方法
//identifier : 唯一编码，用来找到view回调的方法
//- (void)showView:(UIView*)_v withFromPoint:(CGPoint)_fromPoint toPoint:(CGPoint)_toPoint select:(SEL)_selecter identifier:(NSString *)_str
//{
//    
//    UIWindow *window =[[UIApplication sharedApplication] keyWindow];
//    
//    CGSize screenSize = [UIScreen mainScreen].bounds.size;
//    CGFloat screenHeight = screenSize.height;
//    CGFloat screenWidth = screenSize.width;
//    
//    if (![[window subviews] containsObject:_v])
//    {
//        //        设置你要挪出来的界面的起始位置
//        //        _v.alpha = 0.25f;
//        _v.frame=CGRectMake(0, 0, screenWidth, screenHeight + 20);
//        //注册通知，等到这个界面被remove的时候调用 判断下这个方法存不存在
//        if([self respondsToSelector:_selecter]) {
//            [[NSNotificationCenter defaultCenter] addObserver:self selector:_selecter name:_str object:nil];
//        }
//        TouchMoveView *view=[[TouchMoveView alloc] initWithFrame:self.navigationController.view.frame
//                                                 backgroundColor:nil selectName:_str view:_v viewController:self point:_fromPoint fromPoint:CGPointMake(self.navigationController.view.frame.size.width*-1+_toPoint.x, _toPoint.y*-1) andSiftView:_v];
//        view.tag=99999;
//        //        把view add上去
//        [window insertSubview:_v belowSubview:self.navigationController.view];
//        [self.navigationController.view addSubview:view];
//        //        self.navigationController.view.transform = CGAffineTransformMakeScale(0.618, 0.618);
//        //        开始动画
//        [UIView beginAnimations:@"showView" context:nil];
//        [UIView setAnimationDuration:0.3];
//        [UIView setAnimationDelegate:self];
//        //        要移到的位置
//        self.navigationController.view.frame=CGRectMake(self.navigationController.view.frame.size.width*-1+_toPoint.x, _toPoint.y*-1, self.navigationController.view.frame.size.width,self.navigationController.view.frame.size.height);
//        _v.transform = CGAffineTransformIdentity;
//        _v.alpha = 1.0;
//        
//        [UIView commitAnimations];
//        [AppDelegateEntity closeAllDragOperation];
//    }
//}
//- (void)showViewController:(UIViewController*)_vc withFromPoint:(CGPoint)_fromPoint toPoint:(CGPoint)_toPoint select:(SEL)_selecter identifier:(NSString *)_str
//{
//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeContactAdd];
//    [AppDelegateEntity setRightSiftMenu:_vc];
//    [self presentRightMenuViewController:btn];
//    if ([_str length] > 0 && [self  respondsToSelector:_selecter]) {
//        [[NSNotificationCenter defaultCenter] addObserver:self selector:_selecter name:_str object:nil];
//    }
//}
- (void)hiddenView:(UIView*)_v toFrame:(CGPoint)_toPoint identifier:(NSString *)_str
{
    [[NSNotificationCenter defaultCenter] postNotificationName:_str object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:_str object:nil];
    //    [AppDelegateEntity setRightSiftMenu:nil];
    
    //    [UIView animateWithDuration:0.35 delay:0 options:0 animations:^{
    //        //    这个是让整个界面一起移过去，但是导致在windows外面 所以就暂时不用了
    //        //    将view移出去，向你所要的方向
    //        self.navigationController.view.frame=CGRectMake(0,0,self.navigationController.view.frame.size.width, self.navigationController.view.frame.size.height);
    //        _v.alpha = 0.5;
    ////        _v.transform = CGAffineTransformMakeScale(0.618, 0.618);
    //    } completion:^(BOOL finished) {
    //        //    动画结束后执行remove
    //        _v.transform = CGAffineTransformIdentity;
    //        [_v performSelector:@selector(removeFromSuperview) withObject:_v afterDelay:0.3];
    //        [[self.navigationController.view viewWithTag:99999] removeFromSuperview];
    //        //    调用之前注册的那个通知，看能不能调用到以前的那个需要回调的东西
    //        [[NSNotificationCenter defaultCenter] postNotificationName:_str object:nil];
    //        //    删除之前注册的通知
    //        [[NSNotificationCenter defaultCenter] removeObserver:self name:_str object:nil];
    //        [AppDelegateEntity openAllDragOperation];
    //    }];
}

@end
