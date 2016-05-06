//
//  SAMPopAtBottomView.m
//  Demo
//
//  Created by samiMac on 16/5/5.
//  Copyright © 2016年 wydatas. All rights reserved.
//

#import "SAMPopAtBottomView.h"

#import "Categories.h"

static double _itemWidth = 80.f;
static double _popHeight = 82.f;
static double _gap = 4.f;
static double _iconViewWidth = 55.f;


@implementation SAMPopAtBottomViewItem

@end


@interface SAMPopAtBottomViewCollectionViewCell()

@property (nonatomic , strong) SAMPopAtBottomViewItem *item ;

@property (nonatomic , strong) UIImageView *iconImageView ;

@property (nonatomic , strong) UILabel *textLabel ;

@end

@implementation SAMPopAtBottomViewCollectionViewCell


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) {
        return nil;
    }
    
    self.backgroundColor = [UIColor whiteColor];
    self.cornerRadius = _gap;
    UIView *selectedBackgroundView = [[UIView alloc] initWithFrame:self.bounds];
    selectedBackgroundView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.selectedBackgroundView = selectedBackgroundView;
    // init
    
    _iconImageView = [[UIImageView alloc] init];
    [self.contentView addSubview:_iconImageView];
  
    _textLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_textLabel];
  
    
    // config
    _iconImageView.size = CGSizeMake(_iconViewWidth, _iconViewWidth);
    _iconImageView.center_x = self.contentView.center_x;
    _iconImageView.y = _gap;
    
    _textLabel.width = _itemWidth - 2 * _gap;
    _textLabel.height = _itemWidth - 3 * _gap - _iconViewWidth;
    _textLabel.center_x = self.contentView.center_x;
    _textLabel.y = _iconViewWidth + _gap;
    _textLabel.font = [UIFont systemFontOfSize:11.f];
    _textLabel.textColor = [UIColor blackColor];
    _textLabel.textAlignment = NSTextAlignmentCenter;
    
    return self;
}

- (void)setItem:(SAMPopAtBottomViewItem *)item
{
    _item = item;
    
    self.textLabel.text = _item.title;
    
    self.iconImageView.image = [UIImage imageNamed:_item.image];
}



@end



@interface SAMPopAtBottomView ()
<
UICollectionViewDataSource,
UICollectionViewDelegate
>

@property (nonatomic , strong) UIView *contentView ;

@property (nonatomic , strong) UICollectionView *collectionView ;

@property (nonatomic , strong) NSArray<SAMPopAtBottomViewItem *> *items ;

@end

@implementation SAMPopAtBottomView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) {
        return nil;
    }
    
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    
    self.backgroundColor = [UIColor clearColor];
    
    CGRect subFrame = CGRectMake(0, 0, frame.size.width, _popHeight);
    
    _contentView = [[UIView alloc] init];
    _contentView.size = subFrame.size;
    _contentView.x = 0;
    _contentView.y = window.height;
    
    [self addSubview:_contentView];
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    
    flow.itemSize = CGSizeMake(_itemWidth, _itemWidth);
    flow.minimumLineSpacing = 1.f;
    flow.minimumInteritemSpacing = 4.f;
    
    flow.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    _collectionView = [[UICollectionView alloc] initWithFrame:_contentView.bounds collectionViewLayout:flow];
    [_contentView addSubview:_collectionView];
    
    _collectionView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    _collectionView.showsHorizontalScrollIndicator = 0;
    
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [_collectionView registerClass:[SAMPopAtBottomViewCollectionViewCell class] forCellWithReuseIdentifier:cellId];
    
    return self;
}


+ (instancetype)bottomViewWithItems:(NSArray<__kindof SAMPopAtBottomViewItem *> *)items
{
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    
    SAMPopAtBottomView *pop = [[SAMPopAtBottomView alloc] initWithFrame:window.bounds];
    
    pop.items = items;
    
    return pop;
}

- (void)show
{
    __weak typeof(self) weakSelf = self;
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    [window addSubview:self];
    
    [UIView animateWithDuration:0.25 animations:^{
        __strong typeof(weakSelf) strongSelf = weakSelf;
        strongSelf.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
        strongSelf.contentView.y = window.height - _popHeight;
    }];
    
}

- (void)dismiss
{
    __weak typeof(self) weakSelf = self;
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    [UIView animateWithDuration:0.25 animations:^{
        __strong typeof(weakSelf) strongSelf = weakSelf;
        strongSelf.alpha = 0;
        strongSelf.contentView.y = window.height;
        
    } completion:^(BOOL finished) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if (finished) {
            [strongSelf removeFromSuperview];
        }
    }];
}


#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.items.count;
}

static NSString *cellId = @"SAMPopAtBottomViewCollectionViewCell";
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SAMPopAtBottomViewCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    cell.item = self.items[indexPath.item];
    return cell;
}


#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self dismiss];
    if (self.selectedItem) {
        self.selectedItem(indexPath);
    }
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self dismiss];
}


@end

