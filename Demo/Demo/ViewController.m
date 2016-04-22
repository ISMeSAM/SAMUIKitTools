//
//  ViewController.m


#import "ViewController.h"
#import "SAMUIKitTools.h"

@interface ViewController ()


@end

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"PopOvers";

   
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
 
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    __weak typeof(self) weakSelf = self;
    
    [tableView deselectRowAtIndexPath:indexPath animated:1];

    switch (indexPath.row)
    {
        case 0:
        {
             [SAMPopToStatusBarView showStatusBarViewWithMessage:@"Hello sam! ✓"];
        }
            break;
            
        case 1:
        {
            SAMPopLists *popList = [SAMPopLists popListsWithArray:@[@"one",@"two",@"three",@"four"]];
            popList.cellColor = [UIColor redColor];
            [popList setSelectItemIndexPathAction:^(UITableViewCell *aCell, NSIndexPath *aIndexPath) {
                
                cell.detailTextLabel.text = aCell.textLabel.text;
                [weakSelf.tableView reloadData];
            }];
            
        }
            break;
            
        case 2:
        {
            SAMDatePicker *dataPicker = [SAMDatePicker datePicker];
            dataPicker.datePickerBackgroundColor = [UIColor whiteColor];
            [dataPicker setDoneAction:^(UIDatePicker *aDatePicker) {
                
                cell.detailTextLabel.text = aDatePicker.date.yyyyMMddString;
                
                [weakSelf.view endEditing:1];
                [weakSelf.tableView reloadData];
            }];
            
            [dataPicker setCancelAction:^(UIDatePicker *aDatePicker) {
                [weakSelf.view endEditing:1];
            }];
            
            UITextField *tx = [self textField];
            if ([tx superview] == cell) {
                
            }else{
                [cell addSubview:tx];
            }
            tx.inputView = dataPicker;
            [tx becomeFirstResponder];

        }
            break;
            
        case 3:
        {
//            [SAMPopToBottomView showWithArray:@[@"123456",@"23456534"]];
            
        }
            break;
            
        case 4:
        {
            
        }
            break;
            
        case 5:
        {

        }
            break;
            
        case 6:
        {
            
            
        }
            break;
            
        case 7:
        {
            
            
        }
            break;
            
        default:
            break;
    }
    
    
    
}



static UITextField *_aTextField;

- (UITextField *)textField
{
    if (!_aTextField)
    {
        _aTextField = [UITextField new];
        
    }
    return _aTextField;
}


@end









