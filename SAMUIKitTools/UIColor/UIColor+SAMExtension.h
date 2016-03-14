//
//  UIColor+SAMExtension.h
//  Demo
//
//  Created by samiMac on 16/3/11.
//  Copyright © 2016年 wydatas. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "TargetConditionals.h"




#pragma mark - Static String Keys
static NSString * kColoursRGBA_R = @"RGBA-r";
static NSString * kColoursRGBA_G = @"RGBA-g";
static NSString * kColoursRGBA_B = @"RGBA-b";
static NSString * kColoursRGBA_A = @"RGBA-a";
static NSString * kColoursHSBA_H = @"HSBA-h";
static NSString * kColoursHSBA_S = @"HSBA-s";
static NSString * kColoursHSBA_B = @"HSBA-b";
static NSString * kColoursHSBA_A = @"HSBA-a";
static NSString * kColoursCIE_L = @"LABa-L";
static NSString * kColoursCIE_A = @"LABa-A";
static NSString * kColoursCIE_B = @"LABa-B";
static NSString * kColoursCIE_alpha = @"LABa-a";
static NSString * kColoursCIE_C = @"LABa-C";
static NSString * kColoursCIE_H = @"LABa-H";
static NSString * kColoursCMYK_C = @"CMYK-c";
static NSString * kColoursCMYK_M = @"CMYK-m";
static NSString * kColoursCMYK_Y = @"CMYK-y";
static NSString * kColoursCMYK_K = @"CMYK-k";


#pragma mark - Create correct iOS/OSX interface

#if TARGET_OS_IPHONE
#import <UIKit/UIKit.h>
@interface UIColor (Colours)

#elif TARGET_OS_MAC
#import <AppKit/AppKit.h>
@interface NSColor (Colours)

#endif


#pragma mark - Enums
// Color Scheme Generation Enum
typedef NS_ENUM(NSInteger, ColorScheme) {
    ColorSchemeAnalagous,
    ColorSchemeMonochromatic,
    ColorSchemeTriad,
    ColorSchemeComplementary
};

// ColorFormulation Type
typedef NS_ENUM(NSInteger, ColorFormulation) {
    ColorFormulationRGBA,
    ColorFormulationHSBA,
    ColorFormulationLAB,
    ColorFormulationCMYK
};

// ColorDistance
typedef NS_ENUM(NSInteger, ColorDistance) {
    ColorDistanceCIE76,
    ColorDistanceCIE94,
    ColorDistanceCIE2000,
};

typedef NS_ENUM(NSInteger, ColorComparison) {
    ColorComparisonDarkness,
    ColorComparisonLightness,
    ColorComparisonDesaturated,
    ColorComparisonSaturated,
    ColorComparisonRed,
    ColorComparisonGreen,
    ColorComparisonBlue
};


#pragma mark - Color from Hex/RGBA/HSBA/CIE_LAB/CMYK
/**
 Creates a Color from a Hex representation string
 @param hexString   Hex string that looks like @"#FF0000" or @"FF0000"
 @return    Color
 */
+ (instancetype)colorFromHexString:(NSString *)hexString;

/**
 Creates a Color from an array of 4 NSNumbers (r,g,b,a)
 @param rgbaArray   4 NSNumbers for rgba between 0 - 1
 @return    Color
 */
+ (instancetype)colorFromRGBAArray:(NSArray *)rgbaArray;

/**
 Creates a Color from a dictionary of 4 NSNumbers
 Keys: kColoursRGBA_R, kColoursRGBA_G, kColoursRGBA_B, kColoursRGBA_A
 @param rgbaDictionary   4 NSNumbers for rgba between 0 - 1
 @return    Color
 */
+ (instancetype)colorFromRGBADictionary:(NSDictionary *)rgbaDict;

/**
 Creates a Color from an array of 4 NSNumbers (h,s,b,a)
 @param hsbaArray   4 NSNumbers for rgba between 0 - 1
 @return    Color
 */
+ (instancetype)colorFromHSBAArray:(NSArray *)hsbaArray;

/**
 Creates a Color from a dictionary of 4 NSNumbers
 Keys: kColoursHSBA_H, kColoursHSBA_S, kColoursHSBA_B, kColoursHSBA_A
 @param hsbaDictionary   4 NSNumbers for rgba between 0 - 1
 @return    Color
 */
+ (instancetype)colorFromHSBADictionary:(NSDictionary *)hsbaDict;

/**
 Creates a Color from an array of 4 NSNumbers (L,a,b,alpha)
 @param colors   4 NSNumbers for CIE_LAB between 0 - 1
 @return Color
 */
+ (instancetype)colorFromCIE_LabArray:(NSArray *)colors;

/**
 Creates a Color from a dictionary of 4 NSNumbers
 Keys: kColoursCIE_L, kColoursCIE_A, kColoursCIE_B, kColoursCIE_alpha
 @param colors   4 NSNumbers for CIE_LAB between 0 - 1
 @return Color
 */
+ (instancetype)colorFromCIE_LabDictionary:(NSDictionary *)colors;

/**
 Creates a Color from an array of 4 NSNumbers (L,a,b,alpha)
 @param colors   4 NSNumbers for CIE_LAB between 0 - 1
 @return Color
 */
+ (instancetype)colorFromCIE_LCHArray:(NSArray *)colors;

/**
 Creates a Color from a dictionary of 4 NSNumbers
 Keys: kColoursCIE_L, kColoursCIE_A, kColoursCIE_B, kColoursCIE_alpha
 @param colors   4 NSNumbers for CIE_LAB between 0 - 1
 @return Color
 */
+ (instancetype)colorFromCIE_LCHDictionary:(NSDictionary *)colors;

/**
 Creates a Color from an array of 4 NSNumbers (C,M,Y,K)
 @param colors   4 NSNumbers for CMYK between 0 - 1
 @return Color
 */
+ (instancetype)colorFromCMYKArray:(NSArray *)cmyk;

/**
 Creates a Color from a dictionary of 4 NSNumbers
 Keys: kColoursCMYK_C, kColoursCMYK_M, kColoursCMYK_Y, kColoursCMYK_K
 @param colors   4 NSNumbers for CMYK between 0 - 1
 @return Color
 */
+ (instancetype)colorFromCMYKDictionary:(NSDictionary *)cmyk;



#pragma mark - Hex/RGBA/HSBA/CIE_LAB/CMYK from Color
/**
 Creates a Hex representation from a Color
 @return    NSString
 */
- (NSString *)hexString;

/**
 Creates an array of 4 NSNumbers representing the float values of r, g, b, a in that order.
 @return    NSArray
 */
- (NSArray *)rgbaArray;

/**
 Creates an array of 4 NSNumbers representing the float values of h, s, b, a in that order.
 @return    NSArray
 */
- (NSArray *)hsbaArray;

/**
 Creates a dictionary of 4 NSNumbers representing float values with keys: kColoursRGBA_R, kColoursRGBA_G, kColoursRGBA_B, kColoursRGBA_A
 @return    NSDictionary
 */
- (NSDictionary *)rgbaDictionary;

/**
 Creates a dictionary of 4 NSNumbers representing float values with keys: kColoursHSBA_H, kColoursHSBA_S, kColoursHSBA_B, kColoursHSBA_A
 @return    NSDictionary
 */
- (NSDictionary *)hsbaDictionary;

/**
 *  Creates an array of 4 NSNumbers representing the float values of L*, a, b, alpha in that order.
 *
 *  @return NSArray
 */
- (NSArray *)CIE_LabArray;

/**
 *  Creates a dictionary of 4 NSNumbers representing the float values with keys: kColoursCIE_L, kColoursCIE_A, kColoursCIE_B, kColoursCIE_alpha
 *
 *  @return NSDictionary
 */
- (NSDictionary *)CIE_LabDictionary;

/**
 *  Creates an array of 4 NSNumbers representing the float values of L*, a, b, alpha in that order.
 *
 *  @return NSArray
 */
- (NSArray*)CIE_LCHArray;

/**
 *  Creates a dictionary of 4 NSNumbers representing the float values with keys: kColoursCIE_L, kColoursCIE_A, kColoursCIE_B, kColoursCIE_alpha
 *
 *  @return NSDictionary
 */
- (NSDictionary *)CIE_LCHDictionary;

/**
 *  Creates an array of 4 NSNumbers representing the float values of C, M, Y, K in that order.
 *
 *  @return NSArray
 */
- (NSArray *)cmykArray;

/**
 *  Creates a dictionary of 4 NSNumbers representing the float values with keys: kColoursCMYK_C, kColoursCMYK_M, kColoursCMYK_Y, kColoursCMYK_K
 *
 *  @return NSDictionary
 */
- (NSDictionary *)cmykDictionary;


#pragma mark - Color Components
/**
 *  Creates an NSDictionary with RGBA and HSBA color components inside.
 *
 *  @return NSDictionary
 */
- (NSDictionary *)colorComponents;

/**
 *  Returns the red value from an RGBA formulation of the UIColor.
 *
 *  @return CGFloat
 */
- (CGFloat)red;

/**
 *  Returns the green value from an RGBA formulation of the UIColor.
 *
 *  @return CGFloat
 */
- (CGFloat)green;

/**
 *  Returns the blue value from an RGBA formulation of the UIColor.
 *
 *  @return CGFloat
 */
- (CGFloat)blue;

/**
 *  Returns the hue value from an HSBA formulation of the UIColor.
 *
 *  @return CGFloat
 */
- (CGFloat)hue;

/**
 *  Returns the saturation value from an HSBA formulation of the UIColor.
 *
 *  @return CGFloat
 */
- (CGFloat)saturation;

/**
 *  Returns the brightness value from an HSBA formulation of the UIColor.
 *
 *  @return CGFloat
 */
- (CGFloat)brightness;

/**
 *  Returns the alpha value from an RGBA formulation of the UIColor.
 *
 *  @return CGFloat
 */
- (CGFloat)alpha;

/**
 *  Returns the lightness value from a CIELAB formulation of the UIColor.
 *
 *  @return CGFloat
 */
- (CGFloat)CIE_Lightness;

/**
 *  Returns the a value from a CIELAB formulation of the UIColor.
 *
 *  @return CGFloat
 */
- (CGFloat)CIE_a;

/**
 *  Returns the b value from a CIELAB formulation of the UIColor.
 *
 *  @return CGFloat
 */
- (CGFloat)CIE_b;

/**
 *  Returns the cyan value from a CMYK formulation of the UIColor.
 *
 *  @return CGFloat
 */
- (CGFloat)cyan;

/**
 *  Returns the magenta value from a CMYK formulation of the UIColor.
 *
 *  @return CGFloat
 */
- (CGFloat)magenta;

/**
 *  Returns the yellow value from a CMYK formulation of the UIColor.
 *
 *  @return CGFloat
 */
- (CGFloat)yellow;

/**
 *  Returns the black (K) value from a CMYK formulation of the UIColor.
 *
 *  @return CGFloat
 */
- (CGFloat)keyBlack;


#pragma mark - Darken/Lighten
/**
 *  Darkens a color by changing the brightness by a percentage you pass in. If you want a 25% darker color, you pass in 0.25;
 *
 *  @param percentage CGFloat
 *
 *  @return Color
 */
- (instancetype)darken:(CGFloat)percentage;

/**
 *  Lightens a color by changing the brightness by a percentage you pass in. If you want a 25% lighter color, you pass in 0.25;
 *
 *  @param percentage CGFloat
 *
 *  @return Color
 */
- (instancetype)lighten:(CGFloat)percentage;


#pragma mark - 4 Color Scheme from Color
/**
 Creates an NSArray of 4 Colors that complement the Color.
 @param type ColorSchemeAnalagous, ColorSchemeMonochromatic, ColorSchemeTriad, ColorSchemeComplementary
 @return    NSArray
 */
- (NSArray *)colorSchemeOfType:(ColorScheme)type;


#pragma mark - Contrasting Color from Color
/**
 Creates either [Color whiteColor] or [Color blackColor] depending on if the color this method is run on is dark or light.
 @return    Color
 */
- (instancetype)blackOrWhiteContrastingColor;


#pragma mark - Complementary Color
/**
 Creates a complementary color - a color directly opposite it on the color wheel.
 @return    Color
 */
- (instancetype)complementaryColor;


#pragma mark - Distance between Colors
/**
 *  Returns a float of the distance between 2 colors. Defaults to the
 *  CIE94 specification found here: http://en.wikipedia.org/wiki/Color_difference
 *
 *  @param color Color to check self with.
 *
 *  @return CGFloat
 */
- (CGFloat)distanceFromColor:(id)color;

/**
 *  Returns a float of the distance between 2 colors, using one of
 *
 *
 *  @param color        Color to check against
 *  @param distanceType Formula to calculate with
 *
 *  @return CGFloat
 */
- (CGFloat)distanceFromColor:(id)color type:(ColorDistance)distanceType;


#pragma mark - Compare Colors
+ (NSArray *)sortColors:(NSArray *)colors withComparison:(ColorComparison)comparison;
+ (NSComparisonResult)compareColor:(id)colorA andColor:(id)colorB withComparison:(ColorComparison)comparison;


#pragma mark - Colors
//-------- System Colors
/**
 *  System Colors 蓝色
 */
+ (instancetype)infoBlueColor;
/**
 *  System Colors 成功
 */
+ (instancetype)successColor;
/**
 *  System Colors 警告
 */
+ (instancetype)warningColor;
/**
 *  System Colors 危险
 */
+ (instancetype)dangerColor;

//----------- Whites 白色系
/**
 *  Whites白色系 古时的 古董白
 */
+ (instancetype)antiqueWhiteColor;
/**
 *  Whites白色系 花边
 */
+ (instancetype)oldLaceColor;
/**
 *  Whites白色系 象牙色
 */
+ (instancetype)ivoryColor;
/**
 *  Whites白色系  海贝壳
 */
+ (instancetype)seashellColor;
/**
 *  Whites白色系 阴影 灵魂 灰白
 */
+ (instancetype)ghostWhiteColor;
/**
 *  Whites白色系 雪
 */
+ (instancetype)snowColor;
/**
 *  Whites白色系 亚麻布
 */
+ (instancetype)linenColor;

//-------- Grays
/**
 *  Grays灰色系 灰度占25%
 */
+ (instancetype)black25PercentColor;
/**
 *  Grays灰色系 灰度占50%
 */
+ (instancetype)black50PercentColor;
/**
 *  Grays灰色系 灰度占75%
 */
+ (instancetype)black75PercentColor;
/**
 *  Grays灰色系 暖灰色
 */
+ (instancetype)warmGrayColor;
/**
 *  Grays灰色系 冷灰色
 */
+ (instancetype)coolGrayColor;
/**
 *  Grays灰色系 炭笔色 深灰色
 */
+ (instancetype)charcoalColor;

//-------- Blues
/**
 *  Blues蓝色系 蓝绿色
 */
+ (instancetype)tealColor;
/**
 *  Blues蓝色系 钢蓝色
 */
+ (instancetype)steelBlueColor;
/**
 *  Blues蓝色系 欧亚鸲
 */
+ (instancetype)robinEggColor;
/**
 *  Blues蓝色系 蜡笔蓝
 */
+ (instancetype)pastelBlueColor;
/**
 *  Blues蓝色系 青绿色 绿松石
 */
+ (instancetype)turquoiseColor;
/**
 *  Blues蓝色系 天蓝色
 */
+ (instancetype)skyBlueColor;
/**
 *  Blues蓝色系 靛蓝色
 */
+ (instancetype)indigoColor;
/**
 *  Blues蓝色系 蓝粗棉布 牛仔蓝
 */
+ (instancetype)denimColor;
/**
 *  Blues蓝色系 蓝莓色
 */
+ (instancetype)blueberryColor;
/**
 *  Blues蓝色系 矢车菊
 */
+ (instancetype)cornflowerColor;
/**
 *  Blues蓝色系 婴儿蓝
 */
+ (instancetype)babyBlueColor;
/**
 *  Blues蓝色系 午夜蓝
 */
+ (instancetype)midnightBlueColor;
/**
 *  Blues蓝色系 衰退 渐变
 */
+ (instancetype)fadedBlueColor;
/**
 *  Blues蓝色系 冰蓝色
 */
+ (instancetype)icebergColor;
/**
 *  Blues蓝色系 波浪色
 */
+ (instancetype)waveColor;

//------------- Greens
/**
 *  Greens绿色系 宝石绿
 */
+ (instancetype)emeraldColor;
/**
 *  Greens绿色系 草绿色
 */
+ (instancetype)grassColor;
/**
 *  Greens绿色系 蜡笔绿
 */
+ (instancetype)pastelGreenColor;
/**
 *  Greens绿色系 海泡绿
 */
+ (instancetype)seafoamColor;
/**
 *  Greens绿色系 苍白绿
 */
+ (instancetype)paleGreenColor;
/**
 *  Greens绿色系 仙人掌绿
 */
+ (instancetype)cactusGreenColor;
/**
 *  Greens绿色系 浅绿
 */
+ (instancetype)chartreuseColor;
/**
 *  Greens绿色系 冬青绿
 */
+ (instancetype)hollyGreenColor;
/**
 *  Greens绿色系 橄榄绿
 */
+ (instancetype)oliveColor;
/**
 *  Greens绿色系 橄榄绿 单色
 */
+ (instancetype)oliveDrabColor;
/**
 *  Greens绿色系
 */
+ (instancetype)moneyGreenColor;
/**
 *  Greens绿色系 蜜绿
 */
+ (instancetype)honeydewColor;
/**
 *  Greens绿色系
 */
+ (instancetype)limeColor;
/**
 *  Greens绿色系
 */
+ (instancetype)cardTableColor;

//------------------- Reds
/**
 *  Reds红色系
 */
+ (instancetype)salmonColor;
/**
 *  Reds红色系
 */
+ (instancetype)brickRedColor;
/**
 *  Reds红色系
 */
+ (instancetype)easterPinkColor;
/**
 *  Reds红色系
 */
+ (instancetype)grapefruitColor;
/**
 *  Reds红色系
 */
+ (instancetype)pinkColor;
/**
 *  Reds红色系
 */
+ (instancetype)indianRedColor;
/**
 *  Reds红色系
 */
+ (instancetype)strawberryColor;
/**
 *  Reds红色系
 */
+ (instancetype)coralColor;
/**
 *  Reds红色系
 */
+ (instancetype)maroonColor;
/**
 *  Reds红色系
 */
+ (instancetype)watermelonColor;
/**
 *  Reds红色系
 */
+ (instancetype)tomatoColor;
/**
 *  Reds红色系
 */
+ (instancetype)pinkLipstickColor;
/**
 *  Reds红色系
 */
+ (instancetype)paleRoseColor;
/**
 *  Reds红色系
 */
+ (instancetype)crimsonColor;

//------------- Purples
/**
 *  Purples紫色系
 */
+ (instancetype)eggplantColor;
/**
 *  Purples紫色系
 */
+ (instancetype)pastelPurpleColor;
/**
 *  Purples紫色系
 */
+ (instancetype)palePurpleColor;
/**
 *  Purples紫色系
 */
+ (instancetype)coolPurpleColor;
/**
 *  Purples紫色系
 */
+ (instancetype)violetColor;
/**
 *  Purples紫色系
 */
+ (instancetype)plumColor;
/**
 *  Purples紫色系
 */
+ (instancetype)lavenderColor;
/**
 *  Purples紫色系
 */
+ (instancetype)raspberryColor;
/**
 *  Purples紫色系
 */
+ (instancetype)fuschiaColor;
/**
 *  Purples紫色系
 */
+ (instancetype)grapeColor;
/**
 *  Purples紫色系
 */
+ (instancetype)periwinkleColor;
/**
 *  Purples紫色系
 */
+ (instancetype)orchidColor;

//---------------- Yellows
/**
 *  Yellow黄色系
 */
+ (instancetype)goldenrodColor;
/**
 *  Yellow黄色系
 */
+ (instancetype)yellowGreenColor;
/**
 *  Yellow黄色系
 */
+ (instancetype)bananaColor;
/**
 *  Yellow黄色系
 */
+ (instancetype)mustardColor;
/**
 *  Yellow黄色系
 */
+ (instancetype)buttermilkColor;
/**
 *  Yellow黄色系
 */
+ (instancetype)goldColor;
/**
 *  Yellow黄色系
 */
+ (instancetype)creamColor;
/**
 *  Yellow黄色系
 */
+ (instancetype)lightCreamColor;
/**
 *  Yellow黄色系
 */
+ (instancetype)wheatColor;
/**
 *  Yellow黄色系
 */
+ (instancetype)beigeColor;

//----------- Oranges

/**
 *  Oranges橘黄色系
 */
+ (instancetype)peachColor;
/**
 *  Oranges橘黄色系
 */
+ (instancetype)burntOrangeColor;
/**
 *  Oranges橘黄色系
 */
+ (instancetype)pastelOrangeColor;
/**
 *  Oranges橘黄色系
 */
+ (instancetype)cantaloupeColor;
/**
 *  Oranges橘黄色系
 */
+ (instancetype)carrotColor;
/**
 *  Oranges橘黄色系
 */
+ (instancetype)mandarinColor;

//---------------- Browns
/**
 *  Browns棕色系
 */
+ (instancetype)chiliPowderColor;
/**
 *  Browns棕色系
 */
+ (instancetype)burntSiennaColor;
/**
 *  Browns棕色系
 */
+ (instancetype)chocolateColor;
/**
 *  Browns棕色系
 */
+ (instancetype)coffeeColor;
/**
 *  Browns棕色系
 */
+ (instancetype)cinnamonColor;
/**
 *  Browns棕色系
 */
+ (instancetype)almondColor;
/**
 *  Browns棕色系
 */
+ (instancetype)eggshellColor;
/**
 *  Browns棕色系
 */
+ (instancetype)sandColor;
/**
 *  Browns棕色系
 */
+ (instancetype)mudColor;
/**
 *  Browns棕色系
 */
+ (instancetype)siennaColor;
/**
 *  Browns棕色系
 */
+ (instancetype)dustColor;

@end



@interface UIColor (SAMExtension)

+ (UIColor *)colorWithHex:(NSString *)hexColor;


@end


