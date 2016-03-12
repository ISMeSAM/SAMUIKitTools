//
//  CALayer+SAMExtension.h
//  Demo
//
//  Created by samiMac on 16/3/12.
//  Copyright © 2016年 wydatas. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>


/**
 *  CATransition 转场动画 动画效果类型
 */
typedef NS_ENUM(NSUInteger, CAAnimationTransition_Type) {
    /**
     *  水波
     */
    CAAnimationTransition_Type_RippleEffect,
    /**
     *  吸走
     */
    CAAnimationTransition_Type_SuckEffect,
    /**
     *  翻书
     */
    CAAnimationTransition_Type_PageCurl,
    /**
     *  正反翻转
     */
    CAAnimationTransition_Type_OglFlip,
    /**
     *  正方体
     */
    CAAnimationTransition_Type_Cube,
    /**
     *  推开
     */
    CAAnimationTransition_Type_Reveal,
    /**
     *  合上书本
     */
    CAAnimationTransition_Type_PageUnCurl,
    /**
     *  随机
     */
    CAAnimationTransition_Type_Ramdom,
};

/**
 *  CATransition 转场动画 动画方向类型
 */
typedef NS_ENUM(NSUInteger, CAAnimationTransition_SubType) {
    /**
     *  上
     */
    CAAnimationTransition_SubType_FromTop,
    /**
     *  左
     */
    CAAnimationTransition_SubType_FromLeft,
    /**
     *  下
     */
    CAAnimationTransition_SubType_FromBotoom,
    /**
     *  右
     */
    CAAnimationTransition_SubType_FromRight,
    /**
     *  随机
     */
    CAAnimationTransition_SubType_Ramdom,
};

/**
 *  CATransition 转场动画 动画曲线类型
 */
typedef NS_ENUM(NSUInteger, CAAnimationTransition_CurveType) {
    /**
     *  默认
     */
    CAAnimationTransition_CurveType_Default,
    /**
     *  缓进
     */
    CAAnimationTransition_CurveType_EaseIn,
    /**
     *  缓出
     */
    CAAnimationTransition_CurveType_EaseOut,
    /**
     *  缓进缓出
     */
    CAAnimationTransition_CurveType_EaseInEaseOut,
    /**
     *  线性
     */
    CAAnimationTransition_CurveType_Linear,
    /**
     *  随机
     */
    CAAnimationTransition_CurveType_Ramdom,
};


@interface CALayer (SAMExtension)


/**
 *  转场动画实现
 *
 *  @param type     动画类型
 *  @param subType  动画执行方向
 *  @param cureType 动画曲线类型
 *  @param duration 动画时长
 *
 *  @return 返回一个转场动画实例
 */
- (CATransition *)transitionWithTranstionType:(CAAnimationTransition_Type)type
                                      subType:(CAAnimationTransition_SubType)subType
                                        curve:(CAAnimationTransition_CurveType)cureType
                                     duration:(NSTimeInterval)duration;




@end



/*
 *  反转方向
 */
typedef enum {
    
    //X
    AnimReverDirectionX=0,
    
    //Y
    AnimReverDirectionY,
    
    //Z
    AnimReverDirectionZ,
    
}AnimReverDirection;



@interface CALayer (Anim)


/**
 *  关键帧动画
 *
 *  @param rotations   要改变的帧数
 *  @param duration    动画时长
 *  @param repeatCount 重复次数
 *
 *  @return 返回一个帧动画
 */
-(CAAnimation *)anim_shake:(NSArray *)positions
                  duration:(NSTimeInterval)duration
               repeatCount:(NSUInteger)repeatCount;





- (CAAnimation *)anim_keyFrame:(NSArray *)rotations
                      duration:(NSTimeInterval)duration
                   repeatCount:(NSUInteger)repeatCount;

/**
 *    普通动画
 *
 *  @param direction      翻转方向 x y z
 *  @param duration       动画时长
 *  @param isReverse      是否翻转
 *  @param repeatCount    重复次数
 *  @param timingFuncName 过度样式
 *
 *  @return 返回一个basic动画
 */
-(CAAnimation *)anim_revers:(AnimReverDirection)direction
                   duration:(NSTimeInterval)duration
                  isReverse:(BOOL)isReverse
                repeatCount:(NSUInteger)repeatCount
             timingFuncName:(NSString *)timingFuncName;


@end

