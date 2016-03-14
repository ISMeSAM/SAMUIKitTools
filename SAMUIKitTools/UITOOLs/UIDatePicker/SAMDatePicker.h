//
//  SAMDatePicker.h

#import <UIKit/UIKit.h>
#import "Categories.h"
#import "SAMKeys.h"

typedef void(^buttonAction)(UIDatePicker *sender);

@interface SAMDatePicker : UIView

@property (nonatomic , copy) void(^cancelAction)(UIDatePicker *sender);
//@property (nonatomic , copy) buttonAction cancelAction;

@property (nonatomic , copy) void(^doneAction)(UIDatePicker *sender);
//@property (nonatomic , copy) buttonAction doneAction;

@property (nonatomic , copy) void(^datePickerValueChanged)(UIDatePicker *aDatePicker);


+ (instancetype)datePicker;



@end
