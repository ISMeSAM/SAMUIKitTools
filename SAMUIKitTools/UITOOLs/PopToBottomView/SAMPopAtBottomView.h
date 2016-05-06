//
//  SAMPopAtBottomView.h
//  Demo
//
//  Created by samiMac on 16/5/5.
//  Copyright © 2016年 wydatas. All rights reserved.
//

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

