//
//  CheckBox.h


#import <UIKit/UIKit.h>

@interface CheckBox : UIButton
{
    BOOL _isOpen;
    UIImage *_imgOpen;
    UIImage *_imgClose;
}

@property (nonatomic , assign) BOOL isOpen ;
@property (nonatomic , strong) UIImage *imgOpen ;
@property (nonatomic , strong) UIImage *imgClose ;

//+ (instancetype)checkBoxWithImage:(UIImage *)openImg closeImg:(UIImage *)closeImg;
//- (instancetype)checkBoxWithImage:(UIImage *)openImg closeImg:(UIImage *)closeImg;


@end
