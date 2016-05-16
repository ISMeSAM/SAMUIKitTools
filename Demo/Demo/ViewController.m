//
//  ViewController.m


#import "ViewController.h"
#import "SAMUIKitTools.h"

#import "SAMSlideBar.h"


@interface ViewController ()
<
    SAMSlideBarCompontDataSource
>

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

            [[SAMPopToBottomView popWithArray:@[@"发送给朋友"]] setSelectedItem:^(UIButton *aButton,NSInteger sender) {
                NSLog(@"title==>%@---index==>%ld",aButton.currentTitle,sender);
                [SAMPopToStatusBarView showStatusBarViewWithMessage:[NSString stringWithFormat:@"%@成功!",aButton.currentTitle]];
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
            
            SAMPopAtBottomView *pop = [SAMPopAtBottomView bottomViewWithItems:@[item,item2,item,item2,item,item2,item,item2]];
            [pop show];
            
            [pop setSelectedItem:^(NSIndexPath *aIndexPath) {
                NSLog(@"-----aIndexPath----------%ld",aIndexPath.item);
            }];
        }
            break;
            
        case 5:
        {
#pragma mark - SAMAlertView
            SAMAlertViewItem *item1 = [[SAMAlertViewItem alloc] initWithTitle:@"我是一个蓝色的按钮" titleColor:[UIColor blueColor]];
            SAMAlertViewItem *item2 = [[SAMAlertViewItem alloc] initWithTitle:@"我是一个红色的按钮" titleColor:[UIColor redColor]];
            SAMAlertView *alert = [SAMAlertView showWithItems:@[item1,item2] withMessage:@"我是message" title:@"我是title"];
          
            alert.touchBackgroundViewCanRemove = YES;
            
            alert.messageColor = [UIColor redColor];
            
            [alert setDidSelectedItem:^(SAMAlertViewItem * _Nonnull aItem, NSInteger clickIndex) {
                NSLog(@"%@--%ld",aItem.title,clickIndex);
            }];
        }
            break;
            
        case 6:
        {
#pragma mark - SAMSlideBar left
            
            // left
            [SAMSlideBar showWithTargetViewController:self];

        }
            break;
            
        case 7:
        {
#pragma mark - SAMSlideBar right
            // right
            
            SAMSlideBar *sli = [SAMSlideBar showWithTargetViewController:self andType:SAMSlideBarShowDirectionType_right];
            
            
            
            [sli setViewWillShow:^(SAMSlideBar *aSlideBar, UIButton *contentView, UIView *componentView) {
                NSLog(@"setViewWillShow");
            }];
            [sli setViewDidShow:^(SAMSlideBar *aSlideBar, UIButton *contentView, UIView *componentView) {
                NSLog(@"setViewDidShow");
            }];
            [sli setViewWillDismiss:^(SAMSlideBar *aSlideBar, UIButton *contentView, UIView *componentView) {
                NSLog(@"setViewWillDismiss");
            }];
            [sli setViewDidDismiss:^(SAMSlideBar *aSlideBar, UIButton *contentView, UIView *componentView) {
                NSLog(@"setViewDidDismiss");
            }];
            
        }
            break;
            
        default:
            break;
    }
    
}




#pragma mark - SAMSlideBarCompontDataSource


- (UIView *)sideBarInSlideBarContentView:(UIButton *)contentView
{
    UIView *view = [[UIView alloc] initWithFrame:contentView.bounds];
    
    UIButton *button = [UIButton buttonWithType:(UIButtonTypeContactAdd)];
    [button addActionForEvents:UIControlEventTouchUpInside aAction:^(UIControl *sender) {
        NSLog(@"---button--touchupinside");
    }];
     button.center = view.center;
    [view addSubview:button];
    
    UIButton *buttonInfo = [UIButton buttonWithType:UIButtonTypeInfoDark];
    [buttonInfo addActionForEvents:UIControlEventTouchUpInside aAction:^(UIControl *sender) {
        NSLog(@"---buttonInfo--touchupinside");
    }];
    
    [view addSubview:buttonInfo];
    buttonInfo.center = CGPointMake(20, 40);
    
    button.backgroundColor = [UIColor blueColor];
    view.backgroundColor = [UIColor linenColor];
    return view;
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
                   @"SAMPopAtBottomView",
                   @"SAMAlertView",
                   @"SAMSlideBar_left",
                   @"SAMSlideBar_right"
                   ];
    }
    return _items;
}


@end

