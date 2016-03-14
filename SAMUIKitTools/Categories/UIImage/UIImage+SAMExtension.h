//
//  UIImage+SAMExtension.h


#import <UIKit/UIKit.h>


/**
 *  磨砂效果类型
 */
typedef NS_ENUM(NSUInteger, UIImageEffectType){
    /**
     *  灯光效果
     */
    UIImageEffectTypeLightEffect,
    /**
     *  超光效应
     */
    UIImageEffectTypeExtraLightEffect,
    /**
     *  暗影效果
     */
    UIImageEffectTypeDarkEffect,
};

/**
 *  水印图片出现的位置
 */
typedef NS_ENUM(NSUInteger, WatermarkPositionType) {
    
    /**
     *  右下角
     */
    WatermarkPositionType_LowerRightCorner ,
    /**
     *  右上角
     */
    WatermarkPositionType_TopRightCorner,
    
    /**
     *  左下角
     */
    WatermarkPositionType_LowerLeftCorner,
    
    /**
     *  左上角
     */
    WatermarkPositionType_TopLeftCorner,
    
    /**
     *  中心
     */
    WatermarkPositionType_Center,
    
};



@interface UIImage (SAMExtension)

/**
 *  截取 keywindow 的图片
 *
 *  @return 返回 image 对象
 */
+ (instancetype)imageScreenshot;

/**
 *  当前屏幕截屏的磨砂效果图
 *
 *  @param type 磨砂效果类型
 *
 *  @return 返回 image 对象
 */
+ (instancetype)imageScreenshotEffectWithType:(UIImageEffectType)type;

/**
 *  图片水印
 *
 *  @param bg   背景图片名称
 *  @param logo 水印图片 logo名称
 *
 *  @param type  水印位置
 *
 *  @return 返回一张水印图片
 */
+ (instancetype)watermarkWithBackgroundImage:(NSString *)bg
                                        logo:(NSString *)logo
                            logoPositionType:(WatermarkPositionType)type;


/**
 *  图片水印
 *
 *  @param bg   背景图片名称
 *  @param logo 水印图片 logo名称
 *
 *  @param type  水印位置
 *
 *  @param scale  水印缩放比例
 *
 *  @return 返回一张水印图片
 */
+ (instancetype)watermarkWithBackgroundImage:(NSString *)bg
                                        logo:(NSString *)logo
                            logoPositionType:(WatermarkPositionType)type
                                   logoScale:(CGFloat)scale;




/**
 *  裁剪一个圆形图片
 *
 *  @param imageName  图片的名称
 *  @param boardWidth 边框宽度
 *  @param boardColor 边框颜色
 *
 *  @return 返回一张裁剪后的图片
 */
+ (instancetype)circleImageWithImageName:(NSString *)imageName
                              boardWidth:(CGFloat)boardWidth
                              boardColor:(UIColor *)boardColor;
/**
 *  裁剪一个圆形图片
 *
 *  @param image  图片
 *  @param boardWidth 边框宽度
 *  @param boardColor 边框颜色
 *
 *  @return 返回一张裁剪后的图片
 */
+ (instancetype)circleImageWithImage:(UIImage *)image
                          boardWidth:(CGFloat)boardWidth
                          boardColor:(UIColor *)boardColor;


/**
 *  裁剪一个圆形图片
 *
 *  @param imageName  图片的名称
 *
 *  @return 返回一张裁剪后的图片
 */
+ (instancetype)circleImageWithImageName:(NSString *)imageName;

/**
 *  裁剪一个圆形图片
 *
 *  @param image  图片
 *
 *  @return 返回一张裁剪后的图片
 */
+ (instancetype)circleImageWithImage:(UIImage *)image;

//
//+ (instancetype)circleImageWithImageName:(NSString *)imageName
//                              boardWidth:(CGFloat)boardWidth
//                              boardColor:(UIColor *)boardColor
//                             contextSize:(CGSize)contextSize
//                                   scale:(CGFloat)scale;
/**
 *  裁剪一个圆形图片
 *
 *  @param imageName  图片的名称
 *
 *  @return 返回一张裁剪后的图片并保持原始渲染色
 */
+ (instancetype)circleAlwaysOriginalImageWithImageName:(NSString *)imageName
                                            boardWidth:(CGFloat)boardWidth
                                            boardColor:(UIColor *)boardColor;

/**
 *  根据一中颜色和尺寸返回一个Image对象
 *
 *  @param color 颜色
 *  @param size  大小
 *
 *  @return Image对象
 */
+ (UIImage *)image4ContextWithColor:(UIColor *)color size:(CGSize)size;


+ (UIImage *)imageWithString:(NSString *)string font:(UIFont *)strFont strColor:(UIColor *)strColor;

/**
 *  根据一个字符串生成一张图片
 *
 *  @param string 字符串
 *  @param size   大小
 *  @param font   字体大小
 *
 *  @return img
 */
+ (UIImage *)imageWithString:(NSString *)string size:(CGSize)size strColor:(UIColor *)strColor withFont:(UIFont *)font NS_DEPRECATED_IOS(2_0, 7_0, "Use +imageWithString:font:strColor:");




/**
 *  缩放一张图片
 *
 *  @param originImage 原始图片
 *  @param scaleToSize 缩放成多大的图片
 *
 *  @return 返回一张图片
 */
+ (UIImage *)originImage:(UIImage *)originImage scaleToSize:(CGSize)scaleToSize ;


- (UIImage *)resizableImage;
- (UIImage *)resizableImageWithCapInsetsCustom:(UIEdgeInsets)capInsets;

+ (instancetype)resizableWithImageNamed:(NSString *)imageName withsMode:(UIImageResizingMode)model;

@end




@interface UIImage (ImageEffects)

- (UIImage *)applyLightEffect;
- (UIImage *)applyExtraLightEffect;
- (UIImage *)applyDarkEffect;
- (UIImage *)applyTintEffectWithColor:(UIColor *)tintColor;

- (UIImage *)applyBlurWithRadius:(CGFloat)blurRadius
                       tintColor:(UIColor *)tintColor
           saturationDeltaFactor:(CGFloat)saturationDeltaFactor
                       maskImage:(UIImage *)maskImage;

@end