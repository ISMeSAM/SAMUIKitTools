//
//  SAMAlertView.m
//  Demo
//
//  Created by samiMac on 16/5/11.
//  Copyright © 2016年 wydatas. All rights reserved.
//

#import "SAMAlertView.h"
#import "UIView+SAMExtension.h"
#import "UIView+SAMGestureRecognizerAction.h"
#import "SAMKeys.h"

@interface SAMAlertView ()

@property (nonatomic , strong) UIButton *contentView ;
@property (nonatomic , strong) UILabel *messageLabel ;
@property (nonatomic , strong) UIButton *titleButton ;


@property (nonatomic , strong) NSArray<NSString *> *items ;
@property (nonatomic , copy) NSString *message ;
@property (nonatomic , copy) NSString *title ;

@end

@implementation SAMAlertView

static double _duration = 0.25;

static double _itemHeight = 44.f;

static double _messageHeight = 55.f;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) {
        return nil;
    }
 
    self.backgroundColor = [UIColor clearColor];
    
    
    // init
    
    CGFloat width = self.width - _itemHeight * 2;
    CGFloat height = 2 * _itemHeight + _messageHeight;
    
    
    _contentView = [[UIButton alloc] init];
    _contentView.backgroundColor = [UIColor lightGrayColor];
    _contentView.cornerRadius = 4.f;
    [self addSubview:_contentView];
    
    _titleButton = [[UIButton alloc] init];
    _titleButton.userInteractionEnabled = 0;
    _titleButton.backgroundColor = [UIColor whiteColor];
    [_titleButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    
    [_contentView addSubview:_titleButton];
    
    _messageLabel = [[UILabel alloc] init];
    _messageLabel.font = [UIFont systemFontOfSize:14.f];
    _messageLabel.textAlignment = NSTextAlignmentCenter;
    _messageLabel.backgroundColor = [UIColor whiteColor];
    [_contentView addSubview:_messageLabel];
    
   
    // config
    _contentView.size = CGSizeMake(width, height);
    _titleButton.size = CGSizeMake(width, _itemHeight);
    _messageLabel.size = CGSizeMake(width, _messageHeight );
    _messageLabel.numberOfLines = 0;
    
    
    _contentView.center_x = self.center_x;
    _contentView.y = 0;
    
    _titleButton.x = 0;
    _messageLabel.x = 0;
    
    _titleButton.y = 0;
    _messageLabel.y = CGRectGetMaxY(_titleButton.frame) + 0.5;
    
    
    
    // lineView
    UIView *upLineView = [self createLineView];
    [_contentView addSubview:upLineView];
    upLineView.x = 0;
    upLineView.y = CGRectGetMaxY(_titleButton.frame);
    
    UIView *downLineView = [self createLineView];
    [_contentView addSubview:downLineView];
    downLineView.x = 0;
    downLineView.y = CGRectGetMaxY(_messageLabel.frame);
    
    return self;
}

- (UIView *)createLineView
{
    UIView *lineView = [[UIView alloc] init];
    lineView.height = 0.5;
    lineView.width = self.contentView.width;
    lineView.backgroundColor = [UIColor lightGrayColor];
    return lineView;
}

- (void)setItems:(NSArray<NSString *> *)items
{
    _items = items;
    
    NSInteger count = _items.count;
    
    CGFloat width = self.contentView.width ;
    
    CGFloat itemWith = width / count;
    
    for (NSInteger i = 0 ; i < count  ; ++i) {
        
        NSString *title = items[i];
        UIButton *button = [[UIButton alloc] init];
        NSString *imgStr = SAMUIKitToolsSrcName(@"background_highlighted");
        if (imgStr.length == 0) {
            imgStr = SAMUIKitToolsFrameworkSrcName(@"background_highlighted");
        }
        UIImage *image = [UIImage imageNamed:imgStr];
        
        [button setBackgroundImage:image forState:UIControlStateHighlighted];
        [button setTitle:title forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        button.backgroundColor = [UIColor whiteColor];
        button.tag = i;
        button.width = itemWith;
        button.height = _itemHeight;
        button.y = CGRectGetMaxY(self.messageLabel.frame) + 0.5;
        button.x = i * itemWith + 0.5 * i;
        [self.contentView addSubview:button];
        
        [button addTarget:self action:@selector(itemButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    
}

- (void)itemButtonClick:(UIButton *)sender
{
    if (self.didSelectedItem) {
        self.didSelectedItem(sender,sender.tag);
    }
    [self dismiss];
}

- (void)setTitle:(NSString *)title
{
    _title = title;
    
    [_titleButton setTitle:_title forState:UIControlStateNormal];
}
- (void)setMessage:(NSString *)message
{
    _message = message;
    _messageLabel.text = _message;
}


+ (instancetype)showLeftItem:(NSString *)leftItem
                andRightItem:(NSString *)rightItem
                 withMessage:(NSString *)message
                       title:(NSString *)title
{
    return [self showWithItems:@[leftItem,rightItem]
                   withMessage:message
                         title:title];
}


+ (instancetype)showWithItems:(NSArray<__kindof NSString *> *)items
                  withMessage:(NSString *)message
                        title:(NSString *)title
{
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    SAMAlertView *alertView = [[SAMAlertView alloc] initWithFrame:window.bounds];
    alertView.items = items;
    alertView.title = title;
    alertView.message = message;
    [window addSubview:alertView];
    alertView.contentView.alpha = 0;
    [UIView animateWithDuration:_duration animations:^{
        alertView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
        
    } completion:^(BOOL finished) {
        if (finished) {
            [UIView animateWithDuration:_duration delay:0.0 usingSpringWithDamping:0.5 initialSpringVelocity:5.0 options:0 animations:^{
                
                alertView.contentView.center_y = window.center_y;
                alertView.contentView.alpha = 1.f;
            } completion:nil];
        }
    }];
    
    return alertView;
}





- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (self.touchBackgroundViewCanRemove) {
        [self dismiss];
    }
    
}


- (void)dismiss
{
    __weak typeof(self) weakSelf = self;
    __strong typeof(weakSelf) strongSelf = weakSelf;
    
    [UIView animateWithDuration:_duration animations:^{
        
        strongSelf.contentView.size = CGSizeZero;
        strongSelf.alpha = 0;
        strongSelf.contentView.y = 0;
        strongSelf.contentView.x = 0;
        
    } completion:^(BOOL finished) {
        if (finished) {
            [strongSelf removeFromSuperview];
            NSLog(@"%@",strongSelf);
        }
    }];
    
}


- (void)dealloc
{
    NSLog(@"dealloc--->%@",self);
}



@end







