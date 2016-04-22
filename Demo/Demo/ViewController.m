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
            
            [dataPicker show];
            
            [dataPicker setDoneAction:^(UIDatePicker *picker) {
                cell.detailTextLabel.text = picker.date.yyyyMMddString;
                [tableView reloadData];
            }];
            
        }
            break;
            
        case 3:
        {
            
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
    
    
    [tableView deselectRowAtIndexPath:indexPath animated:1];
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









