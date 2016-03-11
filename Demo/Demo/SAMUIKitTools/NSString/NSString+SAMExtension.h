//
//  NSString+SAMExtension.h
//  Demo
//
//  Created by samiMac on 16/3/9.
//  Copyright © 2016年 wydatas. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface NSString (SAMExtension)

/** 时间戳对应的日期对象 */
@property (nonatomic , strong , readonly) NSDate *date;

/** 时间戳对应的日期字符串 yyyy-MM-dd hh:MM:ss */
@property (nonatomic , strong , readonly) NSString *yyyyMMddhhMMssString;

/** 时间戳对应的日期字符串 yyyy-MM-dd */
@property (nonatomic , strong , readonly) NSString *yyyyMMddString;

/** 中文的拼音字符串 每个单词的首字符大写 如 'Bei Jing' */
@property (nonatomic , copy, readonly) NSString *pinyinString ;

/** 检验是否是空格 */
@property (nonatomic , assign, readonly) BOOL isWhitespace;

/** 检验是否是空(空字符串)或者是空格 */
@property (nonatomic , assign, readonly) BOOL isEmptyOrWhitespace;



#pragma mark - Checking

/** 正则匹配手机号 */
@property (nonatomic , assign, readonly) BOOL isTelNumber;

/** 正则匹配用户密码6-18位数字和字母组合 */
@property (nonatomic , assign, readonly) BOOL isPassword;

/** 正则匹配用户姓名,50位的中文或英文 */
@property (nonatomic , assign, readonly) BOOL isUserName;

/** 正则匹配用户身份证号 */
@property (nonatomic , assign, readonly) BOOL isUserIdCard;

/** 正则匹员工号,12位的数字 */
@property (nonatomic , assign, readonly) BOOL isEmployeeNumber;

/** 正则匹配URL */
@property (nonatomic , assign, readonly) BOOL isURL;

/** 正则匹配验证码 */
@property (nonatomic , assign, readonly) BOOL isSmsCode;

/** 正则邮箱 */
@property (nonatomic , assign, readonly) BOOL isEmail;

/** 正则大于0的数字 */
@property (nonatomic , assign, readonly) BOOL isNumber;




/**
 *  URL编码解码
 */
- (NSString *)URLEncodeString;
- (NSString *)URLDecodedString;

/**
 *  是否包含某个字符串
 */
- (BOOL)containsString:(NSString*)string ;
- (BOOL)containsString:(NSString*)string options:(NSStringCompareOptions)options ;


/**
 *  字符串筛选,去掉不需要的特殊字符串
 *
 *  使用方法:replaceOccurrencesOfString:@"1(2*3" withString:@"" options:2 replaceArray:[NSArray arrayWithObjects:@"(",@"*", nil]  输出:123
 *
 *  @param target        原字符串
 *  @param replacement   需要替换的字符串
 *  @param options       默认传2:NSLiteralSearch,区分大小写
 *  @param replaceArray 需要排除的项(Array)
 *
 *  @return 筛选后的字符串
 */
+ (NSString *)replaceOccurrencesOfString:(NSString *)target
                              withString:(NSString *)replacement
                                 options:(NSStringCompareOptions)options
                            replaceArray:(NSArray *)replaceArray;



/**
 *  NSURL解析地址里面各参数值
 *
 *  @param query
 *  @param encoding
 *
 *  @return
 */
//- (NSDictionary*)dictionaryFromQuery:(NSString*)query usingEncoding:(NSStringEncoding)encoding ;







@end



@interface NSString (Hash)

#pragma mark - 散列函数
/**
 *  计算MD5散列结果
 *
 *  终端测试命令：
 *  @code
 *  md5 -s "string"
 *  @endcode
 *
 *  <p>提示：随着 MD5 碰撞生成器的出现，MD5 算法不应被用于任何软件完整性检查或代码签名的用途。<p>
 *
 *  @return 32个字符的MD5散列字符串
 */
- (NSString *)md5String;

/**
 *  计算SHA1散列结果
 *
 *  终端测试命令：
 *  @code
 *  echo -n "string" | openssl sha -sha1
 *  @endcode
 *
 *  @return 40个字符的SHA1散列字符串
 */
- (NSString *)sha1String;

/**
 *  计算SHA224散列结果
 *
 *  终端测试命令：
 *  @code
 *  echo -n "string" | openssl sha -sha224
 *  @endcode
 *
 *  @return 56个字符的SHA224散列字符串
 */
- (NSString *)sha224String;

/**
 *  计算SHA256散列结果
 *
 *  终端测试命令:
 *  @code
 *  echo -n "string" | openssl sha -sha256
 *  @endcode
 *
 *  @return 64个字符的SHA256散列字符串
 */
- (NSString *)sha256String;

/**
 *  计算SHA 384散列结果
 *
 *  终端测试命令：
 *  @code
 *  echo -n "string" | openssl sha -sha384
 *  @endcode
 *
 *  @return 96个字符的SHA 384散列字符串
 */
- (NSString *)sha384String;

/**
 *  计算SHA 512散列结果
 *
 *  终端测试命令：
 *  @code
 *  echo -n "string" | openssl sha -sha512
 *  @endcode
 *
 *  @return 128个字符的SHA 512散列字符串
 */
- (NSString *)sha512String;

#pragma mark - HMAC 散列函数
/**
 *  计算HMAC MD5散列结果
 *
 *  终端测试命令：
 *  @code
 *  echo -n "string" | openssl dgst -md5 -hmac "key"
 *  @endcode
 *
 *  @return 32个字符的HMAC MD5散列字符串
 */
- (NSString *)hmacMD5StringWithKey:(NSString *)key;

/**
 *  计算HMAC SHA1散列结果
 *
 *  终端测试命令：
 *  @code
 *  echo -n "string" | openssl sha -sha1 -hmac "key"
 *  @endcode
 *
 *  @return 40个字符的HMAC SHA1散列字符串
 */
- (NSString *)hmacSHA1StringWithKey:(NSString *)key;

/**
 *  计算HMAC SHA256散列结果
 *
 *  终端测试命令：
 *  @code
 *  echo -n "string" | openssl sha -sha256 -hmac "key"
 *  @endcode
 *
 *  @return 64个字符的HMAC SHA256散列字符串
 */
- (NSString *)hmacSHA256StringWithKey:(NSString *)key;

/**
 *  计算HMAC SHA512散列结果
 *
 *  终端测试命令：
 *  @code
 *  echo -n "string" | openssl sha -sha512 -hmac "key"
 *  @endcode
 *
 *  @return 128个字符的HMAC SHA512散列字符串
 */
- (NSString *)hmacSHA512StringWithKey:(NSString *)key;

#pragma mark - 文件散列函数

/**
 *  计算文件的MD5散列结果
 *
 *  终端测试命令：
 *  @code
 *  md5 file.dat
 *  @endcode
 *
 *  @return 32个字符的MD5散列字符串
 */
- (NSString *)fileMD5Hash;

/**
 *  计算文件的SHA1散列结果
 *
 *  终端测试命令：
 *  @code
 *  openssl sha -sha1 file.dat
 *  @endcode
 *
 *  @return 40个字符的SHA1散列字符串
 */
- (NSString *)fileSHA1Hash;

/**
 *  计算文件的SHA256散列结果
 *
 *  终端测试命令：
 *  @code
 *  openssl sha -sha256 file.dat
 *  @endcode
 *
 *  @return 64个字符的SHA256散列字符串
 */
- (NSString *)fileSHA256Hash;

/**
 *  计算文件的SHA512散列结果
 *
 *  终端测试命令：
 *  @code
 *  openssl sha -sha512 file.dat
 *  @endcode
 *
 *  @return 128个字符的SHA512散列字符串
 */
- (NSString *)fileSHA512Hash;





@end






