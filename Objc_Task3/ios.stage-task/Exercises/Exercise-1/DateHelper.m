#import "DateHelper.h"

@implementation DateHelper

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber {
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    
    if ((monthNumber >= 1) && (monthNumber <= 12)) {
        NSString *monthName = [[df monthSymbols] objectAtIndex:(monthNumber-1)];
        return monthName;
    }
    
    return nil;
}

#pragma mark - Second

- (long)dayFromDate:(NSString *)date {
    
    NSISO8601DateFormatter *df = [[NSISO8601DateFormatter alloc] init];
    
    NSDate *da = [df dateFromString:date];
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitDay fromDate:da];
    
    return [components day];
}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"EE";
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ru_RU"];
    return [dateFormatter stringFromDate:date];
}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date {
    
    NSDate *begin = [self beginingOfWeekOfDate];
    NSDate *end   = [self endOfWeekFromDate];
    
    double startBoundTimeStamp = [begin timeIntervalSince1970];
    double endBoundTimeStamp = [end timeIntervalSince1970];
    double dateTimeStamp = [date timeIntervalSince1970];
    
    BOOL result = NO;
    
    if ((dateTimeStamp >= startBoundTimeStamp) && (dateTimeStamp <= endBoundTimeStamp)) {
        result = YES;
    }
    
    
    return result;
}

- (NSDate*) beginingOfWeekOfDate{
    NSDate *now = [NSDate date];
    
    NSCalendar *tmpCalendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [tmpCalendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitWeekOfYear|NSCalendarUnitWeekday fromDate:now];//get the required calendar units
    
    NSInteger weekday = tmpCalendar.firstWeekday;
    components.weekday = weekday; //weekday
    components.hour = 0;
    components.minute = 0;
    components.second = 0;
    
    NSDate *fireDate = [tmpCalendar dateFromComponents:components];
    
    return fireDate;
}

//End of Week Date

-(NSDate *)endOfWeekFromDate{
    
    NSDate *now = [NSDate date];
    
    NSCalendar *tmpCalendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [tmpCalendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitWeekOfYear|NSCalendarUnitWeekday fromDate:now];//get the required calendar units
    
    int weekday = 7; //Saturday
    if (tmpCalendar.firstWeekday != 1) {
        weekday = 1;
    }
    components.weekday = weekday;//weekday
    components.hour = 23;
    components.minute = 59;
    components.second = 59;
    
    NSDate *fireDate = [tmpCalendar dateFromComponents:components];
    
    return fireDate;
}

@end
