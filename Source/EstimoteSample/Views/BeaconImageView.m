//
//  BeaconImageView.m
//  EstimoteSample
//
//  Created by Rafał Kitta on 10.03.2014.
//  Copyright (c) 2014 Rafał Kitta. All rights reserved.
//

#import "BeaconImageView.h"

@implementation BeaconImageView{
    float _posMin;
    float _posRange;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)changeYCoordinate:(NSNumber *)newY{
    _posMin = 150.f;
    _posRange = [UIScreen mainScreen].bounds.size.height - 180.f;

    double distFactor = ([newY floatValue] + 30) / -70;
    
    // calculate and set new y position
    double newYPos = _posMin + distFactor * _posRange;
    NSNumber *floatObj = [NSNumber numberWithFloat:newYPos];
    
    [_delegate performSelector:@selector(changePosition:)
                    withObject:floatObj];
}

@end
