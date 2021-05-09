#import "LeaderBoardTracker.h"

@interface LeaderBoardTracker()

@property (nonatomic, strong) NSArray <NSNumber *> *playersPlaces;

@end

@implementation LeaderBoardTracker

- (NSArray <NSNumber *> *)trackLeaderBoard:(NSArray <NSNumber *> *)rankedArray
                               playerArray:(NSArray <NSNumber *> *)playerArray {

    NSMutableArray *myScore = [[NSMutableArray alloc] initWithCapacity:playerArray.count];
    if (rankedArray.count == 0) {
        for (int i = 0; i < playerArray.count; i++) {
            [myScore addObject:[NSNumber numberWithInt:1]];
        }
        return myScore;
    }
    
    NSMutableArray<NSNumber *> *places = [[NSMutableArray alloc] init];
    [places addObject:rankedArray[0]];
    for (int i = 0; i < rankedArray.count-1; i++) {
        if (rankedArray[i].intValue != rankedArray[i+1].intValue) {
            [places addObject:rankedArray[i+1]];
        }
    }
    
    unsigned long placesCount = places.count;
    for (NSNumber *score in playerArray) {
        if (score.intValue >= places[0].intValue) {
            [myScore addObject:[NSNumber numberWithLong:1]];
            continue;
        }
        if ((score.intValue < places[0].intValue) && (placesCount == 1)) {
            [myScore addObject:[NSNumber numberWithLong:2]];
            continue;
        }
        if (score.intValue < places[placesCount - 1].intValue) {
            [myScore addObject:[NSNumber numberWithLong:(placesCount + 1)]];
            continue;
        }
        if (score.intValue == places[placesCount - 1].intValue) {
            [myScore addObject:[NSNumber numberWithLong:(placesCount)]];
            continue;
        }
        
        for (long i = placesCount-1; i > 0; i--) {
            if (score.intValue == places[i].intValue) {
                [myScore addObject:[NSNumber numberWithLong:(i + 1)]];
                continue;
            }
            if ((score.intValue > places[i].intValue) && (score.intValue < places[i-1].intValue)) {
                [myScore addObject:[NSNumber numberWithLong:(i + 1)]];
                continue;
            }
        }
    }
    return myScore;
}

@end
