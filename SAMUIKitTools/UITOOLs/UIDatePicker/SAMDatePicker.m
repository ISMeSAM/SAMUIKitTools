//
//  SAMDatePicker.m

#import "SAMDatePicker.h"


@interface SAMDatePicker ()
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@end

@implementation SAMDatePicker


+ (instancetype)datePicker
{
    SAMDatePicker *view = [[[NSBundle mainBundle] loadNibNamed:@"SAMDatePicker" owner:nil options:nil] lastObject];
    [view.datePicker addTarget:view action:@selector(datePickerValueChanged:) forControlEvents:UIControlEventValueChanged];
    view.datePicker.maximumDate = [NSDate date];
    view.datePicker.minimumDate = [NSDate dateWithTimeIntervalSince1970:0];
    view.backgroundColor = [UIColor clearColor];
    return view;
}

- (void)setMaximumDate:(NSDate *)maximumDate
{
    _maximumDate = maximumDate;
    self.datePicker.maximumDate = maximumDate;
}

- (void)setMinimumDate:(NSDate *)minimumDate
{
    _minimumDate = minimumDate;
    self.datePicker.minimumDate = minimumDate;
    
}

- (void)setDatePickerBackgroundColor:(UIColor *)datePickerBackgroundColor
{
    _datePickerBackgroundColor = datePickerBackgroundColor;
    self.backgroundColor = datePickerBackgroundColor;
}



- (void)datePickerValueChanged:(UIDatePicker *)aDatePicker
{
    if (self.datePickerValueChanged) {
        self.datePickerValueChanged(aDatePicker);
    }
    
}


- (IBAction)cancelAction:(UIBarButtonItem *)sender
{
    if (self.cancelAction) {
        self.cancelAction(self.datePicker);
    }
}

- (IBAction)doneAction:(UIBarButtonItem *)sender
{
    if (self.doneAction) {
        self.doneAction(self.datePicker);
    }
}



@end
