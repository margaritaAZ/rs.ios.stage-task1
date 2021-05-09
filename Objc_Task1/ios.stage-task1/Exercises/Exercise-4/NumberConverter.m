#import "NumberConverter.h"

@implementation NumberConverter

- (NSArray *)numberConverter:(NSNumber *)number {
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = NSNumberFormatterNoStyle;
    NSString *numberStr = [formatter stringFromNumber:number];
    
    NSUInteger len = [numberStr length];
    NSMutableArray *result = [[NSMutableArray alloc]init];
    while (len > 0) {
        NSString* c = [numberStr substringWithRange:NSMakeRange(len-1, 1)];
        len--;
        if (![c  isEqual: @"-"]) {
            [result addObject:c];
        }
    }
    return result;
}

@end
