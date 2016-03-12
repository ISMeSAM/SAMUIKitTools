//
//  SAMPopLists.h
//  HumanSource
//
//  Created by samiMac on 15/12/8.
//  Copyright © 2015年 wydatas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Categories.h"
#import "SAMKeys.h"

@interface SAMPopLists : UIView

@property (nonatomic , copy) void(^selectItemAction)(UITableViewCell *cel) __deprecated_msg("Use 'selectItemIndexPathAction' ");

@property (nonatomic , copy) void(^selectItemIndexPathAction)(UITableViewCell *cel,NSIndexPath *indexPath);

/**
 *  pop
 *
 *  @param items pop items
 *
 *  @return pop View
 */
+ (instancetype)popListsWithArray:(NSArray *)items ;

/**
 *  pop
 *
 *  @param items pop items
 *  @param style style
 *
 *  @return pop View
 */
+ (instancetype)popListsWithArray:(NSArray *)items style:(UIImageEffectType)style ;

/**
 *  pop
 *
 *  @param items      items
 *  @param targetView pop targetView
 *
 *  @return show&add in targetView
 */
+ (instancetype)popListsWithArray:(NSArray *)items withView:(UIView *)targetView __deprecated_msg("Use 'popListsWithArray:'");
/**
 *  pop
 *
 *  @param items      items
 *  @param targetView targetView
 *  @param style      style
 *
 *  @return show&add in targetView
 */
+ (instancetype)popListsWithArray:(NSArray *)items withView:(UIView *)targetView style:(UIImageEffectType)style __deprecated_msg("Use 'popListsWithArray:style:'");

@end
