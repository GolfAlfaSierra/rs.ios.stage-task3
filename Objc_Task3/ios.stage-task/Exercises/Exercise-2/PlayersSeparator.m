#import "PlayersSeparator.h"

@implementation PlayersSeparator

- (NSInteger)dividePlayersIntoTeams:(NSArray<NSNumber *>*)ratingArray {
    NSInteger result = 0;
    
    if (ratingArray.count < 3 || ratingArray == nil) {
        result = 0;
        return result;
    }
    
    int lastIndex = (int)ratingArray.count -1;
    int counter = 0;
    
    for (int i = 0; i <= lastIndex; ++i) {
        
        for (int j = 1 + i; j <= lastIndex; ++j) {
            
            for (int k = 1 + j; k <= lastIndex; ++k) {
                
                int v1 = [ratingArray[i] intValue];
                int v2 = [ratingArray[j] intValue];
                int v3 = [ratingArray[k] intValue];
                
                
                
                if (0 <= i < j < k < ratingArray.count && ((v1 < v2) && (v2 < v3))) {
                    ++counter;
                }
                
                if (0 <= i < j < k < ratingArray.count && ((v1 > v2) && (v2 > v3))) {
                    ++counter;
                }
            }
        }
        
    }
    
    result = counter;
    
    return result;
}

@end
