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
    _posRange = [UIScreen mainScreen].bounds.size.height - 220.f; //jak zrobić z tego stałą?

    float distFactor = ([newY floatValue] + 30) / -70;
    
    // calculate and set new y position
    float newYPos = _posMin + distFactor * _posRange;
    NSNumber *floatObj = [NSNumber numberWithFloat:newYPos];
    
    [_delegate performSelector:@selector(changePosition:)
                    withObject:floatObj];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
