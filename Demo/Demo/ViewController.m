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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return items().count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ViewControllerCell"];
    
    cell.textLabel.text = items()[indexPath.row];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [tableView deselectRowAtIndexPath:indexPath animated:1];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    __weak typeof(self) weakSelf = self;
    
    

    switch (indexPath.row)
    {
        case 0:
        {
#pragma mark - SAMPopToStatusBarView

             [SAMPopToStatusBarView showStatusBarViewWithMessage:@"Hello sam! ✓"];
        }
            break;
            
        case 1:
        {
#pragma mark - SAMPopLists

            SAMPopLists *popList = [SAMPopLists popListsWithArray:@[@"one",@"two",@"three",@"four"]];
            popList.cellColor = [UIColor raspberryColor];
            
            
            [popList setSelectItemIndexPathAction:^(UITableViewCell *aCell, NSIndexPath *aIndexPath) {
                
                cell.detailTextLabel.text = aCell.textLabel.text;
                [weakSelf.tableView reloadData];
            }];
            
        }
            break;
            
        case 2:
        {
#pragma mark - SAMDatePicker

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
#pragma mark - SAMPopToBottomView

            [[SAMPopToBottomView popWithArray:@[@"发送给朋友",@"保存图片",@"收藏",@"投诉"]] setSelectedItem:^(UIButton *aButton,NSInteger sender) {
                NSLog(@"title==>%@---index==>%ld",aButton.currentTitle,sender);
            }];
            
        }
            break;
            
        case 4:
        {
#pragma mark - SAMPopAtBottomView

            SAMPopAtBottomViewItem *item = [SAMPopAtBottomViewItem new];
            item.title = @"hellosam";
            item.image = @"iconImage";
            
            SAMPopAtBottomViewItem *item2 = [SAMPopAtBottomViewItem new];
            item2.title = @"helloworld";
            item2.image = @"iconImage";
            SAMPopAtBottomView *pop = [SAMPopAtBottomView bottomViewWithItems:@[item,item2]];
            [pop show];
            
            [pop setSelectedItem:^(NSIndexPath *aIndexPath) {
                NSLog(@"-----aIndexPath----------%ld",aIndexPath.item);
            }];
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



static NSArray<NSString *> *_items;
static NSArray<NSString *> *const items()
{
    if (!_items) {
        _items = @[
                   @"SAMPopToStatusBarView",
                   @"SAMPopLists",
                   @"SAMDatePicker",
                   @"SAMPopToBottomView",
                   @"SAMPopAtBottomView"
                   ];
    }
    return _items;
}


@end









