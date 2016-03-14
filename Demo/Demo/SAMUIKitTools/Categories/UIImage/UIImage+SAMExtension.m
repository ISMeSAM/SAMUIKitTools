//
//  UIImage+SAMExtension.m


#import "UIImage+SAMExtension.h"

#import <Accelerate/Accelerate.h>
#import <float.h>

#define kMagarn 5

#define kScale 0.2



@implementation UIImage (SAMExtension)



+ (instancetype)imageScreenshot{
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    // 开启图形上下文
    UIGraphicsBeginImageContext(window.bounds.size);
    
    // 获取当前图形上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // 拿到 window 的 layer 渲染到上下文
    [window.layer renderInContext:context];
    
    // 获取当前图形上下文的 image
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    // 关闭图形上下文
    UIGraphicsEndImageContext();
    
    // 返回 image
    return image;
}


+ (instancetype)imageScreenshotEffectWithType:(UIImageEffectType)type{
    
    UIImage *image = [UIImage imageScreenshot];
    
    switch (type) {
        case UIImageEffectTypeDarkEffect:
            image = [image applyDarkEffect];
            break;
            
        case UIImageEffectTypeLightEffect:
            image = [image applyLightEffect];
            break;
        case UIImageEffectTypeExtraLightEffect:
            image = [image applyExtraLightEffect];
            break;
        default:
            image = [image applyLightEffect];
            break;
    }
    
    return image;
}


+ (instancetype)watermarkWithBackgroundImage:(NSString *)bg
                                        logo:(NSString *)logo
                            logoPositionType:(WatermarkPositionType)type
                                   logoScale:(CGFloat)scale{
    // 背景图片
    UIImage *bgimage = [UIImage imageNamed:bg];
    
    CGSize bgSize = bgimage.size;
    
    // 开启上下文
    UIGraphicsBeginImageContextWithOptions(bgimage.size, NO, 0.0);
    
    // 画背景
    [bgimage drawInRect:CGRectMake(0, 0, bgSize.width, bgSize.height)];
    
    // logo
    UIImage *logoImg = [UIImage imageNamed:logo];
    
    
    // 可选参数
    CGFloat margin = 5;
    
    CGFloat waterW = logoImg.size.width * scale;
    
    CGFloat waterH = logoImg.size.height * scale;
    
    CGFloat waterX ;
    CGFloat waterY ;
    

    switch (type) {
            
            // 右下角
        case WatermarkPositionType_LowerRightCorner:
        {
            
            waterX = bgSize.width - waterW - margin;
            waterY = bgSize.height - waterH - margin;
            
        }
            break;
            
            // 右上角
        case WatermarkPositionType_TopRightCorner:
        {
            
            waterX = bgSize.width - waterW - margin;
            waterY = margin;
            
        }
            break;
            
            // 左下角
        case WatermarkPositionType_LowerLeftCorner:
        {
            
            waterX = margin;
            waterY = bgSize.height - waterH - margin;
            
        }
            break;
            
            // 左上角
        case WatermarkPositionType_TopLeftCorner:
        {
            
            waterX = margin;
            waterY = margin;
            
        }
            break;
            
            // 中心
        case WatermarkPositionType_Center:
        {
            
            waterX = bgSize.width * 0.5;
            waterY = bgSize.height * 0.5;
            
            
        }
            break;
            
            
        default:
        {
            waterX = bgSize.width - waterW - margin;
            waterY = bgSize.height - waterH - margin;
        }
            break;
    }
    
    [logoImg drawInRect:CGRectMake(waterX, waterY, waterW, waterH)];
    
    UIImage *resultImg = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return resultImg;
}

+ (instancetype)watermarkWithBackgroundImage:(NSString *)bg
                                        logo:(NSString *)logo
                            logoPositionType:(WatermarkPositionType)type{
    
    return [self watermarkWithBackgroundImage:bg logo:logo logoPositionType:type logoScale:kScale];
}


+ (instancetype)circleAlwaysOriginalImageWithImageName:(NSString *)imageName boardWidth:(CGFloat)boardWidth boardColor:(UIColor *)boardColor
{
    return [[self circleImageWithImageName:imageName boardWidth:boardWidth boardColor:boardColor] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}


+ (instancetype)circleImageWithImageName:(NSString *)imageName
                              boardWidth:(CGFloat)boardWidth
                              boardColor:(UIColor *)boardColor
{
    
    UIImage *oldImage = [UIImage imageNamed:imageName];
    
    CGSize imageSize = oldImage.size;
    
    CGFloat imageWidth = imageSize.width - boardWidth * 2;
    CGFloat imageHeight = imageSize.height - boardWidth * 2;
    
    CGFloat tmp = MIN(imageWidth, imageHeight);
    
    CGSize contextSize = CGSizeMake(tmp, tmp);
    
    UIGraphicsBeginImageContextWithOptions(contextSize, NO, 0.0);
    
    // 获取图形上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [boardColor set];
    
    // 大圆半径
    CGFloat bigRadius = tmp * 0.5;
    
    CGFloat centerX = bigRadius;
    CGFloat centerY = bigRadius;
    
    CGContextAddArc(context, centerX, centerY, bigRadius, 0, M_PI * 2, YES);
    CGContextFillPath(context);
    
    
    CGFloat smallRadius = bigRadius - boardWidth;
    
    CGContextAddArc(context, centerX, centerY, smallRadius, 0, M_PI * 2, YES);
    
    // 裁剪 裁剪之后画的东西才会受到影响
    CGContextClip(context);
    
    [oldImage drawAsPatternInRect:CGRectMake(boardWidth, boardWidth, imageSize.width, imageSize.height)];
    
    UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return resultImage;
}

+ (instancetype)circleImageWithImage:(UIImage *)image
                          boardWidth:(CGFloat)boardWidth
                          boardColor:(UIColor *)boardColor
{
    
    CGSize imageSize = image.size;
    
    CGFloat imageWidth = imageSize.width - boardWidth * 2;
    CGFloat imageHeight = imageSize.height - boardWidth * 2;
    
    CGFloat tmp = MIN(imageWidth, imageHeight);
    
    CGSize contextSize = CGSizeMake(tmp, tmp);
    
    UIGraphicsBeginImageContextWithOptions(contextSize, NO, 0.0);
    
    // 获取图形上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [boardColor set];
    
    // 大圆半径
    CGFloat bigRadius = tmp * 0.5;
    
    CGFloat centerX = bigRadius;
    CGFloat centerY = bigRadius;
    
    CGContextAddArc(context, centerX, centerY, bigRadius, 0, M_PI * 2, YES);
    CGContextFillPath(context);
    
    
    CGFloat smallRadius = bigRadius - boardWidth;
    
    CGContextAddArc(context, centerX, centerY, smallRadius, 0, M_PI * 2, YES);
    
    // 裁剪 裁剪之后画的东西才会受到影响
    CGContextClip(context);
    
    [image drawAsPatternInRect:CGRectMake(boardWidth, boardWidth, imageSize.width, imageSize.height)];
    
    UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    return resultImage;
}



+ (instancetype)circleImageWithImage:(UIImage *)image
{
    return [self circleImageWithImage:image
                           boardWidth:5.0
                           boardColor:[UIColor whiteColor]];
}

+ (instancetype)circleImageWithImageName:(NSString *)imageName
{
    return [self circleImageWithImageName:imageName
                               boardWidth:5.0
                               boardColor:[UIColor whiteColor]];
}



+ (UIImage *)image4ContextWithColor:(UIColor *)color
                               size:(CGSize)size
{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0f);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, color.CGColor);
    
    CGContextFillRect(context, rect);
    
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return img;
}


+ (UIImage *)imageWithString:(NSString *)string font:(UIFont *)strFont strColor:(UIColor *)strColor
{
    
    CGSize size = [string sizeWithFont:strFont];
    
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0f);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // 设置填充色
    CGContextSetFillColorWithColor(context, [UIColor clearColor].CGColor);
    
    //填充
    CGContextFillRect(context, rect);
    
    // 设置绘制方式
    CGContextSetTextDrawingMode(context, kCGTextFillStroke);
    
    // 设置文字颜色
    CGContextSetFillColorWithColor(context, strColor.CGColor);
    
    // todo
    CGContextSetLineWidth(context, 0);
    
    [string drawInRect:rect withFont:strFont];
    
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return img;
}



+ (UIImage *)imageWithString:(NSString *)string
                        size:(CGSize)size
                    strColor:(UIColor *)strColor
                    withFont:(UIFont *)font
{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    
    
    CGSize size_tmp = [string sizeWithFont:font];
    UIGraphicsBeginImageContextWithOptions(size_tmp, NO, 0.0f);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // 设置填充色
    CGContextSetFillColorWithColor(context, [UIColor clearColor].CGColor);
    // 填充
    CGContextFillRect(context, rect);
    
    // 设置绘制方式
    CGContextSetTextDrawingMode(context, kCGTextFillStroke);
    
    // 设置文字颜色
    CGContextSetFillColorWithColor(context, strColor.CGColor);
    
    // todo
    CGContextSetLineWidth(context, 0);
    
    [string drawInRect:rect withFont:font];
    
    
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return img;
}



+ (UIImage *)originImage:(UIImage *)originImage
             scaleToSize:(CGSize)scaleToSize
{
    // begin Image Context
    
    CGFloat tmp = (scaleToSize.width > scaleToSize.height)?scaleToSize.width:scaleToSize.height;
    
    // 开启一个正方形的图形上下文
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(tmp, tmp), NO, 0.0f);
    
    //    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [originImage drawInRect:CGRectMake(0, 0, tmp, tmp)];
    
    UIImage *resultImg = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return resultImg;
}


- (UIImage *)resizableImage
{
    CGSize size = self.size;
    
    CGFloat capLeft = size.width * 0.5;
    CGFloat capRight = capLeft;
    CGFloat capTop = size.height * 0.5;
    CGFloat capBottom = capTop ;
    
    UIEdgeInsets inset = UIEdgeInsetsMake(capTop, capLeft, capBottom, capRight);
    
    return [self resizableImageWithCapInsetsCustom:inset];
}

- (UIImage *)resizableImageWithCapInsetsCustom:(UIEdgeInsets)capInsets
{
    return [self resizableImageWithCapInsets:capInsets resizingMode:UIImageResizingModeStretch];
}

+ (instancetype)resizableWithImageNamed:(NSString *)imageName withsMode:(UIImageResizingMode)model
{
    UIImage *image = [UIImage imageNamed:imageName];
    
    CGSize size = image.size;
    
    CGFloat capLeft = size.width * 0.5;
    CGFloat capRight = capLeft;
    CGFloat capTop = size.height * 0.5;
    CGFloat capBottom = capTop ;
    
    return [image resizableImageWithCapInsets:UIEdgeInsetsMake(capTop, capLeft, capBottom, capRight) resizingMode:model];
}


@end



@implementation UIImage (ImageEffects)


- (UIImage *)applyLightEffect
{
    UIColor *tintColor = [UIColor colorWithWhite:1.0 alpha:0.47];
    return [self applyBlurWithRadius:30 tintColor:tintColor saturationDeltaFactor:1.8 maskImage:nil];
}


- (UIImage *)applyExtraLightEffect
{
    UIColor *tintColor = [UIColor colorWithWhite:0.97 alpha:0.82];
    return [self applyBlurWithRadius:20 tintColor:tintColor saturationDeltaFactor:1.8 maskImage:nil];
}


- (UIImage *)applyDarkEffect
{
    UIColor *tintColor = [UIColor colorWithWhite:0.11 alpha:0.63];
    return [self applyBlurWithRadius:20 tintColor:tintColor saturationDeltaFactor:1.8 maskImage:nil];
}


- (UIImage *)applyTintEffectWithColor:(UIColor *)tintColor
{
    const CGFloat EffectColorAlpha = 0.6;
    UIColor *effectColor = tintColor;
    unsigned long componentCount = CGColorGetNumberOfComponents(tintColor.CGColor);
    if (componentCount == 2) {
        CGFloat b;
        if ([tintColor getWhite:&b alpha:NULL]) {
            effectColor = [UIColor colorWithWhite:b alpha:EffectColorAlpha];
        }
    }
    else {
        CGFloat r, g, b;
        if ([tintColor getRed:&r green:&g blue:&b alpha:NULL]) {
            effectColor = [UIColor colorWithRed:r green:g blue:b alpha:EffectColorAlpha];
        }
    }
    return [self applyBlurWithRadius:10 tintColor:effectColor saturationDeltaFactor:-1.0 maskImage:nil];
}


- (UIImage *)applyBlurWithRadius:(CGFloat)blurRadius
                       tintColor:(UIColor *)tintColor
           saturationDeltaFactor:(CGFloat)saturationDeltaFactor
                       maskImage:(UIImage *)maskImage
{
    // Check pre-conditions.
    if (self.size.width < 1 || self.size.height < 1) {
        NSLog (@"*** error: invalid size: (%.2f x %.2f). Both dimensions must be >= 1: %@", self.size.width, self.size.height, self);
        return nil;
    }
    if (!self.CGImage) {
        NSLog (@"*** error: image must be backed by a CGImage: %@", self);
        return nil;
    }
    if (maskImage && !maskImage.CGImage) {
        NSLog (@"*** error: maskImage must be backed by a CGImage: %@", maskImage);
        return nil;
    }
    
    CGRect imageRect = { CGPointZero, self.size };
    UIImage *effectImage = self;
    
    BOOL hasBlur = blurRadius > __FLT_EPSILON__;
    BOOL hasSaturationChange = fabs(saturationDeltaFactor - 1.) > __FLT_EPSILON__;
    if (hasBlur || hasSaturationChange) {
        UIGraphicsBeginImageContextWithOptions(self.size, NO, [[UIScreen mainScreen] scale]);
        CGContextRef effectInContext = UIGraphicsGetCurrentContext();
        CGContextScaleCTM(effectInContext, 1.0, -1.0);
        CGContextTranslateCTM(effectInContext, 0, -self.size.height);
        CGContextDrawImage(effectInContext, imageRect, self.CGImage);
        
        vImage_Buffer effectInBuffer;
        effectInBuffer.data     = CGBitmapContextGetData(effectInContext);
        effectInBuffer.width    = CGBitmapContextGetWidth(effectInContext);
        effectInBuffer.height   = CGBitmapContextGetHeight(effectInContext);
        effectInBuffer.rowBytes = CGBitmapContextGetBytesPerRow(effectInContext);
        
        UIGraphicsBeginImageContextWithOptions(self.size, NO, [[UIScreen mainScreen] scale]);
        CGContextRef effectOutContext = UIGraphicsGetCurrentContext();
        vImage_Buffer effectOutBuffer;
        effectOutBuffer.data     = CGBitmapContextGetData(effectOutContext);
        effectOutBuffer.width    = CGBitmapContextGetWidth(effectOutContext);
        effectOutBuffer.height   = CGBitmapContextGetHeight(effectOutContext);
        effectOutBuffer.rowBytes = CGBitmapContextGetBytesPerRow(effectOutContext);
        
        if (hasBlur) {
            
            //
            CGFloat inputRadius = blurRadius * [[UIScreen mainScreen] scale];
            NSUInteger radius = floor(inputRadius * 3. * sqrt(2 * M_PI) / 4 + 0.5);
            if (radius % 2 != 1) {
                radius += 1; // force radius to be odd so that the three box-blur methodology works.
            }
            vImageBoxConvolve_ARGB8888(&effectInBuffer, &effectOutBuffer, NULL, 0, 0, radius, radius, 0, kvImageEdgeExtend);
            vImageBoxConvolve_ARGB8888(&effectOutBuffer, &effectInBuffer, NULL, 0, 0, radius, radius, 0, kvImageEdgeExtend);
            vImageBoxConvolve_ARGB8888(&effectInBuffer, &effectOutBuffer, NULL, 0, 0, radius, radius, 0, kvImageEdgeExtend);
        }
        BOOL effectImageBuffersAreSwapped = NO;
        if (hasSaturationChange) {
            CGFloat s = saturationDeltaFactor;
            CGFloat floatingPointSaturationMatrix[] = {
                0.0722 + 0.9278 * s,  0.0722 - 0.0722 * s,  0.0722 - 0.0722 * s,  0,
                0.7152 - 0.7152 * s,  0.7152 + 0.2848 * s,  0.7152 - 0.7152 * s,  0,
                0.2126 - 0.2126 * s,  0.2126 - 0.2126 * s,  0.2126 + 0.7873 * s,  0,
                0,                    0,                    0,  1,
            };
            const int32_t divisor = 256;
            NSUInteger matrixSize = sizeof(floatingPointSaturationMatrix)/sizeof(floatingPointSaturationMatrix[0]);
            int16_t saturationMatrix[matrixSize];
            for (NSUInteger i = 0; i < matrixSize; ++i) {
                saturationMatrix[i] = (int16_t)roundf(floatingPointSaturationMatrix[i] * divisor);
            }
            if (hasBlur) {
                vImageMatrixMultiply_ARGB8888(&effectOutBuffer, &effectInBuffer, saturationMatrix, divisor, NULL, NULL, kvImageNoFlags);
                effectImageBuffersAreSwapped = YES;
            }
            else {
                vImageMatrixMultiply_ARGB8888(&effectInBuffer, &effectOutBuffer, saturationMatrix, divisor, NULL, NULL, kvImageNoFlags);
            }
        }
        if (!effectImageBuffersAreSwapped)
            effectImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        if (effectImageBuffersAreSwapped)
            effectImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    
    // Set up output context.
    UIGraphicsBeginImageContextWithOptions(self.size, NO, [[UIScreen mainScreen] scale]);
    CGContextRef outputContext = UIGraphicsGetCurrentContext();
    CGContextScaleCTM(outputContext, 1.0, -1.0);
    CGContextTranslateCTM(outputContext, 0, -self.size.height);
    
    // Draw base image.
    CGContextDrawImage(outputContext, imageRect, self.CGImage);
    
    // Draw effect image.
    if (hasBlur) {
        CGContextSaveGState(outputContext);
        if (maskImage) {
            CGContextClipToMask(outputContext, imageRect, maskImage.CGImage);
        }
        CGContextDrawImage(outputContext, imageRect, effectImage.CGImage);
        CGContextRestoreGState(outputContext);
    }
    
    // Add in color tint.
    if (tintColor) {
        CGContextSaveGState(outputContext);
        CGContextSetFillColorWithColor(outputContext, tintColor.CGColor);
        CGContextFillRect(outputContext, imageRect);
        CGContextRestoreGState(outputContext);
    }
    
    // Output image is ready.
    UIImage *outputImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return outputImage;
}


@end


