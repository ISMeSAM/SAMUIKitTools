//
//  NSDate+SAMExtension.m


#import "NSDate+SAMExtension.h"

@interface NSDate ()

@property (nonatomic , strong , readonly) NSDate *yearMonthDay_date;

@end

@implementation NSDate (SAMExtension)

/**
 *  时间戳
 */
- (NSString *)timeStamp{
    
    NSTimeInterval timeInterval = [self timeIntervalSince1970];
    
    NSString *timeString = [NSString stringWithFormat:@"%.0f",timeInterval];
    
    return [timeString copy];
}


- (BOOL)isThisYear{
    
    NSDateComponents *dateComponents = self.components;
    
    NSDateComponents *nowComponents = [NSDate date].components;
    
    return (dateComponents.year == nowComponents.year);
}

- (BOOL)isNextyear
{
    return [self calculateWithYear:-1 month:0 day:0];
}

- (BOOL)isLastyear
{
    return [self calculateWithYear:1 month:0 day:0];
}

- (BOOL)isToday
{
    return [self calculateWithYear:0 month:0 day:0];
}

- (BOOL)isYesterday
{
    return [self calculateWithYear:0 month:0 day:1];
}



- (NSDateComponents *)components{
    
    // 当前日历
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    // 定义成分 年月日时分秒
    NSCalendarUnit unit = kCFCalendarUnitYear | kCFCalendarUnitMonth | kCFCalendarUnitDay | kCFCalendarUnitHour | kCFCalendarUnitMinute | kCFCalendarUnitSecond;
    
    return [calendar components:unit fromDate:self];
}



/**
 *  将时间戳装换为年月日
 *
 *  @return 年月日 的 时间对象
 */
- (NSDate *)yearMonthDay_date{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    formatter.dateFormat = @"yyyy-MM-dd";
    
    NSString *dateString = [formatter stringFromDate:self];
    
    return [formatter dateFromString:dateString];
}


- (BOOL)calculateWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day {
    
    NSDateComponents *dateComponents = self.yearMonthDay_date.components;
    
    NSDateComponents *nowComponents = [NSDate date].yearMonthDay_date.components;
    
    return ((dateComponents.year + year) == nowComponents.year && (dateComponents.month + month) == nowComponents.month && (dateComponents.day + day) == nowComponents.day);
    
}



- (NSString *)yyyyMMddhhMMssString
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    formatter.dateFormat = @"yyyy-MM-dd hh:MM:ss";
    
    NSString *dateStr = [formatter stringFromDate:self];
    
    return dateStr;
}


- (NSString *)yyyyMMddString
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    formatter.dateFormat = @"yyyy-MM-dd";
    
    NSString *dateStr = [formatter stringFromDate:self];
    
    return dateStr;
}



@end
