//
//  NSData+SAMExtension.h
//  Demo
//
//  Created by samiMac on 16/3/12.
//  Copyright © 2016年 wydatas. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (SAMExtension)

- (NSString *)hexString;
- (NSData *)SHA1Digest;

@end
