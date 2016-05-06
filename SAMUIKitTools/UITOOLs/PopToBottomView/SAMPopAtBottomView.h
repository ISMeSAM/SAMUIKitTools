//
//  SAMPopAtBottomView.h

#import <UIKit/UIKit.h>


@interface SAMPopAtBottomViewCollectionViewCell : UICollectionViewCell
@end



@interface SAMPopAtBottomViewItem : NSObject

@property (nonatomic , copy) NSString *title ;

@property (nonatomic , copy) NSString *image ;

@end



@interface SAMPopAtBottomView : UIView

@property (nonatomic , copy) void(^selectedItem)(NSIndexPath *indexPath);

+ (instancetype)bottomViewWithItems:(NSArray<__kindof SAMPopAtBottomViewItem *> *)items;

- (void)show;

@end

