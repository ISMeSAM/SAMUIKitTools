//
//  NSString+SAMExtension.m
//  Demo
//
//  Created by samiMac on 16/3/9.
//  Copyright © 2016年 wydatas. All rights reserved.
//

#import "NSString+SAMExtension.h"

#import <CommonCrypto/CommonCrypto.h>

static NSString *const kyyyyMMddhhMMssString   = @"yyyy-MM-dd hh:MM:ss";
static NSString *const kyyyyMMddString         = @"yyyy-MM-dd";

static NSString *const kCheckTelNumber         = @"^1+[3578]+\\d{9}";
static NSString *const kCheckPassword          = @"^(?![0-9]+$)(?![a-zA-Z]+$)[a-zA-Z0-9]{6,18}";
static NSString *const kCheckUserName          = @"^[a-zA-Z\u4E00-\u9FA5]{1,50}";
static NSString *const kCheckUserIdCard        = @"(^[0-9]{15}$)|([0-9]{17}([0-9]|X)$)";
static NSString *const kCheckEmployeeNumber    = @"^[0-9]{12}";
static NSString *const kCheckURL               = @"^[0-9A-Za-z]{1,50}";
static NSString *const kCheckSmsCode           = @"^[0-9]{4}";
static NSString *const kCheakEmail             = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
static NSString *const kCheakNumber            = @"[1-9]+";


@interface SAMChecking : NSObject

@end

@implementation SAMChecking



+ (BOOL)checkTarget:(NSString *)target WithPattern:(NSString *)pattern
{
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",pattern];
    
    BOOL isMatch = [pred evaluateWithObject:target];
    
    return isMatch;
}


#pragma mark - 正则电话号码

+ (BOOL)checkTelNumber:(NSString*) telNumber
{
    return [self checkTarget:telNumber WithPattern:kCheckTelNumber];
}


#pragma 正则匹配用户密码6-18位数字和字母组合

+ (BOOL)checkPassword:(NSString*) password
{
    return [self checkTarget:password WithPattern:kCheckPassword];
}


#pragma 正则匹配用户姓名,50位的中文或英文

+ (BOOL)checkUserName : (NSString*) userName
{
    return [self checkTarget:userName WithPattern:kCheckUserName];
}


#pragma 正则匹配用户身份证号15或18位

+ (BOOL)checkUserIdCard: (NSString*) idCard
{
    return [self checkTarget:idCard WithPattern:kCheckUserIdCard];
}


#pragma 正则匹员工号,12位的数字

+ (BOOL)checkEmployeeNumber : (NSString*) number
{
    return [self checkTarget:number WithPattern:kCheckEmployeeNumber];
}


#pragma 正则匹配URL

+ (BOOL)checkURL : (NSString*) url
{
    return [self checkTarget:url WithPattern:kCheckURL];
}


#pragma mark - 正则匹配验证码

+ (BOOL)checkSmsCode:(NSString *)code
{
    return [self checkTarget:code WithPattern:kCheckSmsCode];
}


#pragma mark - 正则验证邮箱

+ (BOOL)checkEmail:(NSString *)email
{
    return [self checkTarget:email WithPattern:kCheakEmail];
}


#pragma mark - 正则数字 大于0

+ (BOOL)checkNumber:(NSString *)number
{
    return [self checkTarget:number WithPattern:kCheakNumber];
}


@end




@implementation NSString (SAMExtension)



- (NSDate *)date{
    
#if __LP64__ || (TARGET_OS_EMBEDDED && !TARGET_OS_IPHONE) || TARGET_OS_WIN32 || NS_BUILD_32_LIKE_64
    
    NSTimeInterval timeInterval = self.doubleValue;
#else
    NSTimeInterval timeInterval = self.floatValue;
#endif
    
    if (13 == self.length)
    {
        return [NSDate dateWithTimeIntervalSince1970:timeInterval/1000];
    }
    
    return [NSDate dateWithTimeIntervalSince1970:timeInterval];
    
}


- (NSString *)yyyyMMddhhMMssString
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    formatter.dateFormat = kyyyyMMddhhMMssString;
    
    NSDate *date = self.date;
    
    NSString *dateStr = [formatter stringFromDate:date];

    return dateStr;
}

- (NSString *)yyyyMMddString
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    formatter.dateFormat = kyyyyMMddString;
    
    NSDate *date = self.date;
    
    NSString *dateStr = [formatter stringFromDate:date];
    
    return dateStr;
}


- (NSString *)pinyinString
{
    NSAssert([self isKindOfClass:[NSString class]], @"必需是拼音字符串");
    
    if (self == nil)
    {
        return nil;
    }
    
    NSMutableString *pinyin = [self mutableCopy];
    CFStringTransform((__bridge CFMutableStringRef)pinyin, NULL, kCFStringTransformMandarinLatin, NO);
    CFStringTransform((__bridge CFMutableStringRef)pinyin, NULL, kCFStringTransformStripCombiningMarks, NO);
    
    return pinyin.capitalizedString;
}


- (BOOL)isWhitespace
{
    NSCharacterSet *whitespace = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    
    for (NSInteger i = 0 ; i < self.length ; ++i) {
        
        unichar c = [self characterAtIndex:i];

        if (![whitespace characterIsMember:c])
        {
            return NO;
        }
        
    }
    
    return YES;
}

- (BOOL)isEmptyOrWhitespace
{
    return !self.length || ![self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length;
}


- (BOOL)isTelNumber
{
    return [SAMChecking checkTelNumber:self];
}

- (BOOL)isPassword
{
    return [SAMChecking checkPassword:self];
}

- (BOOL)isUserName
{
    return [SAMChecking checkUserName:self];
}

- (BOOL)isUserIdCard
{
    return [SAMChecking checkUserIdCard:self];
}

- (BOOL)isEmployeeNumber
{
    return [SAMChecking checkEmployeeNumber:self];
}

- (BOOL)isURL
{
    return [SAMChecking checkURL:self];
}


- (BOOL)isSmsCode
{
    return [SAMChecking checkSmsCode:self];
}

- (BOOL)isEmail
{
    return [SAMChecking checkEmail:self];
}

- (BOOL)isNumber
{
    return [SAMChecking checkNumber:self];
}



- (BOOL)containsString:(NSString*)string
{
    return [self containsString:string options:NSCaseInsensitiveSearch];
}

- (BOOL)containsString:(NSString*)string options:(NSStringCompareOptions)options
{
    return [self rangeOfString:string options:options].location == NSNotFound ? NO : YES;
}





- (NSString *)URLDecodedString
{
    return (NSString *)CFBridgingRelease(CFURLCreateStringByReplacingPercentEscapesUsingEncoding(kCFAllocatorDefault,(CFStringRef)self,CFSTR(""),kCFStringEncodingUTF8));
}

- (NSString *)URLEncodeString
{
    return (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,(CFStringRef)self,NULL,CFSTR("!*'();:@&=+$,/?%#[]"),kCFStringEncodingUTF8));
}


+ (NSString *)replaceOccurrencesOfString:(NSString *)target
                              withString:(NSString *)replacement
                                 options:(NSStringCompareOptions)options
                            replaceArray:(NSArray *)replaceArray
{
    NSMutableString *tempStr = [NSMutableString stringWithString:target];

    for(int i = 0; i < [replaceArray count]; i++){
       
        NSRange range = [target rangeOfString:[replaceArray objectAtIndex:i]];
       
        if(range.location != NSNotFound){
            
            [tempStr replaceOccurrencesOfString:[replaceArray objectAtIndex:i]
                                     withString:replacement
                                        options:options
                                          range:NSMakeRange(0, [tempStr length])];
        }
    }
    return tempStr;
}



//NSURL解析地址里面各参数值
- (NSDictionary*)dictionaryFromQuery:(NSString*)query usingEncoding:(NSStringEncoding)encoding
{
    NSCharacterSet *delimiterSet = [NSCharacterSet characterSetWithCharactersInString:@"&;"];
   
    NSMutableDictionary *pairs = [NSMutableDictionary dictionary];
  
    NSScanner *scanner = [[NSScanner alloc] initWithString:query];
   
    while (![scanner isAtEnd])
    {
        NSString *pairString = nil;
      
        [scanner scanUpToCharactersFromSet:delimiterSet intoString:&pairString];
        [scanner scanCharactersFromSet:delimiterSet intoString:NULL];
       
        NSArray *kvPair = [pairString componentsSeparatedByString:@"="];
       
        if (kvPair.count == 2)
        {
            NSString *key = [[kvPair objectAtIndex:0] stringByReplacingPercentEscapesUsingEncoding:encoding];
           
            NSString *value = [[kvPair objectAtIndex:1] stringByReplacingPercentEscapesUsingEncoding:encoding];
            
            [pairs setObject:value forKey:key];
            
        }
        
    }
    
    return [NSDictionary dictionaryWithDictionary:pairs];
}

@end





@implementation NSString (Hash)

// - 原作者 刘凡
#pragma mark - 散列函数
- (NSString *)md5String {
    const char *str = self.UTF8String;
    uint8_t buffer[CC_MD5_DIGEST_LENGTH];
    
    CC_MD5(str, (CC_LONG)strlen(str), buffer);
    
    return [self stringFromBytes:buffer length:CC_MD5_DIGEST_LENGTH];
}

- (NSString *)sha1String {
    const char *str = self.UTF8String;
    uint8_t buffer[CC_SHA1_DIGEST_LENGTH];
    
    CC_SHA1(str, (CC_LONG)strlen(str), buffer);
    
    return [self stringFromBytes:buffer length:CC_SHA1_DIGEST_LENGTH];
}

- (NSString *)sha224String {
    const char *str = self.UTF8String;
    uint8_t buffer[CC_SHA224_DIGEST_LENGTH];
    
    CC_SHA224(str, (CC_LONG)strlen(str), buffer);
    
    return [self stringFromBytes:buffer length:CC_SHA224_DIGEST_LENGTH];
}

- (NSString *)sha256String {
    const char *str = self.UTF8String;
    uint8_t buffer[CC_SHA256_DIGEST_LENGTH];
    
    CC_SHA256(str, (CC_LONG)strlen(str), buffer);
    
    return [self stringFromBytes:buffer length:CC_SHA256_DIGEST_LENGTH];
}

- (NSString *)sha384String {
    const char *str = self.UTF8String;
    uint8_t buffer[CC_SHA384_DIGEST_LENGTH];
    
    CC_SHA384(str, (CC_LONG)strlen(str), buffer);
    
    return [self stringFromBytes:buffer length:CC_SHA384_DIGEST_LENGTH];
}

- (NSString *)sha512String {
    const char *str = self.UTF8String;
    uint8_t buffer[CC_SHA512_DIGEST_LENGTH];
    
    CC_SHA512(str, (CC_LONG)strlen(str), buffer);
    
    return [self stringFromBytes:buffer length:CC_SHA512_DIGEST_LENGTH];
}

#pragma mark - HMAC 散列函数
- (NSString *)hmacMD5StringWithKey:(NSString *)key {
    const char *keyData = key.UTF8String;
    const char *strData = self.UTF8String;
    uint8_t buffer[CC_MD5_DIGEST_LENGTH];
    
    CCHmac(kCCHmacAlgMD5, keyData, strlen(keyData), strData, strlen(strData), buffer);
    
    return [self stringFromBytes:buffer length:CC_MD5_DIGEST_LENGTH];
}

- (NSString *)hmacSHA1StringWithKey:(NSString *)key {
    const char *keyData = key.UTF8String;
    const char *strData = self.UTF8String;
    uint8_t buffer[CC_SHA1_DIGEST_LENGTH];
    
    CCHmac(kCCHmacAlgSHA1, keyData, strlen(keyData), strData, strlen(strData), buffer);
    
    return [self stringFromBytes:buffer length:CC_SHA1_DIGEST_LENGTH];
}

- (NSString *)hmacSHA256StringWithKey:(NSString *)key {
    const char *keyData = key.UTF8String;
    const char *strData = self.UTF8String;
    uint8_t buffer[CC_SHA256_DIGEST_LENGTH];
    
    CCHmac(kCCHmacAlgSHA256, keyData, strlen(keyData), strData, strlen(strData), buffer);
    
    return [self stringFromBytes:buffer length:CC_SHA256_DIGEST_LENGTH];
}

- (NSString *)hmacSHA512StringWithKey:(NSString *)key {
    const char *keyData = key.UTF8String;
    const char *strData = self.UTF8String;
    uint8_t buffer[CC_SHA512_DIGEST_LENGTH];
    
    CCHmac(kCCHmacAlgSHA512, keyData, strlen(keyData), strData, strlen(strData), buffer);
    
    return [self stringFromBytes:buffer length:CC_SHA512_DIGEST_LENGTH];
}

#pragma mark - 文件散列函数

#define FileHashDefaultChunkSizeForReadingData 4096

- (NSString *)fileMD5Hash {
    NSFileHandle *fp = [NSFileHandle fileHandleForReadingAtPath:self];
    if (fp == nil) {
        return nil;
    }
    
    CC_MD5_CTX hashCtx;
    CC_MD5_Init(&hashCtx);
    
    while (YES) {
        @autoreleasepool {
            NSData *data = [fp readDataOfLength:FileHashDefaultChunkSizeForReadingData];
            
            CC_MD5_Update(&hashCtx, data.bytes, (CC_LONG)data.length);
            
            if (data.length == 0) {
                break;
            }
        }
    }
    [fp closeFile];
    
    uint8_t buffer[CC_MD5_DIGEST_LENGTH];
    CC_MD5_Final(buffer, &hashCtx);
    
    return [self stringFromBytes:buffer length:CC_MD5_DIGEST_LENGTH];
}

- (NSString *)fileSHA1Hash {
    NSFileHandle *fp = [NSFileHandle fileHandleForReadingAtPath:self];
    if (fp == nil) {
        return nil;
    }
    
    CC_SHA1_CTX hashCtx;
    CC_SHA1_Init(&hashCtx);
    
    while (YES) {
        @autoreleasepool {
            NSData *data = [fp readDataOfLength:FileHashDefaultChunkSizeForReadingData];
            
            CC_SHA1_Update(&hashCtx, data.bytes, (CC_LONG)data.length);
            
            if (data.length == 0) {
                break;
            }
        }
    }
    [fp closeFile];
    
    uint8_t buffer[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1_Final(buffer, &hashCtx);
    
    return [self stringFromBytes:buffer length:CC_SHA1_DIGEST_LENGTH];
}

- (NSString *)fileSHA256Hash {
    NSFileHandle *fp = [NSFileHandle fileHandleForReadingAtPath:self];
    if (fp == nil) {
        return nil;
    }
    
    CC_SHA256_CTX hashCtx;
    CC_SHA256_Init(&hashCtx);
    
    while (YES) {
        @autoreleasepool {
            NSData *data = [fp readDataOfLength:FileHashDefaultChunkSizeForReadingData];
            
            CC_SHA256_Update(&hashCtx, data.bytes, (CC_LONG)data.length);
            
            if (data.length == 0) {
                break;
            }
        }
    }
    [fp closeFile];
    
    uint8_t buffer[CC_SHA256_DIGEST_LENGTH];
    CC_SHA256_Final(buffer, &hashCtx);
    
    return [self stringFromBytes:buffer length:CC_SHA256_DIGEST_LENGTH];
}

- (NSString *)fileSHA512Hash {
    NSFileHandle *fp = [NSFileHandle fileHandleForReadingAtPath:self];
    if (fp == nil) {
        return nil;
    }
    
    CC_SHA512_CTX hashCtx;
    CC_SHA512_Init(&hashCtx);
    
    while (YES) {
        @autoreleasepool {
            NSData *data = [fp readDataOfLength:FileHashDefaultChunkSizeForReadingData];
            
            CC_SHA512_Update(&hashCtx, data.bytes, (CC_LONG)data.length);
            
            if (data.length == 0) {
                break;
            }
        }
    }
    [fp closeFile];
    
    uint8_t buffer[CC_SHA512_DIGEST_LENGTH];
    CC_SHA512_Final(buffer, &hashCtx);
    
    return [self stringFromBytes:buffer length:CC_SHA512_DIGEST_LENGTH];
}

#pragma mark - 助手方法
/**
 *  返回二进制 Bytes 流的字符串表示形式
 *
 *  @param bytes  二进制 Bytes 数组
 *  @param length 数组长度
 *
 *  @return 字符串表示形式
 */
- (NSString *)stringFromBytes:(uint8_t *)bytes length:(int)length {
    NSMutableString *strM = [NSMutableString string];
    
    for (int i = 0; i < length; i++) {
        [strM appendFormat:@"%02x", bytes[i]];
    }
    
    return [strM copy];
}

@end












