//
//  SAMOtherViewController.m
//  Demo
//
//  Created by samiMac on 16/5/6.
//  Copyright © 2016年 wydatas. All rights reserved.
//

#import "SAMOtherViewController.h"
#import "SAMUIKitTools.h"
#import "AFNetworking.h"

#pragma mark - SAMProgressViewControllerSubController

@interface SAMProgressViewControllerSubController ()
<
UIWebViewDelegate
>

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@end

@implementation SAMProgressViewControllerSubController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.webView.delegate = self;

    
    self.automaticallyAdjustsScrollViewInsets = 0;

    
    [self loadRequest];
    
    NSMutableArray *rightItems = [NSMutableArray array];
    
    // refresh
    UIBarButtonItem *refresh = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:(UIBarButtonSystemItemRefresh) target:self action:@selector(rightBarButtons:)];
    refresh.tag = 1;
    [rightItems addObject:refresh];
    
    // back
    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:(UIBarButtonSystemItemRewind) target:self action:@selector(rightBarButtons:)];
    back.tag = 2;
    [rightItems addObject:back];
    
    [self.navigationItem setRightBarButtonItems:rightItems animated:1];
    
    
    
}
- (void)rightBarButtons:(UIBarButtonItem *)sender
{
    if (1 == sender.tag) {
        [self.webView reload];
    }
    
    if (2 == sender.tag) {
        [self.webView goBack];
    }
}
- (void)loadRequest
{
    NSString *urlString = @"https://github.com/ISMeSAM/SAMUIKitTools";
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.cachePolicy = NSURLRequestReloadIgnoringLocalAndRemoteCacheData;
    [self.webView loadRequest:request];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [self dismiss];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self dismiss];
}

- (void)dismiss
{
    __weak typeof(self) weakSelf = self;
    [self.navigationController.navigationBar sam_ProgressDismiss];
    [UIView animateWithDuration:0.25 animations:^{
        __strong typeof(weakSelf) strongSelf = weakSelf;
        strongSelf.navigationController.navigationBar.sam_progress = 1;
    } completion:^(BOOL finished) {
        if (finished) {
            
            [UIApplication sharedApplication].networkActivityIndicatorVisible = 0;
        }
    }];
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = 1;
    [self.navigationController.navigationBar sam_showProgressViewWithType:(SAMProgressViewProgressType_bottom)];
    self.navigationController.navigationBar.sam_progress = 0;
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:0.25 animations:^{
        __strong typeof(weakSelf) strongSelf = weakSelf;
        strongSelf.navigationController.navigationBar.sam_progress = 0.1;
    }];
    
}




@end



#pragma mark - SAMProgressViewController

@interface SAMProgressViewController ()
@property (weak, nonatomic) IBOutlet UISlider *slider;
@end

@implementation SAMProgressViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"ProgressView";
    
    [self.view sam_showProgressViewWithType:(SAMProgressViewProgressType_bottom)];
    
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
    
    [navBar sam_showProgressViewWithType:(SAMProgressViewProgressType_bottom)];
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
//    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//    
//    __weak typeof(self) weakSelf = self;
    
    
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


