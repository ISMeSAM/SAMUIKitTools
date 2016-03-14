//
//  CALayer+SAMExtension.m

#import "CALayer+SAMExtension.h"




@implementation CALayer (Anim)


- (CAAnimation *)anim_shake:(NSArray *)positions
                   duration:(NSTimeInterval)duration
                repeatCount:(NSUInteger)repeatCount{
    
    //创建关键帧动画
    CAKeyframeAnimation *kfa = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.z"];
    
    //指定值
    kfa.values = positions;
    
    //时长
    kfa.duration = duration;
    
    //重复次数
    kfa.repeatCount=repeatCount;
    
    //完成删除
    kfa.removedOnCompletion = YES;
    
    //添加
    [self addAnimation:kfa forKey:@"rotation"];
    
    return kfa;
}
- (CAAnimation *)anim_keyFrame:(NSArray *)rotations
                      duration:(NSTimeInterval)duration
                   repeatCount:(NSUInteger)repeatCount{
    
    //创建关键帧动画
    CAKeyframeAnimation *kfa = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    //指定值
    kfa.values = rotations;
    
    //时长
    kfa.duration = duration;
    
    //重复次数
    kfa.repeatCount=repeatCount;
    
    //完成删除
    kfa.removedOnCompletion = YES;
    
    //添加
    [self addAnimation:kfa forKey:@"position"];
    
    return kfa;
}


- (CAAnimation *)anim_revers:(AnimReverDirection)direction
                    duration:(NSTimeInterval)duration
                   isReverse:(BOOL)isReverse
                 repeatCount:(NSUInteger)repeatCount
              timingFuncName:(NSString *)timingFuncName{
    
    NSString *key = @"reversAnim";
    
    if([self animationForKey:key]!=nil){
        [self removeAnimationForKey:key];
    }
    
    NSString *directionStr = nil;
    
    if(AnimReverDirectionX == direction)directionStr=@"x";
    if(AnimReverDirectionY == direction)directionStr=@"y";
    if(AnimReverDirectionZ == direction)directionStr=@"z";
    
    //创建普通动画
    CABasicAnimation *reversAnim = [CABasicAnimation animationWithKeyPath:[NSString stringWithFormat:@"transform.rotation.%@",directionStr]];
    
    //起点值
    reversAnim.fromValue=@(0);
    
    //终点值
    reversAnim.toValue = @(M_PI_2);
    
    //时长
    reversAnim.duration = duration;
    
    //自动反转
    reversAnim.autoreverses = isReverse;
    
    //完成删除
    reversAnim.removedOnCompletion = YES;
    
    //重复次数
    reversAnim.repeatCount = repeatCount;
    
    //添加
    [self addAnimation:reversAnim forKey:key];
    
    return reversAnim;
}


@end





@implementation CALayer (SAMExtension)

static  NSString *const key = @"transition";


static  NSArray *const allTransitions()
{
    
    return @[
             @"rippleEffect",
             @"suckEffect",
             @"pageCurl",
             @"oglFlip",
             @"cube",
             @"reveal",
             @"pageUnCurl"
             ];
}


static  NSArray *const allSubTypes()
{
    
    return @[
             kCATransitionFromTop,
             kCATransitionFromLeft,
             kCATransitionFromBottom,
             kCATransitionFromRight
             ];
}


static  NSArray *const allCurves()
{
    
    return @[
             kCAMediaTimingFunctionDefault,
             kCAMediaTimingFunctionEaseIn,
             kCAMediaTimingFunctionEaseInEaseOut,
             kCAMediaTimingFunctionEaseOut,
             kCAMediaTimingFunctionLinear
             ];
}


- (CATransition *)transitionWithTranstionType:(CAAnimationTransition_Type)type
                                      subType:(CAAnimationTransition_SubType)subType
                                        curve:(CAAnimationTransition_CurveType)cureType
                                     duration:(NSTimeInterval)duration
{
    
    if ([self animationForKey:key]) {
        [self removeAnimationForKey:key];
    }
    
    
    CATransition *transition = [CATransition animation];
    
    
    transition.duration = duration;
    
    
    transition.type = [self typeFromArray:allTransitions()
                                    index:type
                                 isRandom:(type == CAAnimationTransition_Type_Ramdom)];
    
    
    transition.subtype = [self typeFromArray:allSubTypes()
                                       index:subType
                                    isRandom:(subType == CAAnimationTransition_SubType_Ramdom)];
    
    
    transition.timingFunction = [CAMediaTimingFunction functionWithName:[self typeFromArray:allCurves()
                                                                                      index:cureType
                                                                                   isRandom:(cureType == CAAnimationTransition_CurveType_Ramdom)]];
    
    
    [transition setRemovedOnCompletion:YES];
    
    [self addAnimation:transition forKey:key];
    
    return transition;
}



- (NSString *)typeFromArray:(NSArray *)arr
                      index:(NSUInteger)index
                   isRandom:(BOOL)isRandom
{
    NSUInteger count = arr.count;
    
    NSUInteger idx = isRandom?arc4random_uniform((u_int32_t)count):index ;
    
    return arr[idx];
}


@end
