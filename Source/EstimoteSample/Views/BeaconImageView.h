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
-(void)changePosition:(NSNumber *)newY;
@end

@interface BeaconImageView : UIImageView

@property (nonatomic, weak) id<BeaconImageViewDelegate> delegate;

- (void)changeYCoordinate:(NSNumber *)newY;

@end
