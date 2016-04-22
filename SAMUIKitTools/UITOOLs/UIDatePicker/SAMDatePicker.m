//
//  SAMDatePicker.m

#import "SAMDatePicker.h"


@interface SAMDatePicker ()
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@end

@implementation SAMDatePicker


static SAMDatePicker *_DatePicker;

+ (instancetype)datePicker
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _DatePicker = [[[NSBundle mainBundle] loadNibNamed:@"SAMDatePicker" owner:nil options:nil] lastObject];
        [_DatePicker.datePicker addTarget:_DatePicker action:@selector(datePickerValueChanged:) forControlEvents:UIControlEventValueChanged];
        _DatePicker.datePicker.maximumDate = [NSDate date];
        _DatePicker.datePicker.minimumDate = [NSDate dateWithTimeIntervalSince1970:0];

    });
    return _DatePicker;
}


- (void)show
{
    UITextField *tx = [self tmpTextField];
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    
    tx.inputView = [SAMDatePicker datePicker];
    
    if (tx.superview == window) {
        [tx becomeFirstResponder];
    }else{
        [window addSubview:tx];
        [tx becomeFirstResponder];
    }

}


- (void)dismiss
{
    UITextField *tx = [self tmpTextField];
    if (tx.superview == [[[UIApplication sharedApplication] delegate] window]) {
        [tx resignFirstResponder];
    }else{
        [[[[UIApplication sharedApplication] delegate] window] resignFirstResponder];
    }
    
}


static UITextField *_tmpTextField;

- (UITextField *)tmpTextField
{
    if (!_tmpTextField)
    {
        _tmpTextField = [UITextField new];
        
    }
    return _tmpTextField;
}


#pragma mark -

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



#pragma mark -

- (void)datePickerValueChanged:(UIDatePicker *)aDatePicker
{
    if (self.datePickerValueChanged) {
        self.datePickerValueChanged(aDatePicker);
    }
    
}


- (IBAction)cancelAction:(UIBarButtonItem *)sender
{
    [self dismiss];
    if (self.cancelAction) {
        self.cancelAction(self.datePicker);
    }
}

- (IBAction)doneAction:(UIBarButtonItem *)sender
{
    [self dismiss];
    if (self.doneAction) {
        self.doneAction(self.datePicker);
    }
}



@end
