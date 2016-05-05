//
//  SAMPopToBottomView.m
//  Demo
//
//  Created by samiMac on 16/5/4.
//  Copyright © 2016年 wydatas. All rights reserved.
//

#import "SAMPopToBottomView.h"

#import "Categories.h"

@interface SAMPopToBottomViewButton : UIButton

@end

@implementation SAMPopToBottomViewButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        self.backgroundColor = [UIColor whiteColor];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:15.f];
        
        UIImage *highlightedIMG = [UIImage imageNamed:SAMUIKitToolsSrcName(@"background_highlighted.png")] ?: [UIImage imageNamed:SAMUIKitToolsSrcName(@"background_highlighted.png")];
        highlightedIMG = [highlightedIMG resizableImage];

        [self setBackgroundImage:highlightedIMG forState:UIControlStateHighlighted];
        
    }
    return self;
}

@end



@interface SAMPopToBottomView()


@property (nonatomic , strong) NSArray *items ;

@property (nonatomic , strong) UIButton *contentView ;

@property (nonatomic , strong) UIButton *cancleButton ;

@end

@implementation SAMPopToBottomView

static double _itemHeight = 49.f;
static double _gap = 4.f;
static double _duration = 0.25;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _contentView = [[UIButton alloc] init];
        _contentView.backgroundColor = [UIColor darkGrayColor];
        _contentView.alpha = 1.0;
        _contentView.width = self.width;
        _contentView.x = 0;
        _contentView.y = self.height;
        
        [self addSubview:_contentView];
    }
    return self;
}

+ (instancetype)popWithArray:(NSArray<NSString *> *)items
{
    if (2 > items.count) {
        return nil;
    }
    
     UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    
    SAMPopToBottomView *pop = [[SAMPopToBottomView alloc] initWithFrame:window.bounds];
    pop.backgroundColor = [UIColor lightGrayColor];
    pop.alpha = 0;
    pop.items = items;
    
    [window addSubview:pop];

    [UIView animateWithDuration:_duration animations:^{
        pop.alpha = 1.0;
    }];
    
    return pop;
}

- (void)setItems:(NSArray *)items
{
    _items = items;
    
    NSInteger count = items.count;
    CGFloat width = self.width;
    
    for (NSInteger i = 0 ; i < count ; ++i){
    
        NSString *title = items[i];
        SAMPopToBottomViewButton *button = [[SAMPopToBottomViewButton alloc] init];
        
        button.tag = i;
        button.size = CGSizeMake(width, _itemHeight);
        [button setTitle:title forState:UIControlStateNormal];
        button.y = _itemHeight * i + i * 0.5;
        button.x = 0;
        
        [button addTarget:self action:@selector(itemButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.contentView addSubview:button];
    }
    
    
    SAMPopToBottomViewButton *cancleButton = [[SAMPopToBottomViewButton alloc] init];
    self.cancleButton = cancleButton;
    [cancleButton setTitle:@"取消" forState:UIControlStateNormal];
    
    __weak typeof(self) weakSelf = self;
    
    [cancleButton addActionForEvents:(UIControlEventTouchUpInside) aAction:^(UIControl *sender) {
        [weakSelf dismiss];
     }];
    
    cancleButton.size = CGSizeMake(width, _itemHeight);
    cancleButton.x = 0;
    cancleButton.y = _itemHeight * count + (count - 1) * 0.5 + _gap;
    
    [self.contentView addSubview:cancleButton];

    self.contentView.height = (count + 1) * _itemHeight + _gap + (count - 1);
    
    [UIView animateWithDuration:_duration animations:^{
        self.contentView.y = self.height - self.contentView.height;
    }];
    
    UIImage *backgroundColorImg = [[UIImage imageScreenshot] applyTintEffectWithColor:[UIColor darkGrayColor]];

    self.backgroundColor = [UIColor colorWithPatternImage:backgroundColorImg];
    
}


- (void)itemButtonClick:(UIButton *)sender
{
    [self dismiss];
    if (self.selectedItem) {
        self.selectedItem(sender,sender.tag);
    }
}


#pragma mark - 

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self dismiss];
}

- (void)dismiss
{
    [UIView animateWithDuration:_duration animations:^{
        self.alpha = 0;
        self.contentView.y = self.height;
    } completion:^(BOOL finished) {
        if (finished) {
            [self removeFromSuperview];
            [self.contentView removeFromSuperview];
        }
    }];

}


@end





