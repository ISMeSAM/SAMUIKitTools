//
//  SAMOtherViewController.m
//  Demo
//
//  Created by samiMac on 16/5/6.
//  Copyright © 2016年 wydatas. All rights reserved.
//

#import "SAMOtherViewController.h"
#import "SAMUIKitTools.h"


#pragma mark - SAMProgressViewController

@interface SAMProgressViewController ()
@property (weak, nonatomic) IBOutlet UISlider *slider;
@end

@implementation SAMProgressViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"ProgressView";
    
    [self.view showProgressViewWithType:(SAMProgressViewProgressType_bottom)];
    
    __weak typeof(self) weakSelf = self;
    
    [self.slider addActionForEvents:(UIControlEventValueChanged) aAction:^(UIControl *sender) {
        
        __strong typeof(weakSelf) strongSelf = weakSelf;
        
        UISlider *slider = (UISlider *)sender;
        
        strongSelf.view.sam_progress = slider.value;
        
    }];
    
}


- (IBAction)startProgress
{
    
#pragma mark - ProgressView
    UINavigationBar *navBar = self.navigationController.navigationBar;
    
    [navBar showProgressViewWithType:(SAMProgressViewProgressType_bottom)];
    navBar.sam_progress = 0;
    
    [UIView animateWithDuration:2.25 animations:^{
        
        navBar.sam_progress = 1.0;
        
    } completion:^(BOOL finished) {

        if (finished) {
            [navBar sam_ProgressDismiss];
        }
    }];
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self.navigationController.navigationBar sam_ProgressDismiss];
}



@end



#pragma mark - SAMOtherViewController


@implementation SAMOtherViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Others";
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return items().count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SAMOtherViewControllerCell"];
    
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
            SAMProgressViewController *ctrl = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"SAMProgressViewController"];
            [self.navigationController pushViewController:ctrl animated:1];
        }
            break;
            
        case 1:
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
                   @"ProgressView"
                   ];
    }
    return _items;
}

@end


