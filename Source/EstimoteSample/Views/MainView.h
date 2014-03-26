//
//  MainView.h
//  EstimoteSample
//
//  Created by Rafał Kitta on 07.03.2014.
//  Copyright (c) 2014 Rafał Kitta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BeaconImageView.h"

@interface MainView : UIView <BeaconImageViewDelegate>

@property (nonatomic) UILabel *label;

/**
 *  BeaconImageView to represent image with beacon. It receives a changes in Y coordinate via @c BeaconImageViewDelegate. 
 */
@property (nonatomic, strong) BeaconImageView *beaconImageView;


@end
