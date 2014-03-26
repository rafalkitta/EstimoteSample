//
//  BeaconImageView.h
//  EstimoteSample
//
//  Created by Rafał Kitta on 10.03.2014.
//  Copyright (c) 2014 Rafał Kitta. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BeaconImageView;

@protocol BeaconImageViewDelegate<NSObject>
/**
 *  Method changes the position of beacon image. For example: 
 *  @code
    -(void)changePosition:(NSNumber *)newY{
        _beaconImageView.center = CGPointMake(self.bounds.size.width / 2, [newY doubleValue]);
    }
 *  @endcode
 *
 *  @param newY
 *  New(recalculated) Y coordinate.
 */
-(void)changePosition:(NSNumber *)newY;

@end

/**
 *  BeaconImageView to represent image with beacon. It receives a changes in Y coordinate via @c BeaconImageViewDelegate.
 */
@interface BeaconImageView : UIImageView

@property (nonatomic, weak) id<BeaconImageViewDelegate> delegate;

/**
 *  Method calculates and changes Y coordinate. Sends the result to delegate method @c -changePosition:newY.
 *
 *  @param newY 
 *  New Y coordinate.
 *
 *  @see -changePosition:newY
 */
- (void)changeYCoordinate:(NSNumber *)newY;

@end
