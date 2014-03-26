//
//  MyBeaconManager.h
//  EstimoteSample
//
//  Created by Rafał Kitta on 3/26/14.
//  Copyright (c) 2014 Rafał Kitta. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ESTBeaconManager.h>

// The name of the notification that we are going to send
extern NSString * const kBeaconsInfoNotification;
// The array of all beacons key in the user-info dictionary
extern NSString * const kBeaconsInfoKeyArrayOfAll;
// The new y coordinate key in the user-info dictionary
extern NSString * const kBeaconsInfoKeyNewY;
// The label string key in the user-info dictionary
extern NSString * const kBeaconsInfoKeyLabelString;

@interface MyBeaconManager : NSObject <ESTBeaconManagerDelegate>

/**
 *  Implementation of Singleton Pattern. 
 *
 *  @return The only one instance of the aplication live cycle.
 */
+ (instancetype)sharedInstance;

@end
