#import "NSArray+MinRotated.h"

@implementation NSArray (MinRotated)

- (NSNumber *)minRotated {
    NSNumber *first = self.firstObject;
    NSNumber *last = self.lastObject;
    if (first.intValue <= last.intValue) {
        return first;
    }
    
    long l = 0;
    long r = self.count - 1;

    while (l < r) {
        long mid = l + (r - l)/2;
        NSNumber *midValue = self[mid];
        if(midValue.intValue > last.intValue)
        {
            l = mid + 1;
        }
        else
        {
            r = mid;
        }
    }
    return self[l];
}

@end
