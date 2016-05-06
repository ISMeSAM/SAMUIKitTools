//
//  SAMPopToBottomView.h
//  Demo
//
//  Created by samiMac on 16/5/4.
//  Copyright © 2016年 wydatas. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SelectedItem)(NSInteger sender);

@interface SAMPopToBottomView : UIView

//@property (nonatomic , copy) SelectedItem selectedItem;
@property (nonatomic , copy) void(^selectedItem)(UIButton *aButton,NSInteger sender);


+ (instancetype)popWithArray:(NSArray<__kindof NSString *> *)items;


@end















