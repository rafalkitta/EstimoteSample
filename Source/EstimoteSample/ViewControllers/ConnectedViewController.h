//
//  ConnectedViewController.h
//  EstimoteSample
//
//  Created by Rafał Kitta on 14.03.2014.
//  Copyright (c) 2014 Rafał Kitta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ESTBeacon.h>

@interface ConnectedViewController : UIViewController <ESTBeaconDelegate>

/**
 *  Initializes @c ConnectedViewController with beacon object.
 *
 *  @param beacon 
 *  ESTBeacon object.
 *
 *  @return An initialized ConnectedViewController.
 */
- (id)initWithBeacon:(ESTBeacon *)beacon;

@end
