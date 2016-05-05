//
//  SAMPopLists.m


#import "SAMPopLists.h"


@interface SAMPopLists()
<
UITableViewDataSource,
UITableViewDelegate
>

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *hightConstrains;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *widthConstraints;

@property (nonatomic , strong) NSArray *items;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation SAMPopLists


static const CGFloat kRowH = 44.f;


+ (instancetype)popListsWithArray:(NSArray *)items withView:(UIView *)targetView
{
    return [self popListsWithArray:items withView:targetView style:UIImageEffectTypeLightEffect];
}

+ (instancetype)popListsWithArray:(NSArray *)items withView:(UIView *)targetView style:(UIImageEffectType)style
{
    SAMPopLists *pop = [[[NSBundle mainBundle] loadNibNamed:@"SAMPopLists" owner:nil options:nil] lastObject];
    pop.items = items;
    pop.tableView.rowHeight = kRowH;
    pop.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageScreenshotEffectWithType:style]];
    CGFloat hightCount = items.count * kRowH;
    if (hightCount < (SCREEN_HEIGHT - 108)) {
        pop.hightConstrains.constant = hightCount;
    }else{
        pop.hightConstrains.constant = SCREEN_HEIGHT - 5 * kRowH;
    }
    pop.cornerRadius = 5.f;
    pop.bounds = KEY_WINDOW.bounds;
    pop.center = targetView.center;
    
    pop.alpha = 0;
    [targetView addSubview:pop];
    [UIView animateWithDuration:0.25 animations:^{
        pop.alpha = 1;
    }];
    
    return pop;
}


+ (instancetype)popListsWithArray:(NSArray *)items
{
    return [self popListsWithArray:items style:UIImageEffectTypeLightEffect];
}

+ (instancetype)popListsWithArray:(NSArray *)items style:(UIImageEffectType)style
{
    SAMPopLists *pop = [[[NSBundle mainBundle] loadNibNamed:@"SAMPopLists" owner:nil options:nil] lastObject];
    pop.items = items;
    pop.tableView.rowHeight = kRowH;
    pop.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageScreenshotEffectWithType:style]];
    CGFloat hightCount = items.count * kRowH;
    if (hightCount < (SCREEN_HEIGHT - 108)) {
        pop.hightConstrains.constant = hightCount;
    }else{
        pop.hightConstrains.constant = SCREEN_HEIGHT - 5 * kRowH;
    }
    
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    
    pop.cornerRadius = 5.f;
    pop.bounds = window.bounds;
    pop.center = window.center;
    
    pop.alpha = 0;
    [window addSubview:pop];
    [UIView animateWithDuration:0.25 animations:^{
        pop.alpha = 1;
    }];
    return pop;
}


- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageScreenshotEffectWithType:UIImageEffectTypeExtraLightEffect]];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.items.count;
}

static NSString *const reuserID = @"62529bff58cd29e5709b4c04e392a9e5709b4c04e3605";
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuserID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuserID];
        
        if (self.cellTextLabelFont) {
            cell.textLabel.font = self.cellTextLabelFont;
        }else{
            cell.textLabel.font = SYS_FONT(15.f);
        }
    
        if (self.cellColor) {
            cell.backgroundColor = self.cellColor;
        }else{
            cell.backgroundColor = [UIColor steelBlueColor]; // 103 G:153 B:170 A:1.0]
        }
        
        if (self.cellCornerRadius) {
            cell.cornerRadius = self.cellCornerRadius;
        }else{
            cell.cornerRadius = 5.f;
        }
        
        if (self.textLabelColor) {
            cell.textLabel.textColor = self.textLabelColor;
        }else{
            cell.textLabel.textColor = [UIColor whiteColor];
        }
        
    }
    
    cell.textLabel.text = self.items[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    WeakSelf
    
    UITableViewCell *cellView = [tableView cellForRowAtIndexPath:indexPath];
    (cellView.accessoryType == UITableViewCellAccessoryNone)?(cellView.accessoryType=UITableViewCellAccessoryCheckmark):(cellView.accessoryType = UITableViewCellAccessoryNone);
  
    if (self.selectItemIndexPathAction) {
        self.selectItemIndexPathAction(cellView,indexPath);
    }
    
    [UIView animateWithDuration:0.25 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        if (finished) {
            [weakSelf removeFromSuperview];
        }
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    WeakSelf
    [UIView animateWithDuration:0.25 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        if (finished) {
            [weakSelf removeFromSuperview];
        }
    }];
}



@end
