//
//  UIControl+SAMAddAction.h

#import <UIKit/UIKit.h>


typedef void(^action)(UIControl *sender);

@interface UIControl (SAMAddAction)


@property (nonatomic , copy) action aAction ;

@property (nonatomic , copy) action aTouchDown ;
@property (nonatomic , copy) action aTouchDownRepeat ;
@property (nonatomic , copy) action aTouchDragInside ;
@property (nonatomic , copy) action aTouchDragOutside ;
@property (nonatomic , copy) action aTouchDragEnter;
@property (nonatomic , copy) action aTouchDragExit ;
@property (nonatomic , copy) action aTouchUpInside ;
@property (nonatomic , copy) action aTouchUpOutside ;
@property (nonatomic , copy) action aTouchCancel ;
@property (nonatomic , copy) action aValueChanged ;
@property (nonatomic , copy) action aPrimaryActionTriggered ;
@property (nonatomic , copy) action aEditingDidBegin ;
@property (nonatomic , copy) action aEditingChanged ;
@property (nonatomic , copy) action aEditingDidEnd ;
@property (nonatomic , copy) action aEditingDidEndOnExit ;
@property (nonatomic , copy) action aAllTouchEvents ;
@property (nonatomic , copy) action aAllEditingEvents ;
@property (nonatomic , copy) action aApplicationReserved ;
@property (nonatomic , copy) action aSystemReserved ;
@property (nonatomic , copy) action aEventAllEvents ;



- (void)addActionForEvents:(UIControlEvents)events aAction:(action)aAction;


@end








