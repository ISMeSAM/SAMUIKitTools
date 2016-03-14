//
//  UIBarButtonItem+SAMExtension.h


#import <UIKit/UIKit.h>


@interface UIBarButtonItem (SAMExtension)



/**
 *  快速初始化一个BarButtonItem  title
 *
 *  @param title        title
 *  @param target       target
 *  @param action       action
 *
 *  @return 返回一个customView的UIBarButtonItem对象
 */
+ (instancetype)itemWithTitle:(NSString *)title
                       target:(id)target
                       action:(SEL)action;



/**
 *  快速初始化一个BarButtonItem  title
 *
 *  @param title        title
 *  @param normalColor
 *  @param pressedColor
 *  @param target       target
 *  @param action       action
 *
 *  @return 返回一个customView的UIBarButtonItem对象
 */
+ (instancetype)itemWithTitle:(NSString *)title
                  normalColor:(UIColor *)normalColor
                 pressedColor:(UIColor *)pressedColor
                       target:(id)target
                       action:(SEL)action;




/**
 *  快速初始化一个BarButtonItem image
 *
 *  @param imageName 图片的名字
 *  @param target 监听者
 *  @param action 事件处理
 *
 *  @return 返回一个customView的UIBarButtonItem对象
 */
+ (instancetype)itemWithImageName:(NSString *)imageName
                           target:(id)target
                           action:(SEL)action;




/**
 *  根据imageName 和title 返回一个customView的UIBarButtonItem
 *
 *  @param imageName 图片的名称
 *  @param title     title
 *  @param target
 *  @param action
 *
 *  @return 返回一个customView的UIBarButtonItem对象
 */
+ (instancetype)itemWithImageName:(NSString *)imageName
                            title:(NSString *)title
                           target:(id)target
                           action:(SEL)action;




/**
 *  根据imageName 返回一个customView的UIBarButtonItem
 *
 *  @param imageName
 *  @param selectedImageName
 *  @param target
 *  @param action
 *
 *  @return 返回一个customView的UIBarButtonItem对象
 */
+ (instancetype)itemWithImageName:(NSString *)imageName
                selectedImageName:(NSString *)selectedImageName
                           target:(id)target
                           action:(SEL)action;





@end
