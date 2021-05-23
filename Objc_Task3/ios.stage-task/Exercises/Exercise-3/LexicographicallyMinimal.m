#import "LexicographicallyMinimal.h"

@interface LexicographicallyMinimal()

@property (nonatomic, strong) NSMutableString *resultString;

@end

@implementation LexicographicallyMinimal

-(NSString *)findLexicographicallyMinimalForString1:(NSString *)string1 andString2:(NSString *)string2 {
    NSMutableString *mutableString1 = [NSMutableString stringWithString:string1];
    NSMutableString *mutableString2 = [NSMutableString stringWithString:string2];
    NSMutableString *result = [[NSMutableString alloc] init];
    
    NSRange first = NSMakeRange(0, 1);

    
    while ((mutableString1.length != 0) && (mutableString2.length != 0)) {
        
        char ch1 = [mutableString1 characterAtIndex:0];
        char ch2 = [mutableString2 characterAtIndex:0];
                
        if (ch1 <= ch2) {
            [result appendFormat:@"%c", ch1];
            [mutableString1 deleteCharactersInRange:first];
        } else {
            [result appendFormat:@"%c", ch2];
            [mutableString2 deleteCharactersInRange:first];
        }
    }
    
    if (mutableString1.length == 0) {
        [result appendString:mutableString2];
    } else {
        [result appendString:mutableString1];
    }
    
    return result;
}

@end
