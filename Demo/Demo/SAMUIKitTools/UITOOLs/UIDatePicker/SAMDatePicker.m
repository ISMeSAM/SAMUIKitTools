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
    
    return view;
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



#pragma mark - todo

- (UIView *)setupToolBarViews
{
    UIView *toolBarView = [[UIView alloc] init];
    
    toolBarView.width = self.width;
    toolBarView.height = 35.f;
    toolBarView.x = 0;
    toolBarView.y = 0;
    
    // cancel
    UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [toolBarView addSubview:cancelButton];
    [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    [cancelButton sizeToFit];
    
    cancelButton.x = 16.f;
    cancelButton.center_y = toolBarView.center_y;
    
    
    [cancelButton addTarget:self action:@selector(cancelAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    // doneButton
    UIButton *doneButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [toolBarView addSubview:doneButton];
    [doneButton setTitle:@"完成" forState:UIControlStateNormal];
    [doneButton sizeToFit];
    
    CGFloat width = doneButton.width;
    CGFloat doneX = self.width - width - 16.f;
    
    doneButton.x = doneX;
    doneButton.center_y = toolBarView.center_y;
    
    
    [doneButton addTarget:self action:@selector(doneAction:) forControlEvents:UIControlEventTouchUpInside];
    
    return toolBarView;
}



@end
