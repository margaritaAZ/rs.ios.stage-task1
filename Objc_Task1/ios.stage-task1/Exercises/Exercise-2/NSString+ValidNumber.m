#import "NSString+ValidNumber.h"

@implementation NSString (ValidNumber)

- (BOOL)isValidNumber {
    if (self.length < 0 || self.length > 100) {
        return false;
    }
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = NSNumberFormatterNoStyle;
    NSNumber *myNumber = [formatter numberFromString:self];
    
    if (!myNumber) {
        return false;
    } else
        return true;
}

@end
