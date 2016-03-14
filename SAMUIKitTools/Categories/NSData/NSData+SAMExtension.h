//
//  NSData+SAMExtension.h

#import <Foundation/Foundation.h>

@interface NSData (SAMExtension)

- (NSString *)hexString;
- (NSData *)SHA1Digest;

@end
